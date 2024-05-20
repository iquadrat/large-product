/* compile with:

g++ -std=c++11 -O3 -funroll-loops -march=native -lm -o monte_carlo_LUE vandermonde_det.cpp monte_carlo_LUE.cpp  

*/

/* Version history:
TODO: Power specturm is wrong: particles has to be sorted (for sorting, see spacings, there we also sort particles)

1.2.0	Changed to Laguerre unitary ensemble (LUE) 
1.1.1	Implemented form factor calculation (and power spectrum, not finished)
1.0.1	Corrected error when allocating memory for the particles used with the Vandermonde library:  particles(new_double_array(N)) 
1.0.0	Inital version

monte_carlo_Bures-Hall-UC.cpp: based on monte_carlo_Bures-Hall.cpp
monte_carlo_Bures-Hall.cpp: based on monte_carlo_1d_fixed_charges-7.5.2.cpp

*/

#define VERSION "1.2.2"
#define OUTFORMAT "%.15lf " 
#define FWRITE "w"
#define FAPPEND "a"
// ******************** FLAGS *******************************************
//#define OPENCLOSE
#define EXPINT int
#define WARNOOB
//#define COUNTOVERUNDERFLOW
#define TRAJSTAT
#define MOVESTAT
#define MOVESTATPERM
#define UPDATESTAT
#define ENERGYMINMAX
#define MOMENT

#define RECORDEDSAMPLESDISTRIBUTED
#define MAXMEMORYUNFOLDEDSPACINGS 1*1024*1024*1024

//#define DEBUG
#define EQUPDATE 20
#define MEASUPDATE 20

// save binning for 1D density
#define BINSDENSITY 10000
#define BINSDENSITYX _N*10.0

// save binning of spacings (only works for not unfolded spacings)
//#define BINSSP 10000
#define BINSSPS 20.0/_N

// save binning of unfolded spacings (if set requires M*N*8 byte memotry!)
//#define BINSSPU 1000
#define BINSSPSUS unfolded_spacing_max_rounded
//#define BINSSPSUS 5.0

// density density correlation binning
#define BINSCOR 100
#define BINSCORX _N*8.0

// write out matlab code at the end of log file
#define MATLABLOAD 
#define MATLABPLOT 

//#define X1 M_SQRT2
#define X1 0
#define DX1 0.0001
//**********************************************************************

#ifdef BINSSP
  #define SPACINGS
#endif
#ifdef BINSSPU
  #define SPACINGS
#endif  

#ifdef MOVESTATPERM
  #define MOVESTAT
#endif 

#ifdef MATLABLOAD
  #define MATLAB
#endif
#ifdef MATLABPLOT
  #define MATLAB
#endif  

// ********** DEFINITIONS/SETTINGS for form factor and power spectrum

#define TVLENGTH 10001
#define TVBEGIN 0
#define TVEND 20

#define CVLENGTH _N/2
#define CVFACTOR 1
#define CVBEGIN 1

//#define SAVEMAVA 1
//#define SAVEPQ 1
//#define SAVEPS 1
//#define SAVEK 1

#define SEP " "
#define PRECISION 16

#ifdef SAVEPS
  #define CALCZ 1
#endif
#ifdef SAVEZ
  #define CALCZ 1
#endif
#ifdef SAVEK
  #define CALCPQ 1
#endif
#ifdef SAVEPQ
  #define CALCPQ 1
#endif
#ifdef CALCPQ
  #define CALCPSK
#endif
#ifdef CALCZ
  #define CALCPSK
#endif


// ********** END: DEFINITIONS/SETTINGS for form factor and power spectrum




#include <iostream>
#include <string>
#include <vector>
#include <stdio.h>
#include <new>
#include <random>
#include <math.h>
#include <cstring>
#include <algorithm>    // std::swap
#include <ctime>
#include <unistd.h>
#include <gnu/libc-version.h>
#include <complex>
#include <fstream>
#include <iomanip>
#include "vandermonde_det.h" 


// declarations:
class particles_1d_binning;
class particles_1d;
class binning_1d;
class log_output;
class stopwatch;
class formfactor_powerspectrum;

inline unsigned long int uniform_int(unsigned long int n);
void fisher_yates_shuffle(double permutation[], unsigned long int n);
inline double sqr(double x);
inline void sums2avgvar(const double &x,const double &x2,double &avg,double &var,const double &n);
void convp(char *parmvalue, char *parmstring, double & value);
void convp(char *parmvalue, char *parmstring, int & value);
void convp(char *parmvalue, char *parmstring, unsigned int & value);
void convp(char *parmvalue, char *parmstring, long int & value);
void convp(char *parmvalue, char *parmstring, unsigned long int & value);
void monte_carlo(const unsigned long int samples, const unsigned long int samples_rec, const unsigned long int eqsteps, const unsigned long int meassteps, particles_1d * const part_system);


//using namespace std;

static std::mt19937_64 gen;
static std::uniform_real_distribution<double> distu(0.0, 1.0);
//static std::normal_distribution<double> distn(0.0,1.0);


inline unsigned long int uniform_int(unsigned long int n) {
  std::uniform_int_distribution<> distrib(0, n-1);
  return distrib(gen);
}

void fisher_yates_shuffle(double permutation[], unsigned long int n) {
  for (unsigned long int i = 0; i <= n-2; i++) {
    unsigned long int j = i+uniform_int(n-i);
    std::swap(permutation[i], permutation[j]);
  }
}




class log_output {
  private:
  log_output(const log_output&); // disallow copying
  const bool logfile;
  bool fileopen;
  FILE * log_fh;
  char * _filename;
  public:
  log_output(const char* filename) :
  logfile(true),
  _filename(new char[strlen(filename)+1]) {
    strcpy(_filename,filename);
    log_fh=fopen(filename, FWRITE);
    if(log_fh == NULL) {
      printf("Error opening logfile: %s\n",filename);
      exit(-1);
    }
    fclose(log_fh);
    fileopen=false;
  }
  log_output() :
  logfile(false) { fileopen=false; 
  }
  ~log_output() { 
    if (fileopen) close();
    if (logfile) delete[] _filename; 
  }

  void open() {
    if (logfile) {
      if (!fileopen) log_fh=fopen(_filename, FAPPEND);
      fileopen=true;
    }
    return;
  }
  void close() {
    if (logfile) {
      if (fileopen) fclose(log_fh);
      fileopen=false;
    }
    return;
  }
  void write_unsigned_long_int(const unsigned long int lu) {
    printf("%lu",lu);
    if (logfile) {
      if (!fileopen) {
        log_fh=fopen(_filename, FAPPEND);
        fileopen=true;
      }
      fprintf(log_fh,"%lu",lu);
    }
    return;
  }
  void write_double(const double x) {
    printf("%lf",x);
    if (logfile) {
      if (!fileopen) {
        log_fh=fopen(_filename, FAPPEND);
        fileopen=true;
      }
      fprintf(log_fh,"%lf",x);
    }
    return;
  }
  void write(const char* logmsg) {
    printf("%s",logmsg);
    if (logfile) {
      if (!fileopen) { 
        log_fh=fopen(_filename, FAPPEND);
        fileopen=true;
      }
      fprintf(log_fh,"%s",logmsg);
    }
    return;
  }
  void write_oc(const char* logmsg) {
    printf("%s",logmsg);
    if (logfile) {
      if (!fileopen) { 
        log_fh=fopen(_filename, FAPPEND);
      }
      fprintf(log_fh,"%s",logmsg);
      fclose(log_fh);
      fileopen=false;
    }
    return;
  }

  bool get_logfile() { return logfile; } // gives back if we use a log file

  void log_msg_start(const char * logmsg, int argc, char *argv[], int parmc, const char *parmname[], char *parmvalue[], const bool paramgroup[], const char * potential,const char * vandermonde,const char * jpdf,const char * constraints,const char * comments, unsigned long int samples, unsigned long int max_unfolded_spacings_samples) {
    write(logmsg);
    // Date and hostname
    std::time_t t = std::time(0);
    std::tm* now = std::localtime(&t);
    char hostname[81];
    gethostname(hostname, 80);
    printf("Starting at %d/%02d/%02d %02d:%02d:%02d on %s\n", now->tm_year + 1900,now->tm_mon + 1,now->tm_mday,now->tm_hour,now->tm_min,now->tm_sec,hostname);
    for (int i=0; i<argc; i++) printf("%s ",argv[i]);
    printf("\n\nVersion: %s\nSource file: %s compiled on %s %s\nC++ Compiler (__VERSION__): %s\n",VERSION, __BASE_FILE__,__DATE__,__TIME__,__VERSION__);
   
#ifdef __GNUG__
    printf("__GNUG__: %d ",__GNUG__);
#endif
#ifdef __ICC
    printf("__ICC: %d ",__ICC);
#endif
#ifdef __AVX2__
    printf("__AVX2__: %d ",__AVX2__);
#endif 
#ifdef __AVX512BW__
    printf("__AVX512BW__: %d ",__AVX512BW__);
#endif
#ifdef __AVX512CD__
    printf("__AVX512CD__: %d ",__AVX512CD__);
#endif
#ifdef __AVX512DQ__
    printf("__AVX512DQ__: %d ",__AVX512DQ__);
#endif
#ifdef __AVX512ER__
    printf("__AVX512ER__: %d ",__AVX512ER__);
#endif
#ifdef __AVX512F__
    printf("__AVX512F__: %d ",__AVX512F__);
#endif
#ifdef __AVX512PF__
    printf("__AVX512PF__: %d ",__AVX512PF__);
#endif
#ifdef __AVX512VL__
    printf("__AVX512VL__: %d ",__AVX512VL__);
#endif
    printf("\n__cplusplus: %ld GNU libc version (runtime): %s\n",__cplusplus,gnu_get_libc_version());
    printf("#define: ");
#ifdef WARNOOB
    printf("WARNOOB ");
#endif
#ifdef OPENCLOSE
    printf("OPENCLOSE ");
#endif
#ifdef COUNTOVERUNDERFLOW
    printf("COUNTOVERUNDERFLOW ");
#endif
#ifdef TRAJSTAT
    printf("TRAJSTAT ");
#endif
#ifdef MOVESTAT
    printf("MOVESTAT ");
#endif
#ifdef MOVESTATPERM
    printf("MOVESTATPERM ");
#endif
#ifdef UPDATESTAT
    printf("UPDATESTAT ");
#endif
#ifdef ENERGYMINMAX
    printf("ENERGYMINMAX ");
#endif
#ifdef MOMENT
    printf("MOMENT ");
#endif
    printf("\n\n");

    for (int i=0; i<parmc; i++) {
      printf("%s: %s",parmname[i],parmvalue[i]);
      if (paramgroup[i]) printf(", "); else printf("\n");
    }
    if (max_unfolded_spacings_samples<samples) printf("samples for unfolded spacings: %lu\n",max_unfolded_spacings_samples);
    printf("\nPotential: %s\n%s\n%s\n%s\n%s\n\n",potential,vandermonde,jpdf,constraints,comments);

    if (logfile) { 
      printf("logfile: %s\n",_filename);

      fprintf(log_fh,"Starting at %d/%02d/%02d %02d:%02d:%02d on %s\n", now->tm_year + 1900,now->tm_mon + 1,now->tm_mday,now->tm_hour,now->tm_min,now->tm_sec,hostname);
      for (int i=0; i<argc; i++) fprintf(log_fh,"%s ",argv[i]);
      fprintf(log_fh,"\n\nVersion: %s\nSource file: %s compiled on %s %s\nC++ Compiler (__VERSION__): %s\n",VERSION, __BASE_FILE__,__DATE__,__TIME__,__VERSION__);

#ifdef __GNUG__
      fprintf(log_fh,"__GNUG__: %d ",__GNUG__);
#endif
#ifdef __ICC
      fprintf(log_fh,"__ICC: %d ",__ICC);
#endif
#ifdef __AVX2__
      fprintf(log_fh,"__AVX2__: %d ",__AVX2__);
#endif
#ifdef __AVX512BW__
      fprintf(log_fh,"__AVX512BW__: %d ",__AVX512BW__);
#endif
#ifdef __AVX512CD__
      fprintf(log_fh,"__AVX512CD__: %d ",__AVX512CD__);
#endif
#ifdef __AVX512DQ__
      fprintf(log_fh,"__AVX512DQ__: %d ",__AVX512DQ__);
#endif
#ifdef __AVX512ER__
      fprintf(log_fh,"__AVX512ER__: %d ",__AVX512ER__);
#endif
#ifdef __AVX512F__
      fprintf(log_fh,"__AVX512F__: %d ",__AVX512F__);
#endif
#ifdef __AVX512PF__
      fprintf(log_fh,"__AVX512PF__: %d ",__AVX512PF__);
#endif
#ifdef __AVX512VL__
      fprintf(log_fh,"__AVX512VL__: %d ",__AVX512VL__);
#endif
      fprintf(log_fh,"\n__cplusplus: %ld GNU libc version (runtime): %s\n",__cplusplus,gnu_get_libc_version());
      fprintf(log_fh,"#define: ");
#ifdef WARNOOB
      fprintf(log_fh,"WARNOOB ");
#endif
#ifdef COUNTOVERUNDERFLOW
      fprintf(log_fh,"COUNTOVERUNDERFLOW ");
#endif
#ifdef TRAJSTAT
      fprintf(log_fh,"TRAJSTAT ");
#endif
#ifdef MOVESTAT
      fprintf(log_fh,"MOVESTAT ");
#endif
#ifdef MOVESTATPERM
      fprintf(log_fh,"MOVESTATPERM ");
#endif
#ifdef UPDATESTAT
      fprintf(log_fh,"UPDATESTAT ");
#endif
#ifdef ENERGYMINMAX
      fprintf(log_fh,"ENERGYMINMAX ");
#endif
      fprintf(log_fh,"\n\n");

      for (int i=0; i<parmc; i++) {
        fprintf(log_fh,"%s: %s",parmname[i],parmvalue[i]);
        if (paramgroup[i]) fprintf(log_fh,", "); else fprintf(log_fh,"\n");
      }
      if (max_unfolded_spacings_samples<samples) fprintf(log_fh,"samples for unfolded spacings: %lu\n",max_unfolded_spacings_samples);
      fprintf(log_fh,"\nPotential: %s\n%s\n%s\n%s\n%s\n\n",potential,vandermonde,jpdf,constraints,comments);
    close();
    }
  }
#ifdef MATLABLOAD  
  void log_matlab_load(const char* filename_samples, const char* filename_density, const char* filename_correlation, const char* filename_spacings, const char* filename_spacings_unfolded, const char * filename_statistics, const unsigned long int savedsamples, const int Nmeas, const unsigned long int total_samples) { 
    char buffer[1024];
    snprintf(buffer,1024,"\n\nMM=%lu; evr=load('%s');\n\nN=%d; M=%lu; ",savedsamples,filename_samples,Nmeas,total_samples);
    write(buffer);
  #ifdef BINSDENSITY
    snprintf(buffer,1024,"R=load('%s'); x=R(1,:); rho=R(2,:); ",filename_density);
    write(buffer);
  #endif
  #ifdef BINSSP
    snprintf(buffer,1024,"S=load('%s'); s=S(1,:); rhos=S(2,:); ",filename_spacings);
    write(buffer);
  #endif
  #ifdef BINSSPU
    snprintf(buffer,1024,"U=load('%s'); su=U(1,:); rhou=U(2,:); ",filename_spacings_unfolded);
    write(buffer);
  #endif
  #ifdef BINSCOR
    snprintf(buffer,1024,"C=load('%s'); Cx=C(1,:); Cy=C(1,:); C=C(2:end,:); ",filename_correlation);
    write(buffer);
  #endif
    snprintf(buffer,1024,"\n\nstat=load('%s'); ooiavg=stat(1); ooivar=stat(2); ooimax=stat(3); x1=%lf; dx1=%lf; evx1avg=stat(4); evx1var=stat(5); evx1max=stat(6); rhox1=stat(7); m1=stat(8); m2=stat(9); outavg=stat(10); outvar=stat(11); outmax=stat(12);\n\n",filename_statistics,(double)X1,(double)DX1);
    write_oc(buffer);
  }
#endif
#ifdef MATLABPLOT
  void log_matlab_plot(const int Nmeas) { 
    char buffer[1024];
    snprintf(buffer,1024,"\n\nScatter plot: (1 sample / all)\n");
    write(buffer);
    snprintf(buffer,1024,"plot(evr(1,:),zeros(1,length(evr(1,:))),'r.','markersize',6);\n");
    write(buffer);
    snprintf(buffer,1024,"plot(evr(:),zeros(1,length(evr(:))),'r.');\n\n");
    write(buffer);
  #ifdef BINSDENSITY
    snprintf(buffer,1024,"ev density normalized to 1:\n");
    write(buffer);
    snprintf(buffer,1024,"plot(x,rho,'linewidth',2);\n\n");
    write(buffer);
  #endif
  #ifdef BINSSP
    snprintf(buffer,1024,"spacing distribution of real ev:\n");
    write(buffer);
    snprintf(buffer,1024,"plot(s,rhos,'linewidth',2);\n\n");
    write(buffer);
  #endif
  #ifdef BINSSPU
    snprintf(buffer,1024,"unfolded spacing distribution of real ev:\n");
    write(buffer);
    snprintf(buffer,1024,"plot(su,rhou,'linewidth',2);\n\n");
    write(buffer);
  #endif
  #ifdef BINSCOR
    snprintf(buffer,1024,"density density correlation of real ev:\n");
    write(buffer);
    snprintf(buffer,1024,"bar3(C); \n");
    write(buffer);
    snprintf(buffer,1024,"surf(Cx,Cy,C); \n");
    write(buffer);
    snprintf(buffer,1024,"Merge n*m bins:\n");
    write(buffer);
    snprintf(buffer,1024,"n=2; m=2; clear('Cnew');for j=1:%d/n; for j2=1:%d/m; Cnew(j,j2)=sum(sum(C((j-1)*n+1:j*n,(j2-1)*m+1:j2*m)));end;end;\n\n",BINSCOR,BINSCOR);
    write(buffer);
  #endif
    close();
  }
#endif
};










// ***************************************************************************
// ****************** CODE FOR Spectral form factor and power spectrum imported from SemiCircularBilliard-7.1.cpp (changed to a class, maybe split K and PS calc to 2 classes) 


class formfactor_powerspectrum {
  private:
  const int _N; 
  const unsigned long int _samples;
  log_output * const _logmsg;
  const char * _basefilename;
#ifdef CALCZ
  double * Ma;
  double * va;
#endif
#ifdef CALCPQ
  double * Pavg;
  std::complex<double> * Qavg;
  double * tv;
#endif


// private functions to calculate formfactor and power spectrum
  void averageZ(int N, double Ej[], double Ma[], double va[]) { // matrix Ma and vector va I used in the Matlab program TruncPoissonCombi.m for the pre-quantities from which the power spectrum can be calculated. Remark: Ma is a symetric matrix. The columns (or rows) are stored in a vector of length N*N.

// from Ma we can calculate the correlation matrix Z! Attention: va and Ma have not jet been devided by the number or realizations M (since in a parallel run, one would add more va and Ma). When calculating Z, this has to be adapted.
    long int l=0;
    for (int j=0; j<N; j++) {
      va[j]+=(double)Ej[j];
      for (int k=0; k<N; k++) {
        Ma[l]+=(double)Ej[j]*(double)Ej[k];
        l++;
      }
    }
  }

  void ZtoPS(int N, long int samples, double Ma[], double va[], int lengthcv, double cv[], double PS[]) { //Calculates Powerspectrum at freq vector cv
    double * coscvm;
    double * temp;
    coscvm = new double[2*N-1];
    temp = new double[N];
    for (int j=0; j<lengthcv; j++) {
      for (int k=0; k<2*N-1; k++) coscvm[k]=cos((double)(k-N+1)*cv[j]);
      for (int l=0; l<N; l++) temp[l]=0;
      for (int k=0; k<N; k++) {
        long int m=k*N;
        int Nmk=N-k;
        for (int l=0; l<N; l++) temp[l]+=Ma[m+l]*coscvm[Nmk+l-1];
      }
      PS[j]=0;
      for (int l=0; l<N; l++) PS[j]+=temp[l];
      PS[j]=PS[j]/samples;
      double sumre=0;
      double sumim=0;
      for (int k=0; k<N; k++) {
        sumre+=cos((double)k*cv[j])*va[k];
        sumim+=sin((double)k*cv[j])*va[k];
      }
      PS[j]=(PS[j]-(sumre*sumre+sumim*sumim)/((double)samples*(double)samples))/(double)N;
    }
    delete[] temp;
    delete[] coscvm;
  }


  void averagePQ(int N, double Ej[], double Pavg[], std::complex<double>  Qavg[], int lengthtv, double tv[]) { // vectors Pavg and Qavg I used in the Matlab program TruncPoissonCombi.m for the pre-quantities from which the form factor can be calculated

    const std::complex<double> I(0, 1);
    const double pi2=2*M_PI;
    double * sumExpMre, * sumExpMim;
    sumExpMre = new double[lengthtv];
    sumExpMim = new double[lengthtv];

    for (int j=0; j<lengthtv; j++) {
      sumExpMre[j]=0;
      sumExpMim[j]=0;
    }

    for (int k=0; k<N; k++) {
      double Ekpi2=pi2*(double)Ej[k]; //TODO: CHECK IF 2pi factor is needed in definition of form factor ????
      for (int j=0; j<lengthtv; j++) {
        sumExpMre[j]+=cos(Ekpi2*tv[j]);
        sumExpMim[j]+=sin(Ekpi2*tv[j]);
      }
    }

    for (int j=0; j<lengthtv; j++) {
      Qavg[j]+=sumExpMre[j]+I*sumExpMim[j];
      Pavg[j]+=sumExpMre[j]*sumExpMre[j]+sumExpMim[j]*sumExpMim[j];
    }
    delete[] sumExpMre;
    delete[] sumExpMim;
  }

  void PQtoK(int N, long int samples, double Pavg[], std::complex<double> Qavg[], double K[], int lengthtv) { // Calculates Formfactor
    for (int j=0; j<lengthtv; j++) {
      double reQavgj = real(Qavg[j])/(double)samples;
      double imQavgj = imag(Qavg[j])/(double)samples;
      K[j]=(Pavg[j]/samples - (reQavgj*reQavgj+imQavgj*imQavgj))/N;
    }
  }


  public:
  formfactor_powerspectrum(const int N, const unsigned long int samples, log_output * const logmsg, const char * basefilename) :
  _N(N),
  _samples(samples),
  _logmsg(logmsg),
  _basefilename(basefilename) { // constructor
// allocate memory and init the variables to zero
#ifdef CALCZ  
    Ma = new double[(long int)N*(long int)N];
    va = new double[N];
#endif
#ifdef CALCPQ
    Pavg = new double[TVLENGTH];
    Qavg = new std::complex<double>[TVLENGTH];
#endif
#ifdef CALCZ
    for (int j=0; j<N; j++)  {
      va[j]=0;
    }
    for (long int j=0; j<(long int)N*(long int)N; j++) {
      Ma[j]=0;
    }
#endif
#ifdef CALCPQ
    for (int j=0; j<TVLENGTH; j++)  {
      Pavg[j]=0;
      Qavg[j]=0;
    }
#endif

// Define vectors tv for calculation of form factor (tau's) (Integer tau's are k/N)
#ifdef CALCPQ
    tv=new double[TVLENGTH];
    for (int k=0; k<TVLENGTH; k++) {
      tv[k]=TVBEGIN+k*(double)(TVEND-TVBEGIN)/(double)(TVLENGTH-1);
    }
#endif
  } // end constructor
  ~formfactor_powerspectrum() {
  } // end destructor
  
  inline void measure(double Ej[]) { // Ej energy levels
#ifdef CALCZ
    averageZ(_N, Ej, Ma, va); //TODO: Ej has to be sorted!!???
#endif
#ifdef CALCPQ
    averagePQ(_N, Ej, Pavg, Qavg, TVLENGTH, tv);
#endif
  }
  void finish() { // measurements finished. calculate the remaining things. write out data. free memory.

    char buffer[1024];
#ifdef SAVEMAVA
    char outnameMa[400];
    char outnameva[400];
    strcpy(outnameMa,_basefilename);
    strcat(outnameMa,"_Ma.dat");
    strcpy(outnameva,_basefilename);
    strcat(outnameva,"_va.dat");
    
    std::ofstream outfile_Ma;
    std::ofstream outfile_va;

    outfile_Ma.open(outnameMa);
    outfile_va.open(outnameva);
    outfile_Ma << std::scientific << std::setprecision(PRECISION);
    outfile_va << std::scientific << std::setprecision(PRECISION);

    snprintf(buffer,1024,"Writing Ma and va to: %s and: %s\n",outnameMa,outnameva);
    _logmsg->write_oc(buffer);

    long int l=0;
    for (int j=0; j<_N; j++)  {
      outfile_va << (double)va[j] << SEP;
      for (int k=0; k<_N; k++) {
        outfile_Ma << (double)Ma[l] << SEP;
        l++;
      }
      outfile_Ma << std::endl;
    }
    outfile_Ma.close();
    outfile_va.close();
#endif 

#ifdef SAVEPQ
    char outnamePavg[400];
    char outnameQavg[400];
    strcpy(outnamePavg,_basefilename);
    strcat(outnamePavg,"_P.dat");
    strcpy(outnameQavg,_basefilename);
    strcat(outnameQavg,"_Q.dat");
    
    std::ofstream outfile_Pavg;
    std::ofstream outfile_Qavg;

    outfile_Pavg.open(outnamePavg);
    outfile_Qavg.open(outnameQavg);
    outfile_Pavg << std::scientific << std::setprecision(PRECISION);
    outfile_Qavg << std::scientific << std::setprecision(PRECISION);

    snprintf(buffer,1024,"Writing P and Q to: %s and: %s\n",outnamePavg,outnameQavg);
    _logmsg->write_oc(buffer);

    for (int j=0; j<TVLENGTH; j++)  {
      outfile_Pavg << (double)Pavg[j] << std::endl;
      outfile_Qavg << real((std::complex<double>)Qavg[j]) << SEP << imag((std::complex<double>)Qavg[j]) << std::endl;
    }
    outfile_Pavg.close();
    outfile_Qavg.close();
#endif

#ifdef SAVEPS
    _logmsg->write_oc("Starting calculation of Powerspectrum.\n");

// Define vectors cv for calculation of PS (frequencies w. Integer w are 2*pi*k/N)
    double * cv;
    cv=new double[CVLENGTH];
    for (int k=0; k<CVLENGTH; k++) {
  // integer freq till Nyq.freq if CVLENGTH=N/2, CVFACTOR=1; CVBEGIN=1;
      cv[k]=(double)(k+CVBEGIN)*2*M_PI*(double)CVFACTOR/(double)_N;
    }

    double * PS;
    PS=new double[CVLENGTH];
    ZtoPS(_N, _samples, Ma, va, CVLENGTH, cv, PS);

    char outnamePS[400];
    strcpy(outnamePS,_basefilename);
    strcat(outnamePS,"_PS.dat");
    
    std::ofstream outfile_PS;

    outfile_PS.open(outnamePS);
    outfile_PS << std::scientific << std::setprecision(PRECISION);

    snprintf(buffer,1024,"Calculation of Powerspectrum ended. Writing cv and PS to: %s\n",outnamePS);
    _logmsg->write_oc(buffer);

    for (int j=0; j<CVLENGTH; j++)  {
      outfile_PS << (double)cv[j] << SEP;
    }
    outfile_PS << std::endl;
    for (int j=0; j<CVLENGTH; j++)  {
      outfile_PS << (double)PS[j] << SEP;
    }
    outfile_PS << std::endl;

    outfile_PS.close();
    delete[] PS;
    delete[] cv;
#endif 
// free no longer used memory
#ifdef CALCZ
    delete[] Ma;
    delete[] va;
#endif  

#ifdef SAVEK
    _logmsg->write_oc("Starting calculation of form factor.\n");
    double * K;
    K=new double[TVLENGTH];
    PQtoK(_N, _samples, Pavg, Qavg, K, TVLENGTH);
    char outnameK[400];
    strcpy(outnameK,_basefilename);
    strcat(outnameK,"_K.dat");

    std::ofstream outfile_K;

    outfile_K.open(outnameK);
    outfile_K << std::scientific << std::setprecision(PRECISION);

    snprintf(buffer,1024,"Calculation of form factor ended. Writing tv and K to: %s\n",outnameK);
    _logmsg->write_oc(buffer);

    for (int j=0; j<TVLENGTH; j++)  {
      outfile_K << (double)tv[j] << SEP;
    }
    outfile_K << std::endl;
    for (int j=0; j<TVLENGTH; j++)  {
      outfile_K << (double)K[j] << SEP;
    }
    outfile_K << std::endl;

    outfile_K.close();

    delete[] K;
#endif
    _logmsg->write_oc("\n");
#ifdef CALCPQ
    delete[] Pavg;
    delete[] Qavg;
    delete[] tv;
#endif
  } //end finish()
}; // end class formfactor_powerspectrum

void averageZ(int N, double Ej[], double Ma[], double va[]) { // matrix Ma and vector va I used in the Matlab program TruncPoissonCombi.m for the pre-quantities from which the power spectrum can be calculated. Remark: Ma is a symetric matrix. The columns (or rows) are stored in a vector of length N*N.

// from Ma we can calculate the correlation matrix Z! Attention: va and Ma have not jet been devided by the number or realizations M (since in a parallel run, one would add more va and Ma). When calculating Z, this has to be adapted.
  long int l=0;
  for (int j=0; j<N; j++) {
    va[j]+=(double)Ej[j];
    for (int k=0; k<N; k++) {      
      Ma[l]+=(double)Ej[j]*(double)Ej[k];
      l++;
    }
  }
}

void ZtoPS(int N, long int samples, double Ma[], double va[], int lengthcv, double cv[], double PS[]) { //Calculates Powerspectrum at freq vector cv
  double * coscvm;
  double * temp;
  coscvm = new double[2*N-1];
  temp = new double[N];
  for (int j=0; j<lengthcv; j++) {
    for (int k=0; k<2*N-1; k++) coscvm[k]=cos((double)(k-N+1)*cv[j]); 
    for (int l=0; l<N; l++) temp[l]=0;
    for (int k=0; k<N; k++) {
      long int m=k*N;
      int Nmk=N-k;
      for (int l=0; l<N; l++) temp[l]+=Ma[m+l]*coscvm[Nmk+l-1];
    }  
    PS[j]=0;
    for (int l=0; l<N; l++) PS[j]+=temp[l];
    PS[j]=PS[j]/samples;
    double sumre=0;
    double sumim=0;
    for (int k=0; k<N; k++) {
      sumre+=cos((double)k*cv[j])*va[k];
      sumim+=sin((double)k*cv[j])*va[k];
    }
    PS[j]=(PS[j]-(sumre*sumre+sumim*sumim)/((double)samples*(double)samples))/(double)N;
  }
  delete[] temp;
  delete[] coscvm; 
}


void averagePQ(int N, double Ej[], double Pavg[], std::complex<double>  Qavg[], int lengthtv, double tv[]) { // vectors Pavg and Qavg I used in the Matlab program TruncPoissonCombi.m for the pre-quantities from which the form factor can be calculated

  const std::complex<double> I(0, 1);
  const double pi2=2*M_PI;
  double * sumExpMre, * sumExpMim;
  sumExpMre = new double[lengthtv];
  sumExpMim = new double[lengthtv];

  for (int j=0; j<lengthtv; j++) {
    sumExpMre[j]=0;
    sumExpMim[j]=0;
  }

  for (int k=0; k<N; k++) {
    double Ekpi2=pi2*(double)Ej[k]; //TODO: CHECK IF 2pi factor is needed in definition of form factor ????
    for (int j=0; j<lengthtv; j++) {
      sumExpMre[j]+=cos(Ekpi2*tv[j]);  
      sumExpMim[j]+=sin(Ekpi2*tv[j]); 
    }
  }

  for (int j=0; j<lengthtv; j++) {
    Qavg[j]+=sumExpMre[j]+I*sumExpMim[j];
    Pavg[j]+=sumExpMre[j]*sumExpMre[j]+sumExpMim[j]*sumExpMim[j];
  }
  delete[] sumExpMre;
  delete[] sumExpMim;
}

void PQtoK(int N, long int samples, double Pavg[], std::complex<double> Qavg[], double K[], int lengthtv) { // Calculates Formfactor
  for (int j=0; j<lengthtv; j++) {
    double reQavgj = real(Qavg[j])/(double)samples;
    double imQavgj = imag(Qavg[j])/(double)samples;
    K[j]=(Pavg[j]/samples - (reQavgj*reQavgj+imQavgj*imQavgj))/N;
  }
}


// ******************* END: CODE FOR Spectral form factor and power spectrum



inline double sqr(double x) {
  return x*x;
}


inline void sums2avgvar(const double &x,const double &x2,double &avg,double &var,const double &n) {
  const double invn=1/n;
  avg=x*invn;
  var=x2*invn-avg*avg;
}


class stopwatch {
  private:
  std::clock_t c_equil = std::clock();
  double time_start;
  double time_lap=0;
  double time_total=0;
  bool running=false;
  const double inv_cps=(double)1 / (double)CLOCKS_PER_SEC;
  public:
  stopwatch() { reset(); }
  void reset() {
    running=false;
    time_total=0;
    time_lap=0;
    return;
  }
  void start() { 
    if (~running) {
      running=true;
      time_start=(double)std::clock();
    }
    return;
  }
  void stop() { 
    if (running) {
      running=false;
      double time_stop=(double)std::clock();
      time_total+=(time_stop-time_start)*inv_cps;
    }
    return;
  }
  void lap() { 
    time_lap=get_time(); 
    return;
  }
  double get_time() { // gives total running time
    double time_current=time_total;
    if (running) {
      double time_stop_current=(double)std::clock();
      time_current+=(time_stop_current-time_start)*inv_cps;
    }
    return time_current;
  } 
  double get_lap() {    // gives running time since last call of lap
    return get_time()-time_lap;
  }
};


class simple_statistics {
  private:
  double sum;
  double sum2;
  double maxmax;
  public:
  simple_statistics() { reset(); } 
  void input_data(double data) {
    double data_abs=abs(data);
    sum+=data;
    sum2+=sqr(data);
    if (data_abs>maxmax) maxmax=data_abs;
  }
  double get_mean(double samples) { return sum/samples; }
  double get_var(double samples) { return sum2/samples-sqr(sum/samples);  }
  double get_maxmax() { return maxmax; }

  void reset() {
    sum=0;
    sum2=0;
    maxmax=-INFINITY;
  }
};


class simple_statistics_const_length { 
  private:
  const unsigned long int _ndata; 
  double sum;
  double sum2;
  double avgmax;
  double maxmax;

  public:
  simple_statistics_const_length(unsigned int ndata) :
  _ndata(ndata) { reset(); }

  void input_data(double * data) {
    double tsum=0;
    double tsum2=0;
    double tmax=abs(data[0]);
    for (unsigned long int i=0; i<_ndata; i++) {
      double data_abs=abs(data[i]);
      tsum+=data[i];
      tsum2+=sqr(data[i]);
      if (data_abs>maxmax) maxmax=data_abs;
      if (data_abs>tmax) tmax=data_abs;
    }
    avgmax+=tmax;
    sum+=tsum;
    sum2+=tsum2;
  }
  double get_mean(double samples) { return sum/(samples*(double)_ndata); }
  double get_moment2(double samples) { return sum2/(samples*(double)_ndata); }
  double get_var(double samples) { return sum2/(samples*(double)_ndata)-sqr(sum/(samples*(double)_ndata));  } // we normalize the variance with N and not with N-1 like matlab
  double get_avgmax(double samples) { return avgmax/samples; }
  double get_maxmax() { return maxmax; }
  void reset() {
    sum=0;
    sum2=0;
    maxmax=0;
    avgmax=0;
  }
};

class dens_dens_correlation {
  private:
  log_output * const _logmsg;
  char * const _binning_name;
  const double _xmin, _xmax;
  const unsigned int _nbins;
  const unsigned long int nbins2;
  unsigned long int * bins;
  unsigned long int oobin=0;
  unsigned long int ndata_total=0;
  unsigned long int nsamples=0;
  const double dx;
  const double dx_inv;
  
  void get_bins_coord(double * coord, double xstart) {
    double x=xstart;
    for (int i=0; i<_nbins; i++, x+=dx) coord[i]=x;
  }

  public:
  dens_dens_correlation(double xmin, double xmax, unsigned int nbins, const char* binning_name, log_output * const logmsg) : 
  _xmin(xmin),
  _xmax(xmax),
  _nbins(nbins),
  nbins2((unsigned long int)nbins*(unsigned long int)nbins),
  _binning_name(new char[strlen(binning_name)+1]),
  _logmsg(logmsg),
  dx((xmax-xmin)/(double)nbins),
  dx_inv((double)nbins/(xmax-xmin)),
  bins(new unsigned long int[nbins2]()) { 
    if (bins==NULL) {
      std::cout << "Memory for correlation binning not allocated: " << nbins2*sizeof(unsigned long int) << "Bytes\n";
      exit(1);
    }
    strcpy(_binning_name,binning_name);
  }
  ~dens_dens_correlation() {
    delete[] bins;
    delete[] _binning_name;
  } 

  void reset() {
    oobin=0;
    for (unsigned long int i=0; i<nbins2; i++) bins[i]=0;
    ndata_total=0;
    nsamples=0;
  }

  unsigned int get_nbins() { return _nbins; }
  unsigned long int get_samples() { return nsamples; }
  unsigned long int get_ndata_total() { return ndata_total; }
  double get_xmin() { return _xmin; }
  double get_xmax() { return _xmax; }
  double get_dx() { return dx; }
  void get_bins_center(double * centers) { get_bins_coord(centers,_xmin+dx/2.0); } 
  void get_bins_left_edge_included(double * left_edge) { get_bins_coord(left_edge,_xmin); }
  void get_bins_right_edge_excluded(double * right_edge) { get_bins_coord(right_edge,_xmin+dx); }

  unsigned long int get_counts(unsigned long int * bins_copy) {  
    std::memcpy(bins_copy,bins,nbins2*sizeof(unsigned long int));
    return oobin;
  }
  void bin_data(unsigned long int ndata, double *data) {
    nsamples++;
    ndata_total+=ndata;
    for (unsigned long int i=0; i<ndata; i++) {
      long int nx=ceil((data[i]-_xmin)*dx_inv); 
      for (unsigned long int j=i+1; j<ndata; j++) {
        long int ny=ceil((data[j]-_xmin)*dx_inv);
        if (nx<1 || nx>_nbins || ny<1 || ny>_nbins) {
#ifdef WARNOOB
          if (oobin==0) {
            char buffer[160];
	    snprintf(buffer,160,"Warning: Out of 2D bin (%s): %lf %lf\n",_binning_name,data[i],data[j]);
	    _logmsg->write_oc(buffer);
          }
#endif
          oobin++;	  
        } else { 
	  if (nx<ny) bins[(nx-1)*_nbins+(ny-1)]++; else bins[(ny-1)*_nbins+(nx-1)]++; 
	}
      }
    }  
    return;
  }
  void log_string(char * lstring) {
    snprintf(lstring,80,"nbins=%u xmin=%lf xmax=%lf, oob=%lu\n",_nbins,_xmin,_xmax,oobin);
  }
  unsigned long int get_memory_use() {
    return nbins2*sizeof(unsigned long int);
  }
  void dump_data(const char* filename, const double binnorm) {
    FILE *fp=fopen(filename, "w");
    const double bnorm=1.0/(binnorm*dx*dx);
    if(fp == NULL) {
      printf("Error opening bin file: %s\n",filename);
      exit(-1);
    }
    char buffer[240];
    snprintf(buffer,240,"Writing %s: %s\n1.row center of bins, matrix with correlation data\nnbins=%u xmin=%lf xmax=%lf, oob=%lu\n\n",_binning_name,filename,_nbins,_xmin,_xmax,oobin);
    _logmsg->write_oc(buffer);
    double xc=_xmin+dx/2;
    for (int i=0; i<_nbins; i++, xc+=dx) fprintf(fp,OUTFORMAT,xc);
    fprintf(fp,"\n");
    for (int j=0; j<_nbins; j++) {
      for (int i=0; i<_nbins; i++) {
        unsigned long int binc;
        if (j<i) binc=bins[j*_nbins+i]; else binc=bins[i*_nbins+j];
	fprintf(fp,OUTFORMAT,(double)binc*bnorm);
      }
      fprintf(fp,"\n");
    }
    fclose(fp);
    return;
  }
} ;

class binning_1d {
  private:
  log_output * const _logmsg;
  char * const _binning_name;
  const double _xmin, _xmax;
  const unsigned int _nbins;
  unsigned long int * bins;
  unsigned long int oobin=0;
  unsigned long int ndata_total=0;
  unsigned long int nsamples=0;
  const double dx;
  const double dx_inv;
  
  void get_bins_coord(double * coord, double xstart) {
    double x=xstart;
    for (int i=0; i<_nbins; i++, x+=dx) coord[i]=x;
  }

  public:
  binning_1d(double xmin, double xmax, unsigned int nbins, const char* binning_name, log_output * const logmsg) : 
  _xmin(xmin),
  _xmax(xmax),
  _nbins(nbins),
  _binning_name(new char[strlen(binning_name)+1]),
  _logmsg(logmsg),
  dx((xmax-xmin)/(double)nbins),
  dx_inv((double)nbins/(xmax-xmin)),
  bins(new unsigned long int[nbins]()) { 
    if (bins==NULL) {
      std::cout << "Memory for binning not allocated: " << nbins*sizeof(unsigned long int) << "Bytes\n";
      exit(1);
    }
    strcpy(_binning_name,binning_name);
  }
  ~binning_1d() {
    delete[] bins;
    delete[] _binning_name;
  } 

  void reset() {
    oobin=0;
    for (int i=0; i<_nbins; i++) bins[i]=0;
    ndata_total=0;
    nsamples=0;
  }

  unsigned int get_nbins() { return _nbins; }
  unsigned long int get_samples() { return nsamples; }
  unsigned long int get_ndata_total() { return ndata_total; }
  double get_xmin() { return _xmin; }
  double get_xmax() { return _xmax; }
  double get_dx() { return dx; }
  void get_bins_center(double * centers) { get_bins_coord(centers,_xmin+dx/2.0); } 
  void get_bins_left_edge_included(double * left_edge) { get_bins_coord(left_edge,_xmin); }
  void get_bins_right_edge_excluded(double * right_edge) { get_bins_coord(right_edge,_xmin+dx); }

  unsigned long int get_counts(unsigned long int * bins_copy) {  
    std::memcpy(bins_copy,bins,_nbins*sizeof(unsigned long int));
    return oobin;
  }
  void bin_data(unsigned long int ndata, double *data) {
    nsamples++;
    ndata_total+=ndata;
    for (unsigned long int i=0; i<ndata; i++) {
      long int nn=ceil((data[i]-_xmin)*dx_inv); 
      if (nn<1 || nn>_nbins) {
#ifdef WARNOOB
        if (oobin==0) {
          char buffer[160];
	  snprintf(buffer,160,"Warning: Out of 1D bin (%s): %lf\n",_binning_name,data[i]);
	  _logmsg->write_oc(buffer);
        }
#endif

        oobin++;
      } else { bins[nn-1]++; }
    }
    return;
  }
  void log_string(char * lstring) {
    snprintf(lstring,80,"nbins=%u xmin=%lf xmax=%lf, oob=%lu\n",_nbins,_xmin,_xmax,oobin);
  }
  unsigned long int get_memory_use() {
    return _nbins*sizeof(unsigned long int);
  }
  void dump_data(const char* filename, const double binnorm) {
    FILE *fp=fopen(filename, "w");
    const double bnorm=1.0/(binnorm*dx);
    if(fp == NULL) {
      printf("Error opening bin file: %s\n",filename);
      exit(-1);
    }
    char buffer[240];
    snprintf(buffer,240,"Writing %s: %s\n1.row center of bins, 2.row binned data\nnbins=%u xmin=%lf xmax=%lf, oob=%lu\n\n",_binning_name,filename,_nbins,_xmin,_xmax,oobin);
    _logmsg->write_oc(buffer);
    double xc=_xmin+dx/2;
    for (int i=0; i<_nbins; i++, xc+=dx) fprintf(fp,OUTFORMAT,xc);
    fprintf(fp,"\n");
    for (int i=0; i<_nbins; i++) fprintf(fp,OUTFORMAT,(double)bins[i]*bnorm);
    fprintf(fp,"\n");
    fclose(fp);
    return;
  }
} ;




class particles_1d {
  public:
  typedef double particle_type;
  private:
  const double VANDERMONDE_DET_EXPONENT_BASIS_LOG=log(2); // TODO: should be defined in library
  const int d=1;
  const bool mirrored=false;
  const int _N;  // number of particles in this class
  const int _Ntrue;  // number of true particles in this class (also counts mirrored fixed particles)
  const int _Nmeas;  // number of measured coordinates in this class
  const int _nkind=1; // kind of particles in this class
  const double _initx1, _initx2, _avgstepsize;
  const unsigned long int _eq_steps,_total_samples,_steps_between_samples,_unfolded_spacings_samples;
  const double _a; // parameter a from paper 
#ifdef COUNTOVERUNDERFLOW
  unsigned long int underflow,underflowE;
  unsigned long int overflow,overflowE;
  unsigned long int overunderflowchecks,overunderflowchecksE;
#endif
#ifdef ENERGYMINMAX
  double energy_stat_min=0;
  double energy_stat_max=0;
#endif
#ifdef TRAJSTAT
  double * traj;
  double traj_minmin=INFINITY;
  double traj_avgmin=0;
  double traj_avgavg=0;
#endif
#ifdef MOMENT
  simple_statistics_const_length * moments_each_step;
#endif
#ifdef UPDATESTAT
  unsigned int * update_stat; 
  unsigned int update_stat_min=4294967295;
  unsigned int update_stat_sum=0;
#endif
#ifdef MOVESTAT
  particle_type * particles_old;
  double sum_move_stat=0;
  double sum_move2_stat=0;
#endif
#ifdef MOVESTATPERM
  double sum_move_stat_perm=0;
  double sum_move2_stat_perm=0;
  unsigned long int move_perm_smaller_mean=0;
#endif
  char * _basefilename;
  char * filename_samples;
  double total_energy;
  unsigned long int accept_e, accept_p, accept_e_lap, accept_p_lap;
  particle_type * particles;
  log_output * const _logmsg;
  FILE * samples_fh;
//**************************************************************************
//************* SETUP Measurements particles_1d ****************************
//**************************************************************************

// ********** define variables for binnings ******************************
#ifdef BINSDENSITY  
  binning_1d * density;
#endif 
#ifdef BINSSP
  binning_1d * spacings;
#endif
#ifdef BINSCOR
  dens_dens_correlation * correlation;
#endif
#ifdef SPACINGS
  double * sp;
#endif
#ifdef BINSSPU
  double * unfolded_sp; 
  unsigned long int measured_unfolded_samples=0;
#endif

#ifdef CALCPSK
  formfactor_powerspectrum * ps_k;
#endif 


// ***********define variables for simple statistics  
  simple_statistics outlier;
  simple_statistics ooi;
  simple_statistics near_x1;
  double part_stat_sum=0;
  double part_stat_sum2=0; 
 
// ***********reserve memory for binnings and statistics and free it again*** 
  inline void reserve_binning_memory() {
#ifdef BINSDENSITY    
    density=new binning_1d(0,BINSDENSITYX,BINSDENSITY,"density",_logmsg);
#endif
#ifdef BINSCOR
    correlation=new dens_dens_correlation(0,BINSCORX,BINSCOR,"correlation",_logmsg);
#endif    
#ifdef SPACINGS    
    sp = new double[_Nmeas];
#endif
#ifdef BINSSP
    spacings=new binning_1d(0,BINSSPS,BINSSP,"spacings",_logmsg);
#endif
#ifdef BINSSPU
    unfolded_sp=new double[_unfolded_spacings_samples*(_Nmeas-1)];
#endif
    return;
  }

  inline void free_binning_memory() {
//    std::cout << "start freeing memory in free_binning_memory\n";
#ifdef BINSDENSITY    
    delete density;
#endif
#ifdef BINSCOR
    delete correlation;
#endif
#ifdef BINSSP
    delete spacings;
#endif
#ifdef BINSSPU
    delete[] unfolded_sp;
#endif
#ifdef SPACINGS    
    delete[] sp;
#endif
//    std::cout << "end freeing memory in free_binning_memory\n";
    return;
  }
//********* call all binnings and statistics during measurements  
  inline void measurement_binning_statistics() {
#ifdef BINSDENSITY    
    density->bin_data(_Nmeas,particles);
#endif
#ifdef BINSCOR
    correlation->bin_data(_Nmeas,particles);
#endif
#ifdef SPACINGS
    std::memcpy(sp,particles,_Nmeas*sizeof(double));
    std::sort(sp,sp+_N); // we could also use sp for binning of density and correlations
    for (int i=0; i<_N-1; i++) sp[i]=sp[i+1]-sp[i];
#endif    
#ifdef BINSSP    
    spacings->bin_data(_Nmeas-1,sp); 
#endif
#ifdef BINSSPU
    if (measured_unfolded_samples<_unfolded_spacings_samples) {
      std::memcpy(unfolded_sp+measured_unfolded_samples*(_Nmeas-1),sp,(_Nmeas-1)*sizeof(double));
      measured_unfolded_samples++;
    }
#endif

#ifdef CALCPSK
    ps_k->measure(particles);
#endif

      //simple statistics (outside [-x1 x1], near x1, moments, max outlier
    unsigned int ooi_temp=0;
    unsigned int near_x1_temp=0;
    double sum_temp=0; // for 1.moment
    double sum2_temp=0; // for 2.moment
    double max_temp=abs(particles[0]);
    for (int i=0; i<_Nmeas; i++) {
      double posabs=abs(particles[i]);
      sum_temp+=particles[i];
      if (posabs>max_temp) max_temp=posabs;
      sum2_temp+=posabs*posabs;
      if (posabs>X1) ooi_temp++;
      if (posabs>X1-DX1/(double)2 && posabs<X1+DX1/(double)2) near_x1_temp++;  
    }
    part_stat_sum+=sum_temp;
    part_stat_sum2+=sum2_temp;
    outlier.input_data(max_temp);
    ooi.input_data(ooi_temp);
    near_x1.input_data(near_x1_temp);    
    return;
  }
// *** BINNING dump data (define filenames for all binnings and statistics ***
  public:
  inline void binning_dump_data(unsigned long int saved_samples) { 
#ifndef OPENCLOSE
    fclose(samples_fh);
#endif
    _logmsg->write_unsigned_long_int(saved_samples);
#ifdef RECORDEDSAMPLESDISTRIBUTED     
    _logmsg->write(" samples saved (distributed) with 1 sample per row: ");
#else
    _logmsg->write(" samples saved with 1 sample per row: ");
#endif
    _logmsg->write(filename_samples);
    _logmsg->write_oc("\n\n");
#ifdef BINSDENSITY
    const char filename_end_density[]="_density.dat";
#endif
#ifdef BINSCOR
    const char filename_end_correlation[]="_correlation.dat";
#endif
#ifdef BINSSP
    const char filename_end_spacings[]="_spacings.dat";
#endif
#ifdef BINSSPU
    const char filename_end_unfolded_spacings[]="_unfolded_spacings.dat";
#endif
    const char filename_end_stat[]="_stat.dat"; 
#ifdef MATLAB
    const char filename_end_matlab[]=".matlab"; 
#endif 
    const int max_length_add=80;
    char * filename_density, * filename_correlation, * filename_spacings, * filename_spacings_unfolded, * filename_statistics, * filename_matlab;
    filename_density=new char[strlen(_basefilename)+max_length_add];
    filename_correlation=new char[strlen(_basefilename)+max_length_add];
    filename_spacings=new char[strlen(_basefilename)+max_length_add];
    filename_spacings_unfolded=new char[strlen(_basefilename)+max_length_add];
    filename_statistics=new char[strlen(_basefilename)+max_length_add];
    filename_matlab=new char[strlen(_basefilename)+max_length_add];
#ifdef BINSDENSITY
    strcpy(filename_density,_basefilename);
    strcat(filename_density,filename_end_density);
    density->dump_data(filename_density,(double)_Nmeas*_total_samples);
#endif   
#ifdef BINSCOR
    strcpy(filename_correlation,_basefilename);
    strcat(filename_correlation,filename_end_correlation);
    correlation->dump_data(filename_correlation,(double)_Nmeas*(double)(_Nmeas-1)*_total_samples);
#endif
#ifdef BINSSP
    strcpy(filename_spacings,_basefilename);
    strcat(filename_spacings,filename_end_spacings);
    spacings->dump_data(filename_spacings,(double)(_Nmeas-1)*_total_samples);
#endif
#ifdef BINSSPU
    strcpy(filename_spacings_unfolded,_basefilename);
    strcat(filename_spacings_unfolded,filename_end_unfolded_spacings);
    _logmsg->write("Calculate unfolded spacings for ");
    _logmsg->write_unsigned_long_int(_unfolded_spacings_samples);
    _logmsg->write_oc(" samples, max unfolded spacing=");
    for (int i=0; i<_Nmeas-1; i++) sp[i]=0;
    for (unsigned long int j=0; j<_unfolded_spacings_samples; j++) {
      for (int i=0; i<_Nmeas-1; i++) sp[i]+=unfolded_sp[j*(unsigned long int)(_Nmeas-1)+(unsigned long int)i];
    }
    for (int i=0; i<_Nmeas-1; i++) sp[i]=(double)_unfolded_spacings_samples/sp[i];
    double unfolded_spacing_max=0;
    for (unsigned long int j=0; j<_unfolded_spacings_samples; j++) {
      for (int i=0; i<_Nmeas-1; i++) { 
        unfolded_sp[j*(unsigned long int)(_Nmeas-1)+(unsigned long int)i]*=sp[i];
        if (unfolded_sp[j*(unsigned long int)(_Nmeas-1)+(unsigned long int)i]>unfolded_spacing_max) unfolded_spacing_max=unfolded_sp[j*(unsigned long int)(_Nmeas-1)+(unsigned long int)i];
      }
    }
    const double unfolded_spacing_max_rounded=(double)ceil(10.0*unfolded_spacing_max)*0.1;
    _logmsg->write_double(unfolded_spacing_max);
    _logmsg->write_oc("\n");
    binning_1d unfolded_spacings(0,BINSSPSUS,BINSSPU,"unfolded spacings",_logmsg);
    unfolded_spacings.bin_data(_unfolded_spacings_samples*(_Nmeas-1),unfolded_sp);
    unfolded_spacings.dump_data(filename_spacings_unfolded,(double)(_Nmeas-1)*(double)_unfolded_spacings_samples);
#endif

//write out data of formfactor and power sepctrum
#ifdef CALCPSK
    ps_k->finish();
#endif

// write out simple statistics
    std::cout << "ev outside of [" << -X1 << "," << X1 << "] (avg, var, max): " << ooi.get_mean((double)_total_samples) << ", " << ooi.get_var((double)_total_samples) << ", " << ooi.get_maxmax() << "\n";
    std::cout << "ev near x1 in [" << X1-DX1/2 << "," << X1+DX1/2 << "] and mirrored (avg, var, max, density): " << near_x1.get_mean((double)_total_samples) << ", " << near_x1.get_var((double)_total_samples) << ", " << near_x1.get_maxmax() << ", " << near_x1.get_mean((double)_total_samples*(double)_Nmeas*(double)DX1*2.0) << "\n";
    std::cout << "moments (1, 2): " << part_stat_sum/((double)_total_samples*(double)_N) << ", " << part_stat_sum2/((double)_total_samples*(double)_N) << " max outlier (avg per sample, var, max): " << outlier.get_mean((double)_total_samples) << ", " << outlier.get_var((double)_total_samples) << ", " << outlier.get_maxmax() << "\n";
// write to statistics file
    strcpy(filename_statistics,_basefilename);
    strcat(filename_statistics,filename_end_stat);
    _logmsg->write("Write statistics to: ");
    _logmsg->write(filename_statistics);
    _logmsg->write_oc("\n");
    FILE * stat_fh=fopen(filename_statistics, FWRITE);
    fprintf(stat_fh,"%% ev outside of [%.15lf,%.15lf] (avg, var, max)\n%.15lf\n%.15lf\n%.15lf\n\n",-(double)X1,(double)X1,ooi.get_mean((double)_total_samples),ooi.get_var((double)_total_samples),ooi.get_maxmax());
    fprintf(stat_fh,"%% ev near x1 in [%.15lf,%.15lf] and mirrored (avg, var, max, density)\n%.15lf\n%.15lf\n%.15lf\n%.15lf\n\n",(double)X1-(double)DX1/2.0,(double)X1+(double)DX1/2.0,near_x1.get_mean((double)_total_samples),near_x1.get_var((double)_total_samples),near_x1.get_maxmax(),near_x1.get_mean((double)_total_samples*(double)_Nmeas*(double)DX1*2.0));
    fprintf(stat_fh,"%% moments (1, 2):\n%.15lf\n%.15lf\n\n",part_stat_sum/((double)_total_samples*(double)_N),part_stat_sum2/((double)_total_samples*(double)_N));
    fprintf(stat_fh,"%% max outlier (avg per sample, var, max)\n%.15lf\n%.15lf\n%.15lf\n\n",outlier.get_mean((double)_total_samples),outlier.get_var((double)_total_samples),outlier.get_maxmax());
    fclose(stat_fh);


// write out matlab code
#ifdef MATLAB
    strcpy(filename_matlab,_basefilename);
    strcat(filename_matlab,filename_end_matlab);
    log_output log_matlab(filename_matlab);
    _logmsg->write("Write matlab code to: ");
    _logmsg->write(filename_matlab);
    _logmsg->write_oc("\n");    
#endif
#ifdef MATLABLOAD
    log_matlab.log_matlab_load(filename_samples, filename_density, filename_correlation, filename_spacings, filename_spacings_unfolded, filename_statistics, saved_samples, _Nmeas, _total_samples);
#endif
#ifdef MATLABPLOT
    log_matlab.log_matlab_plot(_Nmeas);
#endif    

    delete[] filename_density;
    delete[] filename_correlation;
    delete[] filename_spacings;
    delete[] filename_spacings_unfolded;
    delete[] filename_statistics;
    delete[] filename_matlab;
    return;
  }
//********** Potential Energie ***********************************************  
  protected:
  inline double potential_energy(const particle_type pos, double & prod) { ; // can do things like exp*erfc as a factor in prod, and exp(-x^2) in exponent
  // later: should call function referenced as a pointer defined in the setup in main. We define it directly for the moment:
  // e_exponent= V(x)
    return (double)(pos);
  }

  inline double potential_energy_combi(const particle_type posold, const particle_type posnew) {
// gives deltaE = -N (V(posnew)-V(posold))
    return (double)(posold-posnew); 
  }
//********** Metropolis algorithm ********************************************
  inline void decide_metropolis(const int k, const double &delta_e, const particle_type &newpos, const particle_type &deltapos) {
#ifdef DEBUG
     std::cout << "Particle " << k << " with deltapos " << deltapos << " with deltaE " << delta_e << " at newpos " << newpos;
#endif
    if (delta_e>=0) {
      particle_move(k,delta_e,newpos);
      accept_e++;
#ifdef TRAJSTAT
      traj[k]+=abs(deltapos);
#endif
#ifdef ENERGYMINMAX
      if (total_energy<energy_stat_min) energy_stat_min=total_energy;
#endif
#ifdef DEBUG      
      std::cout << " accepted. deltaE<0.";
#endif      
    } else {
//   Boltzmann weight: exp(delta_e), delta_e is negative if the new position has higher energy
      register double r=distu(gen);
      if (r<exp(delta_e)) {
#ifdef DEBUG      
        std::cout << " accepted. r= " << r << "\n";
#endif	
        particle_move(k,delta_e,newpos);
        accept_p++;
#ifdef TRAJSTAT
        traj[k]+=abs(deltapos);
#endif
#ifdef ENERGYMINMAX
        if (total_energy>energy_stat_max) energy_stat_max=total_energy;
#endif
      }
    }
#ifdef DEBUG    
    std::cout << "\n";
#endif    
    return;
  }
//*********** Random Steps (adapt random distribution here) ***************
  inline particle_type random_step() { // mean of |random_step()| must be _avgstepsize
    const double maxstepsize=4*_avgstepsize;
    return (distu(gen)-0.5)*maxstepsize;  // one could also use another random distribution
  }
//*************** CONSTRAINTS **********************************************  
  inline bool constraints(particle_type newpos) {
    return true;
  }
//******** MC step (uncommend constraints(newpos) if there are constraints***  
  public:
  void mc_step() {
    for (int k=0; k<_N; k++) {
      const particle_type oldpos=particles[k];
      const particle_type delta_pos=random_step();
      const particle_type newpos=oldpos+delta_pos;
//      if (constraints(newpos)) {
//    maybe use constraints instead of below
//      if (newpos>=0 && newpos <=1) { // for JUE Jacobi unitary ensemble
      if (newpos>=0) {
      
        LargeExponentFloat prod1(1.0);
	LargeExponentFloat prod2(1.0);

        prod_diff_realrealvec(_N,k,newpos,oldpos,particles,prod1,prod2);
//	prod1.significand*=prod1.significand; //square
//	prod2.significand*=prod2.significand; //square
//        prod1.exponent*=2; //square
//        prod2.exponent*=2; //square

//	prod_diff_realrealvec(_N,k,-oldpos,-newpos,particles,prod1,prod2); // additional factor in modified Vandermonde // for Burse-Hall
        double factor=newpos/oldpos;
        double delta_e=potential_energy_combi(oldpos, newpos);
	double division=std::abs(prod1.significand/prod2.significand);
        double logfactor=log(factor);
	double logdivision=log(std::abs(division));
        delta_e+=_a*logfactor+(logdivision+(double)(prod1.exponent-prod2.exponent)*VANDERMONDE_DET_EXPONENT_BASIS_LOG)*2.0; // factor 2 to square the Vandermonde
        decide_metropolis(k,delta_e,newpos,delta_pos);
//      } // else reject_c++; 
      }  
    }
// add some statistics which has to be calculated after each full MC step
#ifdef MOMENT
    moments_each_step->input_data(particles);
#endif
    return;
  }


//**************************************************************************
//**************************************************************************
//**************************************************************************
  protected:
  void distance_prod(particle_type pos, int k, double &prod, EXPINT &exponent) {  // calculates product of differencess to pos squared to all particles of the same class exept to k-th particle): Prod_(i not k) (pos-x_i)^2. Everything is multiplied with what has been initially in prod.
//    std::cout << "k=" << k << "\n ";
    for (int j=0; j<k; j++) {
      double dist=pos-particles[j];
      prod*=abs(dist);
//      if (prod<0) prod=-prod; //needed below to check over/underflow

#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod>toohigh) {
        prod*=toolow;
        exponent++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod<toolow)  {
        prod*=toohigh;
        exponent--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }
    }
    for (int j=k+1; j<_N; j++) {
      double dist=pos-particles[j];
      prod*=abs(dist);
//      if (prod<0) prod=-prod;

#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod>toohigh) {
        prod*=toolow;
        exponent++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod<toolow)  {
        prod*=toohigh;
        exponent--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }
    }
    return;
  } 

  void distance_prod_combi(const particle_type pos, const int k, double &prod1, double &prod2, EXPINT &exponent1, EXPINT &exponent2) {  // calculates product of differencess to pos squared to all particles of the same class exept to k-th particle): Prod_(i not k) (pos-x_i)^2. Everything is multiplied with what has been initially in prod. Exponent2 could also be combined in one exponent=exponent1-exponent2;
    const particle_type pos_k=particles[k];
    for (int j=0; j<k; j++) {
      double dist1=pos-particles[j];
      double dist2=pos_k-particles[j];
      prod1*=abs(dist1);
      prod2*=abs(dist2);
#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod1>toohigh) {
        prod1*=toolow;
        exponent1++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod1<toolow)  {
        prod1*=toohigh;
        exponent1--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }
#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod2>toohigh) {
        prod2*=toolow;
        exponent2++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod2<toolow)  {
        prod2*=toohigh;
        exponent2--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }
    }
    for (int j=k+1; j<_N; j++) {
      double dist1=pos-particles[j];
      double dist2=pos_k-particles[j];
      prod1*=abs(dist1);
      prod2*=abs(dist2);

#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod1>toohigh) {
        prod1*=toolow;
        exponent1++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod1<toolow)  {
        prod1*=toohigh;
        exponent1--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }
#ifdef COUNTOVERUNDERFLOW
      overunderflowchecks++;
#endif
      if (prod2>toohigh) {
        prod2*=toolow;
        exponent2++;
#ifdef COUNTOVERUNDERFLOW
        overflow++;
#endif
      } else if (prod2<toolow)  {
        prod2*=toohigh;
        exponent2--;
#ifdef COUNTOVERUNDERFLOW
        underflow++;
#endif
      }

    }
    return;
  }

  inline void particle_move(const int k, const double &delta_e, const particle_type &pos) {
    particles[k]=pos;
    total_energy-=delta_e;
#ifdef UPDATESTAT
    update_stat[k]++;
#endif
    return;
  }



  public:
  const double beta=1; // beta index of symmetry class (GOE beta=1, GUE beta=2, G

  const EXPINT exponent_low_high=511; //should be half of range of exponent of double
  const double toohigh=pow(2,exponent_low_high);
  const double toolow=pow(2,-exponent_low_high);
  const double factor_exponent=log((double)2)*(double)exponent_low_high;

  particles_1d(const int N, const double a, const double initx1, const double initx2, const double avgstepsize, const unsigned long int eq_steps, const unsigned long int total_samples, const unsigned long int steps_between_samples, const unsigned long int unfolded_spacings_samples, log_output * const logmsg, const char * basefilename) :
  _N(N),
  _a(a),
  _Ntrue(N),
  _Nmeas(N),
  _initx1(initx1),
  _initx2(initx2),
  _avgstepsize(avgstepsize),
  _eq_steps(eq_steps),
  _total_samples(total_samples),
  _steps_between_samples(steps_between_samples),
  _unfolded_spacings_samples(unfolded_spacings_samples),
  _logmsg(logmsg),
  _basefilename(new char[strlen(basefilename)+1]),
//  filename_samples(new char[200]),
#ifdef TRAJSTAT
  traj(new double[N]),
#endif
#ifdef UPDATESTAT
  update_stat(new unsigned int[N]),
#endif
#ifdef MOVESTAT
  particles_old(new particle_type[N]),
#endif
  particles(new_double_array(N)) { // constructor
    if (N<=0) {
      std::cout << "There must be at least 1 particle in particles_1d. #particles=" << N << "\n";
      exit(-1);
    }
#ifdef TRAJSTAT
    if (traj==NULL) {
      std::cout << "Memory for traj not allocated: " << N*sizeof(double) << "Bytes\n";
      exit(1);
    }
    reset_traj_stat();
#endif
#ifdef MOMENT
    moments_each_step=new simple_statistics_const_length(N);
#endif
#ifdef UPDATESTAT
    if (update_stat==NULL) {
      std::cout << "Memory for update_stat not allocated: " << N*sizeof(unsigned int) << "Bytes\n";
      exit(1);
    }
    reset_update_stat();
#endif
#ifdef MOVESTAT
    if (particles_old==NULL) {
      std::cout << "Memory for particles_old not allocated: " << N*sizeof(particle_type) << "Bytes\n";
      exit(1);
    }
#endif

    if (particles==NULL) {
      std::cout << "Memory for particles not allocated: " << N*sizeof(particle_type) << "Bytes\n";
      exit(1);
    }
#ifdef COUNTOVERUNDERFLOW
    clear_overunderflow_stat();
#endif
    init_random_positions();
    reserve_binning_memory();
    strcpy(_basefilename,basefilename);
    const char filename_samples_end[]=".dat";
    filename_samples=new char[strlen(basefilename)+strlen(filename_samples_end)+1];
    strcpy(filename_samples,basefilename);
    strcat(filename_samples,filename_samples_end);
    samples_fh=fopen(filename_samples, FWRITE);
    if(samples_fh == NULL) {
      printf("Error opening file: %s\n",filename_samples);
      exit(-1);
    }
#ifdef OPENCLOSE
    fclose(samples_fh);
#endif 

#ifdef CALCPSK
    ps_k=new formfactor_powerspectrum(N,total_samples,logmsg,basefilename);
// reserve memory for form factor and power spectrum calculation
#endif

  }
  ~particles_1d() {
    free_binning_memory();
    delete[] particles;
    delete[] _basefilename;

#ifdef CALCPSK
    delete ps_k; // freeing memory from form factor and power spectrum calculation
#endif

//TODO: CHECK why there the program gets aborded when we try to free filename_samples
    //delete[] filename_samples;
#ifdef MOVESTAT
    delete[] particles_old;
#endif
#ifdef UPDATESTAT
    delete[] update_stat;
#endif
#ifdef TRAJSTAT
    delete[] traj;
#endif
  }

  inline void init_random_positions() {
    if (_initx1==_initx2) {
      for (int i=0; i<_N; i++) particles[i]=_initx1; 
    } else {
      const double dx=_initx2-_initx1;
      for (int i=0; i<_N; i++) particles[i]=_initx1+distu(gen)*dx;
    }
    total_energy=calc_total_energy_direct();
    accept_p=0; accept_e=0;
    accept_p_lap=0; accept_e_lap=0;

    return;
  }
  

  void get_particles_positions( particle_type * particles_positions) { 
     std::memcpy(particles_positions,particles,_N*sizeof(particle_type));
  }
  inline void measurement_write() {
#ifdef OPENCLOSE
    samples_fh=fopen(filename_samples,FAPPEND);
#endif
    for (int i=0; i<_Nmeas; i++) {
      fprintf(samples_fh,OUTFORMAT,particles[i]);
    }
    fprintf(samples_fh,"\n");
#ifdef OPENCLOSE
    fclose(samples_fh);
#endif
  }

  inline void measurement() { 
    measurement_binning_statistics();

#ifdef TRAJSTAT
    double traj_min;
    double traj_avg;
    get_traj_stat(traj_min,traj_avg);
    reset_traj_stat();
    if (traj_min<traj_minmin) traj_minmin=traj_min;
    traj_avgmin+=traj_min;
    traj_avgavg+=traj_avg;
#endif
#ifdef UPDATESTAT
    unsigned int update_min_temp=get_update_stat();
    reset_update_stat();
    if (update_min_temp<update_stat_min) update_stat_min=update_min_temp;
    update_stat_sum+=update_min_temp;
#endif
#ifdef MOVESTAT
    double sum_move_stat_temp=0;
    double sum_move2_stat_temp=0;
    for (int i=0; i<_N; i++) {
      double move=abs(particles[i]-particles_old[i]);
      sum_move_stat_temp+=move;
      sum_move2_stat_temp+=move*move;
    }
    sum_move_stat+=sum_move_stat_temp;
    sum_move2_stat+=sum_move2_stat_temp;
#endif
#ifdef MOVESTATPERM
    fisher_yates_shuffle(particles_old,_N);
    double sum_move_stat_perm_temp=0;
    double sum_move2_stat_perm_temp=0;    
    for (int i=0; i<_N; i++) {
      double move=abs(particles[i]-particles_old[i]);
      sum_move_stat_perm_temp+=move;
      sum_move2_stat_perm_temp+=move*move;
    }
    sum_move_stat_perm+=sum_move_stat_perm_temp;
    sum_move2_stat_perm+=sum_move2_stat_perm_temp;
    if (sum_move_stat_temp>=sum_move_stat_perm_temp) move_perm_smaller_mean++;
#endif
#ifdef MOVESTAT
    for (int i=0; i<_N; i++) {
      particles_old[i]=particles[i];
    }
#endif
  }
  double get_total_energy() { return total_energy; } // gives back current total energy, without calculating it directly

  double calc_total_energy_direct() {

// OLD CODE --------------------
    double prod=1;
//    double prod2=1;
    double prod3=1;
    double e_exponent_total=0; 
    EXPINT exponent=0;
//    EXPINT exponent2=0;
    EXPINT exponent3=0;

    for (int i=0; i<_N; i++) { 
      const double posi=particles[i];
      for (int k=i+1; k<_N; k++) {
        double dist=posi-particles[k];
        prod*=abs(dist);
//	prod2*=posi+particles[k]; // for extra factor in modified Vandermonde for Burse-Hall

#ifdef COUNTOVERUNDERFLOW
        overunderflowchecksE+=2;
#endif
        if (prod>toohigh) {
          prod*=toolow;
          exponent++;
#ifdef COUNTOVERUNDERFLOW
          overflowE++;
#endif
        } else if (prod<toolow)  {
          prod*=toohigh;
          exponent--;
#ifdef COUNTOVERUNDERFLOW
          underflowE++;
#endif
        }

/*
        if (prod2>toohigh) {
          prod2*=toolow;
          exponent2++;
#ifdef COUNTOVERUNDERFLOW
          underflowE++; // count as underflow since factor is in denominator
#endif
        } else if (prod2<toolow)  {
          prod2*=toohigh;
          exponent2--;
#ifdef COUNTOVERUNDERFLOW
          overflowE++; // count as overflow since factor is in denominator
#endif
        }
*/	
      }
      e_exponent_total+=potential_energy(posi,prod);
      
      prod3*=posi;  // for z_i^a term

#ifdef COUNTOVERUNDERFLOW
      overunderflowchecksE++;
#endif
      if (prod3>toohigh) {
        prod3*=toolow;
        exponent3++;
#ifdef COUNTOVERUNDERFLOW
        overflowE++;
#endif
      } else if (prod3<toolow)  {
        prod3*=toohigh;
        exponent3--;
#ifdef COUNTOVERUNDERFLOW
        underflowE++;
#endif
      }

    }
    double logprod=log(prod);
    double logprod3=log(prod3);
    double energy=e_exponent_total - (_a*exponent3+(double)(2*exponent))*factor_exponent;
    energy-=2*logprod+_a*logprod3; // factor 2 to square Vandermonde
// ------- END of OLD CODE --------------
  return energy;
  }

  inline const int get_dimension() { return d; }
  inline const int get_nparticles() { return _N; }
  inline const double get_nparticles_true() { return _Ntrue; } // included fixed charges
  inline const unsigned int get_nmeasured_coordinates () { return _Nmeas; } // number of coordinates that we get from measurement, typically N (for N*N matrix particle it is also N
  inline const bool get_mirrored() { return mirrored; }
  inline const int get_nkind() { return _nkind; }
  inline const int get_particle_memory() { return sizeof(particle_type); }
  inline const unsigned long int get_particles_memory() { return (unsigned long int)_N*sizeof(particle_type); }
  inline double get_runtime_statistic(unsigned long int & get_accept_p, unsigned long int & get_accept_e) { 
    get_accept_p=accept_p; 
    get_accept_e=accept_e; 
    return total_energy;
  }

  inline void reset_runtime_statistic() { 
    accept_p=0; accept_e=0; 
    accept_p_lap=0; accept_e_lap=0;
    return;
  } 

  double lap_runtime_statistic(unsigned long int & accept_p_temp, unsigned long int & accept_e_temp) {
    accept_p_temp=accept_p-accept_p_lap;
    accept_e_temp=accept_e-accept_e_lap;
    accept_e_lap=accept_e;
    accept_p_lap=accept_p;
    return total_energy;
  }

  inline void calibrate() {
    total_energy=calc_total_energy_direct(); 
    return;
  }
  double calibrate_correction() {
    double temp=total_energy;
    total_energy=calc_total_energy_direct(); 
    return total_energy-temp;
  }
#ifdef TRAJSTAT
  void reset_traj_stat() {
    for (int i=0; i<_N; i++) traj[i]=0;
  }
  void get_traj_stat(double &traj_min, double &traj_avg) {
    traj_min=traj[0];
    traj_avg=traj[0];
    for (int i=1; i<_N; i++) {
      if (traj[i]<traj_min) traj_min=traj[i];
      traj_avg+=traj[i];
    }
    traj_avg/=_N;
  }
#endif
#ifdef ENERGYMINMAX
  inline void reset_energy_minmax() {
    energy_stat_min=INFINITY;
    energy_stat_max=-INFINITY;
  }
  inline double get_energy_min() {
    return energy_stat_min;
  }
  inline double get_energy_max() {
    return energy_stat_max;
  }
#endif
#ifdef UPDATESTAT
  void reset_update_stat() {
    for (int i=0; i<_N; i++) update_stat[i]=0;
  }
  unsigned int get_update_stat() {
    unsigned int update_min=update_stat[0];
    for (int i=1; i<_N; i++) {
      if (update_stat[i]<update_min) update_min=update_stat[i];
    }
    return update_min;
  }
#endif 
#ifdef MOVESTAT
  void reset_move_stat() {
    for (int i=0; i<_N; i++) particles_old[i]=particles[i];
    sum_move_stat=0;
    sum_move2_stat=0;
  #ifdef MOVESTATPERM
    sum_move_stat_perm=0;
    sum_move2_stat_perm=0;
    move_perm_smaller_mean=0;
  #endif
  }
  void get_move_stat(double &move_avg, double &move_var, double nsamples) {
    sums2avgvar(sum_move_stat,sum_move2_stat,move_avg,move_var,nsamples);
  }
#endif
#ifdef MOVESTATPERM
  void get_move_stat_perm(double &move_avg, double &move_var, double nsamples, unsigned long int & move_smaller_mean) {
    sums2avgvar(sum_move_stat_perm,sum_move2_stat_perm,move_avg,move_var,nsamples);
    move_smaller_mean=move_perm_smaller_mean;
  }

#endif
#ifdef COUNTOVERUNDERFLOW
  void clear_overunderflow_stat() { 
    underflow=0;
    overflow=0;
    overunderflowchecks=0;
    underflowE=0;
    overflowE=0;
    overunderflowchecksE=0;
  }
#endif

  void status_update(const signed char status_case, const unsigned long int & i, const unsigned long int & pfreq, const double total_time, const bool first) {
    
    unsigned long int accept_p_temp,accept_e_temp;
    double accept_t; 
#ifdef TRAJSTAT
    double trajmin; 
    double trajavg;
#endif

    char buffer[160]; // buffer for snprintf

    switch(status_case) {
      case -2 :
        snprintf(buffer,160,"Starting at energy E = %-9lf, total eq. steps: %-9ld\n",total_energy,_eq_steps);
#ifdef MOMENT
        moments_each_step->reset();
#endif
        break;
      case -1 : // end of equil and start of meas.
        snprintf(buffer,160,"CPU time (equil): %9.2lf seconds = %9.2lf hours = %9.2lf days\n",total_time,total_time/3600,total_time/(3600*24));
        _logmsg->write(buffer);

        accept_t=(double)(accept_p+accept_e);
        snprintf(buffer,160,"Accept rate (total/energy decrease) during equil.: %lf / %lf, Ratio: %lf\n",accept_t/((double)(_N)*(double)_eq_steps),(double)accept_e/((double)(_N)*(double)_eq_steps), accept_t/(double)accept_e);
        _logmsg->write(buffer);
        reset_runtime_statistic();
#ifdef TRAJSTAT
        get_traj_stat(trajmin,trajavg);
        reset_traj_stat();
	snprintf(buffer,160,"Trajectory length of each particles during equil. (min,avg): %lg, %lg\n",trajmin,trajavg);
        _logmsg->write(buffer);
#endif
#ifdef MOMENT
        moments_each_step->reset();
#endif
#ifdef ENERGYMINMAX
        reset_energy_minmax();
#endif
#ifdef UPDATESTAT
        snprintf(buffer,160,"Each position has been updated >=%u times during quil. steps\n",get_update_stat());
        reset_update_stat();
	update_stat_min=4294967295;
        update_stat_sum=0;
        _logmsg->write(buffer);
#endif
#ifdef MOVESTAT
        reset_move_stat();
#endif 

#ifdef COUNTOVERUNDERFLOW
        snprintf(buffer,160,"In multiplications (equil.) prevented underflows/overflows/checks (for energy): %lg / %lg / %lg (%lg / %lg / %lg)\n",(double)underflow,(double)overflow,(double)overunderflowchecks,(double)underflowE,(double)overflowE,(double)overunderflowchecksE);
        _logmsg->write(buffer);
        clear_overunderflow_stat();
#endif

	snprintf(buffer,160,"\nStarting measurement: total samples: %-9ld, steps between samples: %-6ld\n",_total_samples,_steps_between_samples);
        break;
      case 0  :
        if (first) {
          snprintf(buffer,160,"Estimated CPU time (total): %9.2lf seconds = %9.2lf hours = %9.2lf days\n",total_time,total_time/3600,total_time/(3600*24));
          _logmsg->write(buffer);
#ifdef MOMENT
          _logmsg->write("fin. eq. step at  energy:        acc.rates ratio     moment (all steps)\n"); 
#else
          _logmsg->write("fin. eq. step at  energy:        acc.rates ratio\n"); 
#endif	  
	}
	lap_runtime_statistic(accept_p_temp, accept_e_temp);
	accept_t=(double)(accept_e_temp+accept_p_temp);

#ifdef MOMENT
	snprintf(buffer,160,"%9ld     E = %9lf %9lf %9lf %9lf\n",i+1,total_energy,accept_t/(double)(pfreq*_N),accept_t/(double)accept_e_temp,moments_each_step->get_mean(i+1));
#else
        snprintf(buffer,160,"%9ld     E = %9lf %9lf %9lf\n",i+1,total_energy,accept_t/(double)(pfreq*_N),accept_t/(double)accept_e_temp);
#endif
        break;
      case 1:
        if (first) { 
          _logmsg->write("fin. samples at   energy:        acc.rates ratio     moment (all steps)\n");
        }
        lap_runtime_statistic(accept_p_temp, accept_e_temp);
        accept_t=(double)(accept_e_temp+accept_p_temp);

#ifdef MOMENT
        snprintf(buffer,160,"%9ld     E = %9lf %9lf %9lf %9lf\n",i+1,total_energy,accept_t/(double)(pfreq*_N),accept_t/(double)accept_e_temp,moments_each_step->get_mean((double)(i+1)*(double)_steps_between_samples));

#else
        snprintf(buffer,160,"%9ld     E = %9lf %9lf %9lf\n",i+1,total_energy,accept_t/(double)(pfreq*_N),accept_t/(double)accept_e_temp);
#endif
        break;
      case 2: // end of measurement, print out total time and statistics
        snprintf(buffer,160,"CPU time (equil & meas): %9.2lf seconds = %9.2lf hours = %9.2lf days\n",total_time,total_time/3600,total_time/(3600*24));
        _logmsg->write(buffer);
 
        accept_t=(double)(accept_p+accept_e);
        snprintf(buffer,160,"Accept rate (total/energy decrease) during meas.: %lf / %lf, Ratio: %lf\n",accept_t/((double)(_N)*(double)_steps_between_samples*(double)_total_samples),(double)accept_e/((double)(_N)*(double)_steps_between_samples*(double)_total_samples), accept_t/(double)accept_e);
        _logmsg->write(buffer);
#ifdef ENERGYMINMAX
        snprintf(buffer,160,"Energies during measurements (every substep), Min: %lg, Max: %lg\n",get_energy_min(),get_energy_max());
	_logmsg->write(buffer);
#endif
#ifdef TRAJSTAT
        snprintf(buffer,160,"Trajectory length of each particles during meas. (minmin,avgmin,avgavg): %lg, %lg, %lg\n",traj_minmin,traj_avgmin/(double)_total_samples,traj_avgavg/(double)_total_samples);
        _logmsg->write(buffer);
#endif
#ifdef UPDATESTAT
        snprintf(buffer,160,"Updates between samples (minmin,avgmin): %u, %lf\n",update_stat_min,(double)update_stat_sum/(double)_total_samples);
        _logmsg->write(buffer);
#endif
#ifdef MOVESTAT
        double move_avg;
	double move_var;
	const double move_total_steps=(double)_N*(double)_total_samples;
        get_move_stat(move_avg,move_var,move_total_steps);
	snprintf(buffer,160,"Moves of particles from sample to sample (avg, var): %lf, %lf\n", move_avg, move_var);
        _logmsg->write(buffer);
#endif
#ifdef MOVESTATPERM
        double move_avg_perm;
        double move_var_perm;
	unsigned long int move_smaller_mean;
        get_move_stat_perm(move_avg_perm,move_var_perm,move_total_steps,move_smaller_mean);
	const double z=2.576;
	const double inv_sqrt_move_total_steps=1.0/sqrt(move_total_steps);
	double conf_int1=move_avg+z*move_var*inv_sqrt_move_total_steps;
        double conf_int2=move_avg_perm-z*move_var_perm*inv_sqrt_move_total_steps;
        snprintf(buffer,160,"Moves of particles (uniformly permuted)  (avg, var): %lf, %lf\nEstimated confidence intervals: %lf > %lf: ", move_avg_perm, move_var_perm, conf_int1, conf_int2);
        _logmsg->write(buffer);
	if (conf_int1<conf_int2) _logmsg->write("NO\n"); else _logmsg->write("OK\n");
	snprintf(buffer,160,"Mean of permuted moves smaller than unpermuted: %lu out of %lu\n", move_smaller_mean, _total_samples);
        _logmsg->write(buffer);
#endif


#ifdef COUNTOVERUNDERFLOW
        snprintf(buffer,160,"In multiplications (meas.) prevented underflows/overflows/checks (for energy): %lg / %lg / %lg (%lg / %lg / %lg)\n",(double)underflow,(double)overflow,(double)overunderflowchecks,(double)underflowE,(double)overflowE,(double)overunderflowchecksE);
        _logmsg->write(buffer);
#endif
        snprintf(buffer,160,"\n");
	break;
    }
    _logmsg->write(buffer);
    _logmsg->close();
    return;
  }
};  //end class


void convp(char *parmvalue, char *parmstring, double & value) {
  int nscan=sscanf(parmvalue,"%lf",&value);
  if (nscan!=1) {
    std::cout << "parameter could not be converted to double: " << parmvalue << "\n";
    exit(-1);
  }
  snprintf(parmstring,80,"%lf",value);
}

void convp(char *parmvalue, char *parmstring, int & value) {
  int nscan=sscanf(parmvalue,"%d",&value);
  if (nscan!=1) {
    std::cout << "parameter could not be converted to int: " << parmvalue << "\n";
    exit(-1);
  }
  snprintf(parmstring,80,"%d",value);
}

void convp(char *parmvalue, char *parmstring, unsigned int & value) {
  int nscan=sscanf(parmvalue,"%u",&value);
  if (nscan!=1) {
    std::cout << "parameter could not be converted to unsigned int: " << parmvalue << "\n";
    exit(-1);
  }
  snprintf(parmstring,80,"%u",value);
}

void convp(char *parmvalue, char *parmstring, long int & value) {
  int nscan=sscanf(parmvalue,"%ld",&value);
  if (nscan!=1) {
    std::cout << "parameter could not be converted to long int: " << parmvalue << "\n";
    exit(-1);
  }
  snprintf(parmstring,80,"%ld",value);
}

void convp(char *parmvalue, char *parmstring, unsigned long int & value) {
  int nscan=sscanf(parmvalue,"%lu",&value);
  if (nscan!=1) {
    std::cout << "parameter could not be converted to unsigned long int: " << parmvalue << "\n";
    exit(-1);
  }
  snprintf(parmstring,80,"%lu",value);
}




void monte_carlo(const unsigned long int samples, const unsigned long int samples_rec, const unsigned long int eqsteps, const unsigned long int meassteps, particles_1d * const part_system) {
  stopwatch timing;
  timing.start();
  part_system->status_update(-2,eqsteps,eqsteps,0,false);

// starting equilibration
  for (unsigned long int i=0; i<eqsteps; i++) {
    const unsigned long int pfreq=std::max(eqsteps/EQUPDATE,(unsigned long int)1);
    part_system->mc_step();
    if ((i+1)%pfreq==0) {
      if (i+1==pfreq) {
        part_system->status_update(0,i,pfreq,timing.get_time()*(double)(eqsteps+meassteps*samples)/pfreq,true);
      } else part_system->status_update(0,i,pfreq,0,false);
    }
  }
// equilibration finished
  part_system->status_update(-1,samples,samples,timing.get_time(),false);
  const unsigned long int pfreq=std::max(samples/MEASUPDATE,(unsigned long int)1);
  const unsigned long int total_lap_steps=meassteps*pfreq;
  if (samples_rec>=samples) {
    for (unsigned long int i=0; i<samples; i++) {
//      part_system->calibrate();
      for (unsigned long int j=0; j<meassteps; j++) part_system->mc_step();
      part_system->measurement();
      part_system->measurement_write();
      if ((i+1)%pfreq==0) { 
        part_system->calibrate();
        part_system->status_update(1,i,total_lap_steps,0,(i+1==pfreq));
      }
    }
  } else {
#ifdef RECORDEDSAMPLESDISTRIBUTED
    unsigned long int mfreq=ceil((double)samples/(double)samples_rec);
    const unsigned long int mfreq_change=samples-(mfreq-1)*(mfreq)*(samples_rec-ceil((double)samples/(double)mfreq));
#endif
    for (unsigned long int i=0; i<samples; i++) {
//      part_system->calibrate();
      for (unsigned long int j=0; j<meassteps; j++) part_system->mc_step();
      part_system->measurement();
#ifdef RECORDEDSAMPLESDISTRIBUTED
      if (i==mfreq_change) mfreq--;
      if (i%mfreq==0) part_system->measurement_write();
#else
      if (i<samples_rec) part_system->measurement_write();
#endif 
      if ((i+1)%pfreq==0) { 
        part_system->calibrate();  //DEBUG TOTAL ENERGY: replace by line below
//        std::cout << "\nDeltaEcor=" <<  part_system->calibrate_correction() << "\n";
        part_system->status_update(1,i,total_lap_steps,0,(i+1==pfreq));
      }
    }

  }
// measurement finished
  part_system->status_update(2,samples,samples,timing.get_time(),false);
  part_system->binning_dump_data((double)samples_rec);
  std::cout << "\n\n";
}

int main(int argc, char *argv[]) {
  const int parmc=9;
  char * parmvalue[parmc];
  for (int i=0; i<parmc; i++) parmvalue[i]=new char[80];

  const char *parmname[]={"particles","a","samples","recorded samples","equil. steps","steps betw meas","avg stepsize","init x","seed"};
  const char *parmnameshort[]={"N","a","M","Mrec","eq","msteps","dx","A","j"};
  const char *parmdesc[]={"Dimension of Matrix (#ev)","parameter a (a>-1)","#samples","#recorded samples","steps to equilibrium","steps between measurements","average stepsize","maximal value for inital coordinates","seed"};
  const bool parmgroup[]={0,0,1,0,1,0,0,0,0};
  
  int parm_N; 
  double parm_a;
  unsigned long int parm_M, parm_Mrec, parm_eq, parm_msteps;
  double parm_dx, parm_A;
  unsigned int parm_seed;

  if (argc==1) { }  // READ IN PARM: TODO
  if (argc!=parmc+2) {
    std::cout << "Wrong numbers of parameters.\n";
    std::cout << argv[0] << " filename ";
    for (int i=0; i<parmc; i++) std::cout << parmnameshort[i] << " ";
    std::cout << "\n";
    for (int i=0; i<parmc; i++) std::cout << parmnameshort[i] << ": " << parmdesc[i] << "\n";
    const char example[]="example 1000 -0.5 100000 200 1000000 100 0.5 1 0";
    std::cout << "Example: "<< argv[0] << " " << example << "\n"; 
    exit(-1);
  }
 
  char *base_filename=new char[strlen(argv[1])+1];  //TODO: delete base_filename at the very end. 
  char filename[320],filename_log[320]; //TODO allocate size depending on length of filename, ie. strlen(base_filename) + ... 
  base_filename=argv[1];
  convp(argv[0+2],parmvalue[0],parm_N);
  convp(argv[1+2],parmvalue[1],parm_a);
  convp(argv[2+2],parmvalue[2],parm_M);
  convp(argv[3+2],parmvalue[3],parm_Mrec);
  convp(argv[4+2],parmvalue[4],parm_eq);
  convp(argv[5+2],parmvalue[5],parm_msteps);
  convp(argv[6+2],parmvalue[6],parm_dx);
  convp(argv[7+2],parmvalue[7],parm_A);
  convp(argv[8+2],parmvalue[8],parm_seed);
  snprintf(filename,320,"%s_N%d_a%lf_M%lu_Mrec%lu_eq%lu_msteps%lu_dx%lf_A%lf_j%u",base_filename,parm_N,parm_a,parm_M,parm_Mrec,parm_eq,parm_msteps,parm_dx,parm_A,parm_seed);
  snprintf(filename_log,320,"%s.log",filename);
  const char potential[]="";
  const char vandermonde[]="Delta(x_1,...,x_k)=Prod_{i<j}(x_i-x_j)";
  const char jpdf[]="P(x_1,...,x_k)=const*Delta^2(x_1,...,x_N)*Prod_{i=1}^N x_i^a exp(-x_i)";
//  const char constraints[]="0<=x_i<=1";
  const char constraints[]="x_i>=0";
  const char comments[]="";
  const char start_message[]="Monte Carlo Simulation of the Laguerre unitary e ensemble (LUE) using the metropolis algorithm\n";

  const unsigned long int max_unfolded_spacings_sample=std::min(parm_M,(unsigned long int)floor((double)MAXMEMORYUNFOLDEDSPACINGS/(double)(sizeof(double)*(parm_N-1))));

  log_output logmsg(filename_log);
  logmsg.log_msg_start(start_message,argc,argv,parmc,parmname,parmvalue,parmgroup,potential,vandermonde,jpdf,constraints,comments,parm_M,max_unfolded_spacings_sample);
  for (int i=0; i<parmc; i++) delete[] parmvalue[i];
  gen.seed(5489u+parm_seed);
  // warming up random generator (maybe not needed)
  for (long int i=0; i<10000000; i++) {
    double r=distu(gen);
  }

  particles_1d particles(parm_N,parm_a,0,parm_A,parm_dx,parm_eq,parm_M,parm_msteps,max_unfolded_spacings_sample,&logmsg,filename);
  monte_carlo(parm_M,parm_Mrec,parm_eq,parm_msteps,&particles);

  return 0;
}


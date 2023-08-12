#ifndef VANDERMONDE_DET_TEST_H
#define VANDERMONDE_DET_TEST_H

extern const long int vandermonde_exponent_low_high;
extern const double vandermonde_factor_ln;

void prod_diff_realrealvec_test(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double* x,
        double& prod1,
        double& prod2,
	long int& exponent1,
	long int& exponent2
);

void prod_dist2_realcomplexvec_test(
        const long int N,
        const double u1,
        const double u2,
        const double* x,
        const double* y,
        double& prod1,
        double& prod2,
        long int& exponent1,
        long int& exponent2
);

void prod_dist2_complexrealvec_test(
        const long int N,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double* x,
        double& prod1,
        double& prod2,
        long int& exponent1,
        long int& exponent2
);

void prod_dist2_complexcomplexvec_test(
        const long int N,
        const long int k,
        const double u1,
        const double u2,
        const double v1,
        const double v2,
        const double* x,
        const double* y,
        double& prod1,
        double& prod2,
        long int& exponent1,
        long int& exponent2
);

void vandermonde_real_test(
        const long int N,
        const double* x,
	double &prod,
	long int &exponent
);

void vandermonde_abs2_complex_test(
        const long int N,
        const double* x,
        const double* y,
	double &prod,
	long int &exponent
);

void vandermonde_abs2_mixed_terms_test(
        const long int Nreal,
        const long int Ncomplex,
        const double* lambda,
        const double* x,
        const double* y,
	double &prod,
	long int &exponent
);

#endif

#ifndef TIMER_H
#define TIMER_H

#include <chrono>

class Timer {
public:
    typedef std::chrono::system_clock Clock;

    static Clock::duration zero() {
      return std::chrono::milliseconds(0);
    }

    static Clock::time_point now() {
      return Clock::now();
    }

    Timer() {
      elapsed = zero();
      running = false;
    }

    Timer(const Timer&) = delete;
    Timer& operator=(const Timer&) = delete;

    void start() {
      running = true;
      started = now();
    }

    void restart() {
      running = true;
      elapsed = zero();
      started = now();
    }

    double getTimeElapsed() {
      Clock::duration elapsed = this->elapsed;
      if (running) {
        elapsed += timeSinceStart();
      }
      return toSeconds(elapsed);
    }

    double stopAndAddTime() {
      Clock::duration dt = timeSinceStart();
      if (dt > zero()) {
        elapsed += dt;
      }
      running = false;
      return toSeconds(elapsed);
    }

    void reset() {
      elapsed = zero();
      running = false;
    }

private:
    double toSeconds(Clock::duration duration) {
      return std::chrono::duration_cast<std::chrono::nanoseconds>(duration).count()
             / 1.0e9;
    }

    Clock::duration timeSinceStart() {
      Clock::time_point end = now();
      return end - started;
    }

    Clock::time_point started;
    Clock::duration elapsed;
    bool running;

};

#endif

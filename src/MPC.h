#ifndef MPC_H
#define MPC_H

#include <vector>
#include "Eigen-3.3/Eigen/Core"

using namespace std;

class MPC {
public:
    struct constants {
        // This value assumes the model presented in the classroom is used.
        //
        // It was obtained by measuring the radius formed by running the vehicle in the
        // simulator around in a circle with a constant steering angle and velocity on a
        // flat terrain.
        //
        // Lf was tuned until the radius formed by the simulating the model
        // presented in the classroom matched the previous radius.
        //
        // This is the length from front to CoG that has a similar radius.
        static constexpr auto const Lf = 2.67;
        static constexpr auto const mph_to_ms_factor = 0.44704;
        static constexpr auto const ref_v = 50.;
        static constexpr auto const latency = 0.1;
    };
public:
    MPC();

    virtual ~MPC();

    vector<double> cur_x_vals;
    vector<double> cur_y_vals;

    // Solve the model given an initial state and polynomial coefficients.
    // Return the first actuatotions.
    vector<double> Solve(Eigen::VectorXd state, Eigen::VectorXd coeffs);
};

#endif /* MPC_H */
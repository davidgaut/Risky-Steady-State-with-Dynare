function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 18);

T(1) = 1-1/params(3);
T(2) = params(8)/T(1);
T(3) = params(6)*y(6)/y(2);
T(4) = T(2)*T(3)^T(1)+params(9);
T(5) = params(6)^(-params(1));
T(6) = y(12)*T(5);
T(7) = y(2)^params(1);
T(8) = params(10)/params(6);
T(9) = T(8)*y(19);
T(10) = (-1)/params(3);
T(11) = params(8)*T(3)^T(10);
T(12) = params(6)^(1-params(1));
T(13) = params(1)*y(18)*T(12);
T(14) = y(7)^(params(1)-1);
T(15) = params(6)*y(17)/y(7);
T(16) = params(9)+1-params(4)+T(2)*T(15)^T(1);
T(17) = params(8)*T(15)^T(10);
T(18) = T(13)*T(14)+T(16)/T(17)-T(15);

end

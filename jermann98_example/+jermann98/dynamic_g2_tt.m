function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g2_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 44);

T = jermann98.dynamic_g1_tt(T, y, x, params, steady_state, it_);

T(33) = getPowerDeriv(T(3),T(1),2);
T(34) = getPowerDeriv(y(4)-params(2)*y(1)/params(6),(-params(5)),2);
T(35) = (-(params(2)/params(6)))*T(34);
T(36) = getPowerDeriv(params(6)*y(16)-y(4)*params(2),(-params(5)),2);
T(37) = getPowerDeriv(T(3),T(10),2);
T(38) = getPowerDeriv(T(15),T(1),2);
T(39) = getPowerDeriv(T(15),T(10),2);
T(40) = (T(17)*T(17)*(T(2)*T(24)*T(25)*params(8)*T(24)*T(26)+T(17)*T(2)*T(24)*T(24)*T(38)-(T(2)*T(24)*T(25)*params(8)*T(24)*T(26)+T(16)*params(8)*T(24)*T(24)*T(39)))-(T(17)*T(2)*T(24)*T(25)-T(16)*params(8)*T(24)*T(26))*(T(17)*params(8)*T(24)*T(26)+T(17)*params(8)*T(24)*T(26)))/(T(17)*T(17)*T(17)*T(17));
T(41) = (T(17)*T(17)*(T(2)*T(24)*T(25)*params(8)*T(26)*T(31)+T(17)*T(2)*(T(25)*(-params(6))/(y(7)*y(7))+T(24)*T(31)*T(38))-(params(8)*T(24)*T(26)*T(2)*T(25)*T(31)+T(16)*params(8)*(T(26)*(-params(6))/(y(7)*y(7))+T(24)*T(31)*T(39))))-(T(17)*T(2)*T(24)*T(25)-T(16)*params(8)*T(24)*T(26))*(T(17)*params(8)*T(26)*T(31)+T(17)*params(8)*T(26)*T(31)))/(T(17)*T(17)*T(17)*T(17))-(-params(6))/(y(7)*y(7));
T(42) = params(8)*(T(28)*T(28)*T(37)+T(23)*(-((-(params(6)*y(6)))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2)));
T(43) = (-((-(params(6)*y(17)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7));
T(44) = T(13)*getPowerDeriv(y(7),params(1)-1,2)+(T(17)*T(17)*(T(2)*T(25)*T(31)*params(8)*T(26)*T(31)+T(17)*T(2)*(T(31)*T(31)*T(38)+T(25)*T(43))-(T(2)*T(25)*T(31)*params(8)*T(26)*T(31)+T(16)*params(8)*(T(31)*T(31)*T(39)+T(26)*T(43))))-(T(17)*T(2)*T(25)*T(31)-T(16)*params(8)*T(26)*T(31))*(T(17)*params(8)*T(26)*T(31)+T(17)*params(8)*T(26)*T(31)))/(T(17)*T(17)*T(17)*T(17))-T(43);

end

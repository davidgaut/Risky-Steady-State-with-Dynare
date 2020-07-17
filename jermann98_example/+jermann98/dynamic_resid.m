function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = jermann98.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(12, 1);
lhs = params(6)*y(7);
rhs = (1-params(4))*y(2)+y(2)*T(4);
residual(1) = lhs - rhs;
lhs = y(5);
rhs = y(11)-y(10)-y(6);
residual(2) = lhs - rhs;
lhs = y(10);
rhs = y(11)*(1-params(1));
residual(3) = lhs - rhs;
lhs = y(11);
rhs = T(6)*T(7);
residual(4) = lhs - rhs;
lhs = y(4);
rhs = y(5)+y(10);
residual(5) = lhs - rhs;
lhs = y(13);
rhs = (y(4)-params(2)*y(1)/params(6))^(-params(5))-params(2)*params(11)*(params(6)*y(16)-y(4)*params(2))^(-params(5));
residual(6) = lhs - rhs;
lhs = y(13);
rhs = T(9)*T(11)*T(18);
residual(7) = lhs - rhs;
lhs = log(y(12));
rhs = params(7)*log(y(3))-x(it_, 1);
residual(8) = lhs - rhs;
lhs = y(9);
rhs = 1/y(15);
residual(9) = lhs - rhs;
lhs = y(8);
rhs = T(11)*T(18);
residual(10) = lhs - rhs;
lhs = y(14);
rhs = y(8)-y(9);
residual(11) = lhs - rhs;
lhs = y(15);
rhs = T(9)/y(13);
residual(12) = lhs - rhs;

end

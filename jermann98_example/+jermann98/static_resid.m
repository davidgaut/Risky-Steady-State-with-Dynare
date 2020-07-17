function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = jermann98.static_resid_tt(T, y, x, params);
end
residual = zeros(12, 1);
lhs = params(6)*y(4);
rhs = y(4)*(1-params(4))+y(4)*(T(3)+params(9));
residual(1) = lhs - rhs;
lhs = y(2);
rhs = y(8)-y(7)-y(3);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = y(8)*(1-params(1));
residual(3) = lhs - rhs;
lhs = y(8);
rhs = T(5)*T(6);
residual(4) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(7);
residual(5) = lhs - rhs;
lhs = y(10);
rhs = (y(1)-y(1)*params(2)/params(6))^(-params(5))-params(2)*params(11)*(params(6)*y(1)-y(1)*params(2))^(-params(5));
residual(6) = lhs - rhs;
lhs = y(10);
rhs = T(9)*T(13);
residual(7) = lhs - rhs;
lhs = log(y(9));
rhs = log(y(9))*params(7)-x(1);
residual(8) = lhs - rhs;
lhs = y(6);
rhs = 1/T(7);
residual(9) = lhs - rhs;
lhs = y(5);
rhs = T(8)*T(13);
residual(10) = lhs - rhs;
lhs = y(11);
rhs = y(5)-y(6);
residual(11) = lhs - rhs;
lhs = y(12);
rhs = T(7);
residual(12) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end

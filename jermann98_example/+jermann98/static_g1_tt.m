function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 19);

T = jermann98.static_resid_tt(T, y, x, params);

T(14) = getPowerDeriv(T(2),1-1/params(3),1);
T(15) = getPowerDeriv(T(2),(-1)/params(3),1);
T(16) = params(8)*params(6)/y(4)*T(15);
T(17) = (T(8)*T(1)*params(6)/y(4)*T(14)-(params(9)+1-params(4)+T(3))*T(16))/(T(8)*T(8))-params(6)/y(4);
T(18) = (-(params(6)*y(3)))/(y(4)*y(4));
T(19) = T(11)*getPowerDeriv(y(4),params(1)-1,1)+(T(8)*T(1)*T(14)*T(18)-(params(9)+1-params(4)+T(3))*params(8)*T(15)*T(18))/(T(8)*T(8))-T(18);

end

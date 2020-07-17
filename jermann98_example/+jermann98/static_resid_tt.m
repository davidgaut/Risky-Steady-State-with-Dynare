function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
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

assert(length(T) >= 13);

T(1) = params(8)/(1-1/params(3));
T(2) = params(6)*y(3)/y(4);
T(3) = T(1)*T(2)^(1-1/params(3));
T(4) = params(6)^(-params(1));
T(5) = y(9)*T(4);
T(6) = y(4)^params(1);
T(7) = params(10)/params(6);
T(8) = params(8)*T(2)^((-1)/params(3));
T(9) = y(10)*T(7)*T(8);
T(10) = params(6)^(1-params(1));
T(11) = params(1)*y(9)*T(10);
T(12) = y(4)^(params(1)-1);
T(13) = T(11)*T(12)+(params(9)+1-params(4)+T(3))/T(8)-T(2);

end

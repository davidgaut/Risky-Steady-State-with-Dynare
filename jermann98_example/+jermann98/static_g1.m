function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = jermann98.static_g1_tt(T, y, x, params);
end
g1 = zeros(12, 12);
g1(1,3)=(-(y(4)*T(1)*params(6)/y(4)*T(14)));
g1(1,4)=params(6)-(1-params(4)+T(3)+params(9)+y(4)*T(1)*T(14)*T(18));
g1(2,2)=1;
g1(2,3)=1;
g1(2,7)=1;
g1(2,8)=(-1);
g1(3,7)=1;
g1(3,8)=(-(1-params(1)));
g1(4,4)=(-(T(5)*getPowerDeriv(y(4),params(1),1)));
g1(4,8)=1;
g1(4,9)=(-(T(4)*T(6)));
g1(5,1)=1;
g1(5,2)=(-1);
g1(5,7)=(-1);
g1(6,1)=(-((1-params(2)/params(6))*getPowerDeriv(y(1)-y(1)*params(2)/params(6),(-params(5)),1)-params(2)*params(11)*(params(6)-params(2))*getPowerDeriv(params(6)*y(1)-y(1)*params(2),(-params(5)),1)));
g1(6,10)=1;
g1(7,3)=(-(T(13)*y(10)*T(7)*T(16)+T(9)*T(17)));
g1(7,4)=(-(T(13)*y(10)*T(7)*params(8)*T(15)*T(18)+T(9)*T(19)));
g1(7,9)=(-(T(9)*T(12)*params(1)*T(10)));
g1(7,10)=1-T(13)*T(7)*T(8);
g1(8,9)=1/y(9)-params(7)*1/y(9);
g1(9,6)=1;
g1(10,3)=(-(T(13)*T(16)+T(8)*T(17)));
g1(10,4)=(-(T(13)*params(8)*T(15)*T(18)+T(8)*T(19)));
g1(10,5)=1;
g1(10,9)=(-(T(8)*T(12)*params(1)*T(10)));
g1(11,5)=(-1);
g1(11,6)=1;
g1(11,11)=1;
g1(12,12)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end

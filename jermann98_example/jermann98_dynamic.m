function [residual, g1, g2, g3] = jermann98_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(12, 1);
T18 = 1-1/params(3);
T19 = params(8)/T18;
T22 = params(6)*y(6)/y(2);
T26 = T19*T22^T18+params(9);
T42 = params(6)^(-params(1));
T43 = y(12)*T42;
T44 = y(2)^params(1);
T70 = params(10)/params(6);
T72 = T70*y(19);
T73 = (-1)/params(3);
T75 = params(8)*T22^T73;
T79 = params(6)^(1-params(1));
T80 = params(1)*y(18)*T79;
T82 = y(7)^(params(1)-1);
T86 = params(6)*y(17)/y(7);
T90 = params(9)+1-params(4)+T19*T86^T18;
T92 = params(8)*T86^T73;
T95 = T80*T82+T90/T92-T86;
lhs =params(6)*y(7);
rhs =(1-params(4))*y(2)+y(2)*T26;
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(11)-y(10)-y(6);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(11)*(1-params(1));
residual(3)= lhs-rhs;
lhs =y(11);
rhs =T43*T44;
residual(4)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(10);
residual(5)= lhs-rhs;
lhs =y(13);
rhs =(y(4)-params(2)*y(1)/params(6))^(-params(5))-params(2)*params(11)*(params(6)*y(16)-y(4)*params(2))^(-params(5));
residual(6)= lhs-rhs;
lhs =y(13);
rhs =T72*T75*T95;
residual(7)= lhs-rhs;
lhs =log(y(12));
rhs =params(7)*log(y(3))-x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =1/y(15);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =T75*T95;
residual(10)= lhs-rhs;
lhs =y(14);
rhs =y(8)-y(9);
residual(11)= lhs-rhs;
lhs =y(15);
rhs =T72/y(13);
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 20);

  %
  % Jacobian matrix
  %

T123 = getPowerDeriv(y(4)-params(2)*y(1)/params(6),(-params(5)),1);
T127 = getPowerDeriv(params(6)*y(16)-y(4)*params(2),(-params(5)),1);
T135 = params(6)/y(2);
T136 = getPowerDeriv(T22,T18,1);
T141 = getPowerDeriv(T22,T73,1);
T149 = params(6)/y(7);
T150 = getPowerDeriv(T86,T18,1);
T153 = getPowerDeriv(T86,T73,1);
T161 = (T92*T19*T149*T150-T90*params(8)*T149*T153)/(T92*T92)-T149;
T168 = (-(params(6)*y(6)))/(y(2)*y(2));
T175 = getPowerDeriv(y(2),params(1),1);
T185 = getPowerDeriv(y(7),params(1)-1,1);
T189 = (-(params(6)*y(17)))/(y(7)*y(7));
T199 = T80*T185+(T92*T19*T150*T189-T90*params(8)*T153*T189)/(T92*T92)-T189;
  g1(1,6)=(-(y(2)*T19*T135*T136));
  g1(1,2)=(-(1-params(4)+T26+y(2)*T19*T136*T168));
  g1(1,7)=params(6);
  g1(2,5)=1;
  g1(2,6)=1;
  g1(2,10)=1;
  g1(2,11)=(-1);
  g1(3,10)=1;
  g1(3,11)=(-(1-params(1)));
  g1(4,2)=(-(T43*T175));
  g1(4,11)=1;
  g1(4,12)=(-(T42*T44));
  g1(5,4)=1;
  g1(5,5)=(-1);
  g1(5,10)=(-1);
  g1(6,1)=(-((-(params(2)/params(6)))*T123));
  g1(6,4)=(-(T123-params(2)*params(11)*(-params(2))*T127));
  g1(6,16)=params(2)*params(11)*params(6)*T127;
  g1(6,13)=1;
  g1(7,6)=(-(T95*T72*params(8)*T135*T141));
  g1(7,17)=(-(T72*T75*T161));
  g1(7,2)=(-(T95*T72*params(8)*T141*T168));
  g1(7,7)=(-(T72*T75*T199));
  g1(7,18)=(-(T72*T75*T82*params(1)*T79));
  g1(7,13)=1;
  g1(7,19)=(-(T95*T70*T75));
  g1(8,3)=(-(params(7)*1/y(3)));
  g1(8,12)=1/y(12);
  g1(8,20)=1;
  g1(9,9)=1;
  g1(9,15)=(-((-1)/(y(15)*y(15))));
  g1(10,6)=(-(T95*params(8)*T135*T141));
  g1(10,17)=(-(T75*T161));
  g1(10,2)=(-(T95*params(8)*T141*T168));
  g1(10,7)=(-(T75*T199));
  g1(10,8)=1;
  g1(10,18)=(-(T75*T82*params(1)*T79));
  g1(11,8)=(-1);
  g1(11,9)=1;
  g1(11,14)=1;
  g1(12,13)=(-((-T72)/(y(13)*y(13))));
  g1(12,19)=(-(T70/y(13)));
  g1(12,15)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(74,3);
T229 = getPowerDeriv(T22,T18,2);
T230 = T135*T229;
T263 = getPowerDeriv(y(4)-params(2)*y(1)/params(6),(-params(5)),2);
T264 = (-(params(2)/params(6)))*T263;
T268 = getPowerDeriv(params(6)*y(16)-y(4)*params(2),(-params(5)),2);
T269 = (-params(2))*T268;
T279 = getPowerDeriv(T22,T73,2);
T280 = T135*T279;
T288 = getPowerDeriv(T86,T18,2);
T289 = T149*T288;
T295 = getPowerDeriv(T86,T73,2);
T296 = T149*T295;
T308 = (T92*T92*(T19*T149*T150*params(8)*T149*T153+T92*T19*T149*T289-(T19*T149*T150*params(8)*T149*T153+T90*params(8)*T149*T296))-(T92*T19*T149*T150-T90*params(8)*T149*T153)*(T92*params(8)*T149*T153+T92*params(8)*T149*T153))/(T92*T92*T92*T92);
T324 = params(8)*(T168*T168*T279+T141*(-((-(params(6)*y(6)))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2)));
T350 = (T92*T92*(params(8)*T149*T153*T19*T150*T189+T92*T19*(T189*T289+T150*(-params(6))/(y(7)*y(7)))-(T19*T149*T150*params(8)*T153*T189+T90*params(8)*(T189*T296+T153*(-params(6))/(y(7)*y(7)))))-(T92*T19*T150*T189-T90*params(8)*T153*T189)*(T92*params(8)*T149*T153+T92*params(8)*T149*T153))/(T92*T92*T92*T92)-(-params(6))/(y(7)*y(7));
T362 = (-((-(params(6)*y(17)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7));
T385 = T80*getPowerDeriv(y(7),params(1)-1,2)+(T92*T92*(T19*T150*T189*params(8)*T153*T189+T92*T19*(T189*T189*T288+T150*T362)-(T19*T150*T189*params(8)*T153*T189+T90*params(8)*(T189*T189*T295+T153*T362)))-(T92*T19*T150*T189-T90*params(8)*T153*T189)*(T92*params(8)*T153*T189+T92*params(8)*T153*T189))/(T92*T92*T92*T92)-T362;
  v2(1,1)=1;
  v2(1,2)=106;
  v2(1,3)=(-(y(2)*T19*T135*T230));
  v2(2,1)=1;
  v2(2,2)=26;
  v2(2,3)=(-(T19*T135*T136+y(2)*T19*(T168*T230+T136*(-params(6))/(y(2)*y(2)))));
  v2(3,1)=1;
  v2(3,2)=102;
  v2(3,3)=  v2(2,3);
  v2(4,1)=1;
  v2(4,2)=22;
  v2(4,3)=(-(T19*T136*T168+T19*T136*T168+y(2)*T19*(T168*T168*T229+T136*(-((-(params(6)*y(6)))*(y(2)+y(2))))/(y(2)*y(2)*y(2)*y(2)))));
  v2(5,1)=4;
  v2(5,2)=22;
  v2(5,3)=(-(T43*getPowerDeriv(y(2),params(1),2)));
  v2(6,1)=4;
  v2(6,2)=222;
  v2(6,3)=(-(T42*T175));
  v2(7,1)=4;
  v2(7,2)=32;
  v2(7,3)=  v2(6,3);
  v2(8,1)=6;
  v2(8,2)=1;
  v2(8,3)=(-((-(params(2)/params(6)))*T264));
  v2(9,1)=6;
  v2(9,2)=61;
  v2(9,3)=(-T264);
  v2(10,1)=6;
  v2(10,2)=4;
  v2(10,3)=  v2(9,3);
  v2(11,1)=6;
  v2(11,2)=64;
  v2(11,3)=(-(T263-params(2)*params(11)*(-params(2))*T269));
  v2(12,1)=6;
  v2(12,2)=304;
  v2(12,3)=params(2)*params(11)*params(6)*T269;
  v2(13,1)=6;
  v2(13,2)=76;
  v2(13,3)=  v2(12,3);
  v2(14,1)=6;
  v2(14,2)=316;
  v2(14,3)=params(2)*params(11)*params(6)*params(6)*T268;
  v2(15,1)=7;
  v2(15,2)=106;
  v2(15,3)=(-(T95*T72*params(8)*T135*T280));
  v2(16,1)=7;
  v2(16,2)=326;
  v2(16,3)=(-(T72*params(8)*T135*T141*T161));
  v2(17,1)=7;
  v2(17,2)=117;
  v2(17,3)=  v2(16,3);
  v2(18,1)=7;
  v2(18,2)=337;
  v2(18,3)=(-(T72*T75*T308));
  v2(19,1)=7;
  v2(19,2)=26;
  v2(19,3)=(-(T95*T72*params(8)*(T168*T280+T141*(-params(6))/(y(2)*y(2)))));
  v2(20,1)=7;
  v2(20,2)=102;
  v2(20,3)=  v2(19,3);
  v2(21,1)=7;
  v2(21,2)=37;
  v2(21,3)=(-(T161*T72*params(8)*T141*T168));
  v2(22,1)=7;
  v2(22,2)=322;
  v2(22,3)=  v2(21,3);
  v2(23,1)=7;
  v2(23,2)=22;
  v2(23,3)=(-(T95*T72*T324));
  v2(24,1)=7;
  v2(24,2)=126;
  v2(24,3)=(-(T72*params(8)*T135*T141*T199));
  v2(25,1)=7;
  v2(25,2)=107;
  v2(25,3)=  v2(24,3);
  v2(26,1)=7;
  v2(26,2)=137;
  v2(26,3)=(-(T72*T75*T350));
  v2(27,1)=7;
  v2(27,2)=327;
  v2(27,3)=  v2(26,3);
  v2(28,1)=7;
  v2(28,2)=122;
  v2(28,3)=(-(T72*params(8)*T141*T168*T199));
  v2(29,1)=7;
  v2(29,2)=27;
  v2(29,3)=  v2(28,3);
  v2(30,1)=7;
  v2(30,2)=127;
  v2(30,3)=(-(T72*T75*T385));
  v2(31,1)=7;
  v2(31,2)=346;
  v2(31,3)=(-(T72*params(8)*T135*T141*T82*params(1)*T79));
  v2(32,1)=7;
  v2(32,2)=118;
  v2(32,3)=  v2(31,3);
  v2(33,1)=7;
  v2(33,2)=342;
  v2(33,3)=(-(T72*params(8)*T141*T168*T82*params(1)*T79));
  v2(34,1)=7;
  v2(34,2)=38;
  v2(34,3)=  v2(33,3);
  v2(35,1)=7;
  v2(35,2)=347;
  v2(35,3)=(-(T72*T75*T185*params(1)*T79));
  v2(36,1)=7;
  v2(36,2)=138;
  v2(36,3)=  v2(35,3);
  v2(37,1)=7;
  v2(37,2)=366;
  v2(37,3)=(-(T95*T70*params(8)*T135*T141));
  v2(38,1)=7;
  v2(38,2)=119;
  v2(38,3)=  v2(37,3);
  v2(39,1)=7;
  v2(39,2)=377;
  v2(39,3)=(-(T161*T70*T75));
  v2(40,1)=7;
  v2(40,2)=339;
  v2(40,3)=  v2(39,3);
  v2(41,1)=7;
  v2(41,2)=362;
  v2(41,3)=(-(T95*T70*params(8)*T141*T168));
  v2(42,1)=7;
  v2(42,2)=39;
  v2(42,3)=  v2(41,3);
  v2(43,1)=7;
  v2(43,2)=367;
  v2(43,3)=(-(T199*T70*T75));
  v2(44,1)=7;
  v2(44,2)=139;
  v2(44,3)=  v2(43,3);
  v2(45,1)=7;
  v2(45,2)=378;
  v2(45,3)=(-(T82*params(1)*T79*T70*T75));
  v2(46,1)=7;
  v2(46,2)=359;
  v2(46,3)=  v2(45,3);
  v2(47,1)=8;
  v2(47,2)=43;
  v2(47,3)=(-(params(7)*(-1)/(y(3)*y(3))));
  v2(48,1)=8;
  v2(48,2)=232;
  v2(48,3)=(-1)/(y(12)*y(12));
  v2(49,1)=9;
  v2(49,2)=295;
  v2(49,3)=(-((y(15)+y(15))/(y(15)*y(15)*y(15)*y(15))));
  v2(50,1)=10;
  v2(50,2)=106;
  v2(50,3)=(-(T95*params(8)*T135*T280));
  v2(51,1)=10;
  v2(51,2)=326;
  v2(51,3)=(-(params(8)*T135*T141*T161));
  v2(52,1)=10;
  v2(52,2)=117;
  v2(52,3)=  v2(51,3);
  v2(53,1)=10;
  v2(53,2)=337;
  v2(53,3)=(-(T75*T308));
  v2(54,1)=10;
  v2(54,2)=26;
  v2(54,3)=(-(T95*params(8)*(T168*T280+T141*(-params(6))/(y(2)*y(2)))));
  v2(55,1)=10;
  v2(55,2)=102;
  v2(55,3)=  v2(54,3);
  v2(56,1)=10;
  v2(56,2)=37;
  v2(56,3)=(-(T161*params(8)*T141*T168));
  v2(57,1)=10;
  v2(57,2)=322;
  v2(57,3)=  v2(56,3);
  v2(58,1)=10;
  v2(58,2)=22;
  v2(58,3)=(-(T95*T324));
  v2(59,1)=10;
  v2(59,2)=126;
  v2(59,3)=(-(params(8)*T135*T141*T199));
  v2(60,1)=10;
  v2(60,2)=107;
  v2(60,3)=  v2(59,3);
  v2(61,1)=10;
  v2(61,2)=137;
  v2(61,3)=(-(T75*T350));
  v2(62,1)=10;
  v2(62,2)=327;
  v2(62,3)=  v2(61,3);
  v2(63,1)=10;
  v2(63,2)=122;
  v2(63,3)=(-(params(8)*T141*T168*T199));
  v2(64,1)=10;
  v2(64,2)=27;
  v2(64,3)=  v2(63,3);
  v2(65,1)=10;
  v2(65,2)=127;
  v2(65,3)=(-(T75*T385));
  v2(66,1)=10;
  v2(66,2)=346;
  v2(66,3)=(-(params(8)*T135*T141*T82*params(1)*T79));
  v2(67,1)=10;
  v2(67,2)=118;
  v2(67,3)=  v2(66,3);
  v2(68,1)=10;
  v2(68,2)=342;
  v2(68,3)=(-(params(8)*T141*T168*T82*params(1)*T79));
  v2(69,1)=10;
  v2(69,2)=38;
  v2(69,3)=  v2(68,3);
  v2(70,1)=10;
  v2(70,2)=347;
  v2(70,3)=(-(T75*T185*params(1)*T79));
  v2(71,1)=10;
  v2(71,2)=138;
  v2(71,3)=  v2(70,3);
  v2(72,1)=12;
  v2(72,2)=253;
  v2(72,3)=(-((-((-T72)*(y(13)+y(13))))/(y(13)*y(13)*y(13)*y(13))));
  v2(73,1)=12;
  v2(73,2)=373;
  v2(73,3)=(-((-T70)/(y(13)*y(13))));
  v2(74,1)=12;
  v2(74,2)=259;
  v2(74,3)=  v2(73,3);
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,400);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,8000);
end
end
end
end

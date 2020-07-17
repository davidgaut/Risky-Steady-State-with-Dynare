
function [ys,params,check] = jermann98_steadystate(~,~,M_,options_)

global oo_  

% deterministic steady state
ysdd = jermann98_det_steady(M_);
 
if M_.risky_steadystate
    options_.rss_id = [find(moment_compute(ysdd,M_,oo_,options_))];
%     options_.rss_id = [1:10];
[ys,~] = risky_steadystate(ysdd,M_,oo_,options_,'jermann98_risky_steady');
else
ys = ysdd;
end

params = M_.params;

[char(M_.endo_names) num2str(ysdd) num2str(ys)]
check = 0;

end

function ys = jermann98_det_steady(M_)
% Compute deterministic steady state

eval(['[' (strjoin(M_.param_names,' ')) '] = deal(' strjoin(cellstr(num2str(M_.params,30)),' , ') ');']);
rf1    = g/betstar;
r1     = g/betstar;
erp1   = r1-rf1;

z      = 1;
k      = (((g/betstar)-(1-delt))/(alf*g^(1-alf)))^(1/(alf-1));
y      = (g^(-alf))*k^alf;
w      = (1-alf)*y;
i      = (1-(1/g)*(1-delt))*k;
d      = y - w - i;
c      = w + d;

mu     = ((c-(chihab*c/g))^(-tau))-chihab*bet*((c*g-chihab*c)^(-tau));

eval([M_.endo_names{end} ,' = 1;'])

z      = 1;
ys     = (cellfun(@eval,M_.endo_names));
end

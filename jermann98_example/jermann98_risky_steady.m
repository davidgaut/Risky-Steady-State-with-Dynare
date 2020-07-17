
% Risky Steady state for a set of moment MS
function ys = jermann98_risky_steady(MS,~,M_,~)

eval(['[' (strjoin(M_.param_names,' ')) '] = deal(' strjoin(cellstr(num2str(M_.params,30)),' , ') ');']);

rf1    = g/betstar - MS(9);
r1     = g/betstar - MS(10);
erp1   = r1-rf1;
z      = 1;

c_handle   = @(k) (g^(-alf))*k^alf - (1-(1/g)*(1-delt))*k;
mu_handle  = @(k) ((c_handle(k)-(chihab*c_handle(k)/g))^(-tau))-chihab*bet*((c_handle(k)*g-chihab*c_handle(k))^(-tau)) - MS(6);

inv_k = (((g - (1-delt)) - a2) / (a1/(1-1/xi)))^(1/(1-1/xi)) / g;

cc1 = (betstar/g)*(a1*(g*inv_k)^(-1/xi));
cc2 = ((1-delt+(a1/(1-1/xi))*(g*inv_k)^(1-1/xi)+a2))/...
       (a1*(g*inv_k)^(-1/xi)) -g*inv_k;

tbn = @(k) k - ((((mu_handle(k) + MS(7)) / mu_handle(k)) / cc1 - cc2) / (alf*z*g^(1-alf)))^(1 / (alf-1));

k      = fzero(tbn,[1 100]);

y      = (g^(-alf))*k^alf;
w      = (1-alf)*y;
i      = (1-(1/g)*(1-delt))*k;
d      = y - w - i;
mu     = mu_handle(k);
c      = w + d;

eval([M_.endo_names{end} ,' = 1;'])
ys = (cellfun(@eval,M_.endo_names));
end
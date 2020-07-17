function MsD = moment_compute(steady_,M_,oo_,options_)

% Compute second order impact of exo variables for forwards

lead_lag_incidence = M_.lead_lag_incidence;
iyv  = lead_lag_incidence';
iyv  = iyv(:);
iyr0 = find(iyv) ;

zz = repmat(steady_,1,3);
zz = zz(iyr0) ;

[~,d1,d2] = feval([M_.fname '_dynamic'],zz,...
                       [oo_.exo_simul ...
                        oo_.exo_det_simul], M_.params, steady_, 2);
                    
lead_index = M_.maximum_endo_lag+2;
lead_lag_incidence = M_.lead_lag_incidence;
dr = struct();
dr = set_state_space(dr,M_,options_);
i_fwrd_g = find(lead_lag_incidence(lead_index,dr.order_var)');

idx_frd_f1 = nonzeros(lead_lag_incidence(lead_index,dr.order_var));
n          = nnz(lead_lag_incidence)+M_.exo_nbr;
ih         = reshape(1:n*n,n,n);
idx_frd_f2 = ih(idx_frd_f1,idx_frd_f1);


[dr,info] = dyn_first_order_solver(d1,M_,oo_.dr,options_,0);

if info; warning('Error with first order solver'); end

gu1 = dr.ghu(i_fwrd_g,:);

MsD = 0.5*(d2(:,idx_frd_f2)*kron(gu1,gu1))*vec(M_.Sigma_e);


function [ss_results,sd_results] = stoch_steady_compute

global oo_ options_ M_

if options_.order < 2; error('Compute second order approximation to compute stochastic steady-state.'); end

    ezero = zeros(30000,M_.exo_nbr);
%     ezero = M_.Sigma_e * randn(30000,M_.exo_nbr);

	% Deterministic Steady-State
    [oo_.dr.ys,~,info1] = evaluate_steady_state(oo_.steady_state,M_,options_,oo_,~options_.steadystate.nocheck);

    sd_results = oo_.dr.ys;
    
%     options_.k_order_solver = 0;
    
    % Compute Transition and Policy functions
    [oo_.dr,info2] = stochastic_solvers(oo_.dr,0,M_,options_,oo_); 
%     info2 = 0;
    if (info1(1) ~= 0) 
        ss_results   = NaN(M_.endo_nbr,1);
        print_info(info1, 0, options_)        
    elseif (info2(1) ~= 0); 
        ss_results   = NaN(M_.endo_nbr,1);
        print_info(info2, 0, options_)
    else
        y            = simult_(oo_.dr.ys,oo_.dr,ezero,options_.order);
        ss_results   = y(:,end);
    end
    y_eps = abs((y(:,end) - y(:,end-1)) ./ (1 + oo_.dr.ys));

%     .5*oo_.dr.ghs2
%     ss_results = mean(y(:,end-1000:end),2);
    
if  any(y_eps > 1e-15)
    warning(['No convergence. Err = ' num2str(max(y_eps))])
end
% Directional Crossover (DX) for real parameter optimization
% Cite as: Das, A.K., Pratihar, D.K.: A directional crossover (DX) operator for real parameter
% optimization using genetic algorithm. Applied Intelligence (2018). doi:10.1007/s10489-018-1364-2
%% Inputs: 
%         pop_selection - Population after applying selection operator
%         Var_min - Lower bound of variables
%         Var_max - Upper bound of variables
%         p_best - current best solution of the population
%         pc - crossover probability (theoretical range:0 to 1, generally set at higher value like in the range  0.7 to 1)
%         pcv - variable-wise crossover probability (theoretical range:0 to 1, generally set at higher value like in the range 0.7 to 1)
%         pd - directional probability ( generally set in the range 0.5 to 1)
%         alpha - multiplying factor (generally set in the range 0.5 to 2.5)
%% Output : 
%         pop_crossover - Population after applying crossover operator
%%
function pop_crossover = dx( pop_selection,Var_min, Var_max,p_best,pc,pcv,pd,alpha)
[N, n_var] = size(pop_selection); % Population size & Number of variables
pop_crossover = zeros( size(pop_selection) );
% N should be even to compare pairs
if mod(N,2) ~= 0
    N = N - 1;
end
p = randperm(N);
for id=1:2:N
    p1 = p(id);
    p2 = p(id+1);
    parent1 = pop_selection(p1,:);
    parent2 = pop_selection(p2,:);
    child1 = zeros(1, n_var);
    child2 = zeros(1, n_var);
    if rand <= pc % a mating pair is made crossover with probability pc
        for i=1:n_var
            if rand<=pcv
                y3=p_best(i);
                if (isequal( parent1(i),parent2(i) )==0)
                    y1 = parent1(i);
                    y2 = parent2(i);
                    yl = Var_min(i);
                    yu = Var_max(i);
                    rand_var = (rand);
                    val=1-((0.5)^((exp(abs(y2-y1)/(yu-yl)))));
                    pmean=0.5*(y1+y2);
                    beta=rand_var/(alpha^2);
                    if(y3>=pmean)
                        if(rand<=pd)
                            c1=val*(y1+y2)+((alpha^(rand_var))*(exp(1-beta)))*(1-val)*abs(y2-y1);
                            c2=(1-val)*(y1+y2)-((alpha^(1-rand_var))*exp(-beta))*val*abs(y2-y1);
                        else
                            c1=val*(y1+y2)-((alpha^(rand_var))*(exp(1-beta)))*(1-val)*abs(y2-y1);
                            c2=(1-val)*(y1+y2)+((alpha^(1-rand_var))*exp(-beta))*val*abs(y2-y1);
                        end
                    else
                        if(rand<=pd)
                            c1=val*(y1+y2)-((alpha^(rand_var))*(exp(1-beta)))*(1-val)*abs(y2-y1);
                            c2=(1-val)*(y1+y2)+((alpha^(1-rand_var))*exp(-beta))*val*abs(y2-y1);
                        else
                            c1=val*(y1+y2)+((alpha^(rand_var))*(exp(1-beta)))*(1-val)*abs(y2-y1);
                            c2=(1-val)*(y1+y2)-((alpha^(1-rand_var))*exp(-beta))*val*abs(y2-y1);
                        end
                    end
                    if (c1 < yl), c1 = yl; end
                    if (c2 < yl), c2 = yl; end
                    if (c1 > yu), c1 = yu; end
                    if (c2 > yu), c2 = yu; end
                    if rand <= 0.5
                        child1(i) = c2;
                        child2(i) = c1;
                    else
                        child1(i) = c1;
                        child2(i) = c2;
                    end
                else
                    pmean=parent1(i);
                    if(y3~=pmean)
                        yl = Var_min(i);
                        yu = Var_max(i);
                        rand_var=rand;
                        beta=rand_var/(alpha^2);
                        val=1-((0.5)^((exp(abs(pmean-y3)/(yu-yl)))));
                        if(rand<=pd)
                            c1=val*(y3+pmean)+((alpha^(rand_var))*(exp(1-beta)))*(1-val)*(y3-pmean);
                            c2=(1-val)*(y3+pmean)-((alpha^(1-rand_var))*exp(-beta))*val*(y3-pmean);
                        else
                            c1=val*(y3+pmean)-((alpha^(rand_var))*(exp(1-beta)))*(1-val)*(y3-pmean);
                            c2=(1-val)*(y3+pmean)+((alpha^(1-rand_var))*exp(-beta))*val*(y3-pmean);
                        end
                        if (c1 < yl), c1 = yl; end
                        if (c2 < yl), c2 = yl; end
                        if (c1 > yu), c1 = yu; end
                        if (c2 > yu), c2 = yu; end
                        if rand <= 0.5
                            child1(i) = c2;
                            child2(i) = c1;
                        else
                            child1(i) = c1;
                            child2(i) = c2;
                        end
                    else
                        child1(i) = parent1(i);
                        child2(i) = parent2(i);
                    end
                end
            else
                child1(i) = parent1(i);
                child2(i) = parent2(i);
            end
        end
    else
        child1 = parent1;
        child2 = parent2;
    end
    pop_crossover(id,:) = child1;
    pop_crossover(id+1,:) = child2;
end



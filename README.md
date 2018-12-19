# Directional-Crossover-DX-for-Genetic-algorithm
A directional crossover (DX) operator for real parameter optimization using genetic algorithm
This is the matlab code for the Directional crossover (DX) for real parameter optimization.
This can be used for real-coded GA and other suitable evolutionary optimization algorithms.
Please cite as: Das, A.K., Pratihar, D.K.: A directional crossover (DX) operator for real parameter
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
For more details : please go through the original paper published in Applied Intelligence (2018), entitled as " A directional crossover (DX) operator for real parameter optimization using genetic algorithm".

For any queries: please mail to: amit.besus@gmail.com

reset;

model;

set YEARS;
set ASSETS;

param historic_data {YEARS,ASSETS};
param return;

param average_return {i in ASSETS} = sum {y in YEARS} ( historic_data[y,i] ) / card( YEARS );

# calculate sample covariance
param covariance {j in ASSETS, k in ASSETS} = sum {y in YEARS} ( ( historic_data[y,j] - average_return[j] ) * ( historic_data[y,k] - average_return[k] ) ) / ( card( YEARS ) - 1 );

var portfolio {ASSETS} >= 0;

minimize risk: sum {i in ASSETS} ( sum {j in ASSETS} ( portfolio[i] * covariance[i,j] * portfolio[j] ) ) ;

s.t. desired_return : sum { i in ASSETS } ( average_return[i] * portfolio[i] ) = return;

s.t. total_assets : sum { i in ASSETS } ( portfolio[i] ) <= 1;

data;


set YEARS := 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994;
set ASSETS := US_3-MONTH_T-BILLS US_GOVN_LONG_BONDS SP_500 WILSHIRE_5000 NASDAQ_COMPOSITE LEHMAN_BROTHERS_CORPORATE_BONDS_INDEX EAFE GOLD; 

param historic_data:
US_3-MONTH_T-BILLS US_GOVN_LONG_BONDS SP_500 WILSHIRE_5000 NASDAQ_COMPOSITE LEHMAN_BROTHERS_CORPORATE_BONDS_INDEX EAFE GOLD :=
1973  1.075  0.942  0.852  0.815  0.698  1.023  0.851  1.677 
1974  1.084  1.020  0.735  0.716  0.662  1.002  0.768  1.722 
1975  1.061  1.056  1.371  1.385  1.318  1.123  1.354  0.760 
1976  1.052  1.175  1.236  1.266  1.280  1.156  1.025  0.960 
1977  1.055  1.002  0.926  0.974  1.093  1.030  1.181  1.200 
1978  1.077  0.982  1.064  1.093  1.146  1.012  1.326  1.295 
1979  1.109  0.978  1.184  1.256  1.307  1.023  1.048  2.212 
1980  1.127  0.947  1.323  1.337  1.367  1.031  1.226  1.296 
1981  1.156  1.003  0.949  0.963  0.990  1.073  0.977  0.688 
1982  1.117  1.465  1.215  1.187  1.213  1.311  0.981  1.084 
1983  1.092  0.985  1.224  1.235  1.217  1.080  1.237  0.872 
1984  1.103  1.159  1.061  1.030  0.903  1.150  1.074  0.825 
1985  1.080  1.366  1.316  1.326  1.333  1.213  1.562  1.006 
1986  1.063  1.309  1.186  1.161  1.086  1.156  1.694  1.216 
1987  1.061  0.925  1.052  1.023  0.959  1.023  1.246  1.244 
1988  1.071  1.086  1.165  1.179  1.165  1.076  1.283  0.861 
1989  1.087  1.212  1.316  1.292  1.204  1.142  1.105  0.977 
1990  1.080  1.054  0.968  0.938  0.830  1.083  0.766  0.922 
1991  1.057  1.193  1.304  1.342  1.594  1.161  1.121  0.958 
1992  1.036  1.079  1.076  1.090  1.174  1.076  0.878  0.926 
1993  1.031  1.217  1.100  1.113  1.162  1.110  1.326  1.146 
1994  1.045  0.889  1.012  0.999  0.968  0.965  1.078  0.990 
;

param return := 1.05;

option solver minos;

solve;

display average_return;
display covariance;

display desired_return.lb, desired_return.body, desired_return.ub;
display total_assets.lb, total_assets.body, total_assets.ub;

display risk;
display portfolio;
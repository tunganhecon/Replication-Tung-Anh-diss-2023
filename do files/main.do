*Credits: the job transitions are computed based on the replication package for Measuring Employer-to-Employer Reallocation by Fujita, Moscarini, and Postel-Vinay (Forthcoming)

*Run this .do file to generate the data necessary for the MATLAB model, please note running the files for computing the job transitions takes several hours 

clear

*specify the folder paths 
*specify the replication folder, please change

global dirpath "C:\Users\Windows\Dropbox\Tung Anh 2023 dissertation"

*derived paths, please don't change

global cps_folder "${dirpath}\data\raw\all_data"
global raw_folder "${dirpath}\data\raw"
global dta_folder "${dirpath}\data\dta"
global do_folder "${dirpath}\do files"
global EEdo_folder "${do_folder}\FMPV_EEcode"

*run this file to rename the CPS data files if obtained directly from the Census website
cd "${do_folder}"
do renameCPS

*computing required transitions 

cd "${EEdo_folder}"
do 1_extract
do 2_1_adjust_ind
do 2_2_adjust_occ
do 3_match
do 4_genvars_Probit
do 5_append_matched
do 6_genvars_matched
do 7_UEr_JJrSS_append
do 8_Imputation_base

*obtain datasets for drawing Figure 2, the EE transitions of low-wage workers and high-wage workers
do 3.5_medianearn_count 
*what this file does is it drops participants not reporting wage and marks l50 = 1 for those with an earning less than the median earning of that year
do 4_genvars_Probit
do 5_append_matched
do 6_genvars_matched
do 7_UEr_JJrSS_append
do 8.5_Median_Imputation_base

*calibration for the Beveridge curve coefficients, use the values obtained to plug into the model and dissertation
cd "${do_folder}"
do jfrcleaning

*calibration for the TFP process in the model, use the coefficient of the regression and its standard error as the quarterly values in the MATLAB model
do tfpempirical



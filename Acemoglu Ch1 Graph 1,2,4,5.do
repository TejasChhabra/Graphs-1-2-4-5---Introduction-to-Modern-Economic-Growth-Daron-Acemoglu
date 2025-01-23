*setting up working directory
cd "C:\Users\vipulsanju\Desktop\Stata Working Directory - SNU\Macroeconomics - II"  

** Graph 1 

** Generating a GDP per capita variable
gen gdp_per_capita = rgdpo/pop

** Compressing the dataset 
preserve
keep if gdp_per_capita <= 50000

* Create kernel density plots for GDP per capita by year
twoway (kdensity gdp_per_capita if year == 1960, lcolor(blue) lwidth(med)) ///
       (kdensity gdp_per_capita if year == 1980, lcolor(red) lwidth(med)) ///
       (kdensity gdp_per_capita if year == 2000, lcolor(green) lwidth(med)) ///
       (kdensity gdp_per_capita if year == 2010, lcolor(orange) lwidth(med)) ///
       (kdensity gdp_per_capita if year == 2019, lcolor(purple) lwidth(med)), ///
       title("Density of GDP per Capita Over Selected Years") ///
       legend(order(1 "1960" 2 "1980" 3 "2000" 4 "2010" 5 "2019")) ///
       xtitle("GDP per capita") ytitle("Density of countries")
restore

** Exporting the file to the working directory
graph export "gdp_per_capita_graph.png", replace

** Graph 2 
** Generating a Log GDP per capita variable 
gen log_gdp_per_capita = log(gdp_per_capita)

** Compressing the dataset 
preserve
keep if log_gdp_per_capita < 11

* Create kernel density plots for Log GDP per capita by year
twoway (kdensity log_gdp_per_capita if year == 1960, lcolor(blue) lwidth(med)) ///
       (kdensity log_gdp_per_capita if year == 1980, lcolor(red) lwidth(med)) ///
       (kdensity log_gdp_per_capita if year == 2000, lcolor(green) lwidth(med)) ///
       (kdensity log_gdp_per_capita if year == 2010, lcolor(orange) lwidth(med)) ///
       (kdensity log_gdp_per_capita if year == 2019, lcolor(purple) lwidth(med)), ///
       title("Density of Log GDP per Capita Over Selected Years") ///
       legend(order(1 "1960" 2 "1980" 3 "2000" 4 "2010" 5 "2019")) ///
       xtitle("Log GDP per capita") ytitle("Density of countries")
restore
** Exporting the file to the working directory
graph export "log_gdp_per_capita_graph.png", replace


** Graph 4
** Generating a Log GDP per worker variable 
gen log_gdp_per_emp = log(rgdpo/emp)

preserve
keep if log_gdp_per_emp < 12

* Create kernel density plots for log GDP per worker by year
twoway (kdensity log_gdp_per_emp if year == 1960, lcolor(blue) lwidth(med)) ///
       (kdensity log_gdp_per_emp if year == 1980, lcolor(red) lwidth(med)) ///
       (kdensity log_gdp_per_emp if year == 2000, lcolor(green) lwidth(med)) ///
       (kdensity log_gdp_per_emp if year == 2010, lcolor(orange) lwidth(med)) ///
       (kdensity log_gdp_per_emp if year == 2019, lcolor(purple) lwidth(med)), ///
       title("Density of Log GDP per Worker Over Selected Years") ///
       legend(order(1 "1960" 2 "1980" 3 "2000" 4 "2010" 5 "2019")) ///
       xtitle("Log GDP per worker") ytitle("Density of countries")
restore

** Exporting the file to the working directory
graph export "Log_gdp_per_worker_graph.png", replace


** Extending Graph 5 to 2000,2010 & 2019
** Generating a Log consumption per capita variable 
gen log_cons_per_capita = log(rconna/pop)

** Trimming the dataset
preserve 
keep if log_gdp_per_capita < 12 
keep if log_cons_per_capita < 12

** Generating a scatter plot of countries with the line of best fit for the year 2000
twoway (scatter log_cons_per_capita log_gdp_per_capita if year == 2000, ///
       mlabel(countrycode) msymbol(none) legend(off)) /// 
       (lfit log_cons_per_capita log_gdp_per_capita if year == 2000, ///
	   lcolor(red)), /// 
		title("Scatter plot of Log consumption and GDP per capita") ///
		xtitle("Log GDP per Capita") ytitle("Log Consumption per Capita") 

** Exporting the file to the working directory
graph export "Log_gdp_per_capita_vs_Log_consumption_per_capita_graph.png", replace

** Generating a scatter plot of countries with the line of best fit for the year 2010
twoway (scatter log_cons_per_capita log_gdp_per_capita if year == 2010, ///
       mlabel(countrycode) msymbol(none) legend(off)) /// 
       (lfit log_cons_per_capita log_gdp_per_capita if year == 2010, ///
	   lcolor(red)), /// 
		title("Scatter plot of Log consumption and GDP per capita") ///
		xtitle("Log GDP per Capita") ytitle("Log Consumption per Capita")

** Exporting the file to the working directory		
graph export "Log_gdp_per_capita_vs_Log_consumption_per_capita_2010_graph.png", replace

** Generating a scatter plot of countries with the line of best fit for the year 2019
twoway (scatter log_cons_per_capita log_gdp_per_capita if year == 2019, ///
       mlabel(countrycode) msymbol(none) legend(off)) /// ** Don't need the mcolor because that is for msymbol and mlabcolor for label
       (lfit log_cons_per_capita log_gdp_per_capita if year == 2019, ///
	   lcolor(red)), /// 
		title("Scatter plot of Log consumption and GDP per capita") ///
		xtitle("Log GDP per Capita") ytitle("Log Consumption per Capita")
restore

** Exporting the file to the working directory
graph export "Log_gdp_per_capita_vs_Log_consumption_per_capita_2019_graph.png", replace




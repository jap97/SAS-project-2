libname mydata "/courses/d1406ae5ba27fe300" access=readonly ;
DATA new ; set mydata.gapminder ;
run ;
proc sort ; by Country ;

/*Data Management*/
;
/*Centering explanatory variable  */
proc means ;
var urbanrate co2emissions alcconsumption ;
data centering ;
set new ;
urbanrate_c = urbanrate - 56.7693596	;
co2emissions_c = co2emissions - 5033261622 ;
alcconsumption_c = alcconsumption - 6.6894118 ;
run ; 

/* Collapsing the response variabe into two category 
	life expectancy > 70 = 1 
	life expectancy < 70 = 0 
									*/
	
	if lifeexpectancy < 70 then clife = 0 ;
	else if lifeexpectancy > 70 then clife = 1 ;


/*Inferential Statistic */
proc contents = new ;
proc corr ; var lifeexpectancy urbanrate
	
	
/*proc print data= urbanmean ;

calculating mean again 
proc means ;
var urbanrate_c;    */

* Linear regression model Test */

 /*proc glm plots(unpack)= all ;
 model lifeexpectancy = urbanrate_c  alcconsumption_c /solution clparm;
 output residual = res student = stdres out = results ;  
 
   proc gplot ;
 label stdres="standardize residual " country = "Country" ;
 plot stdres*country/vref= 0 ;
 run ;*/

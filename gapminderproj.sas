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

	

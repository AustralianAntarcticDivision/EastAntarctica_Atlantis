netcdf ice {
dimensions:
	t = UNLIMITED ; // (1 currently)
	b = 28 ;
variables:
	double Ice_Class1(t, b) ;
		Ice_Class1:_FillValue = 1 ;
	double t(t) ;
		t:units = "seconds since 1970-01-01 00:00:00 +10" ;
		t:dt = 86400. ;
	double total_depth(t, b) ;
		total_depth:_FillValue = 0. ;

// global attributes:
		:title = "trivial" ;
		:geometry = "Antarctica_28.bgm" ;
		:parameters = "" ;
		:history = "??" ;
		:NCO = "4.0.8" ;
data:

 Ice_Class1 =
  _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _;

 t = 86400 ;

 total_depth =
  _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _;
}

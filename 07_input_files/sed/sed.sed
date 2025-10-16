[SedimentFileInformation] 
   FileCreatedBy    = V          
   FileCreationDate = today :D          
   FileVersion      = 02.00                         
[SedimentOverall] 
   Cref             =  1.6000000e+003      [kg/m3]  CSoil Reference density for hindered settling calculations 
   IopSus           = 0                             If Iopsus = 1: susp. sediment size depends on local flow and wave conditions 
[Sediment] 
   Name             = #Sediment1#                   Name of sediment fraction 
   SedTyp           = bedload                       Must be "sand", "mud" or "bedload" 
   RhoSol           =  2.6500000e+003      [kg/m3]  Specific density 
   SedDia           =  4.5000000e-04      [m]      Minimum sediment diameter (D50)  
   CDryB            =  1.5900000e+003      [kg/m3]  Dry bed density 
   IniSedThick      =  1.0000000e+000      [m]      Initial sediment layer thickness at bed (overuled if IniComp is prescribed) 
   FacDSS           =  1.0000000e+000      [-]      FacDss * SedDia = Initial suspended sediment diameter. Range [0.6 - 1.0] 
[Sediment] 
   Name             = #Sediment2#                   Name of sediment fraction 
   SedTyp           = bedload                       Must be "sand", "mud" or "bedload" 
   RhoSol           =  2.6500000e+003      [kg/m3]  Specific density 
   SedDia           =  1.1313708e-02      [m]      Minimum sediment diameter (D50) 
   CDryB            =  1.5900000e+003      [kg/m3]  Dry bed density 
   IniSedThick      =  1.0000000e+000      [m]      Initial sediment layer thickness at bed (overuled if IniComp is prescribed) 
   FacDSS           =  1.0000000e+000      [-]      FacDss * SedDia = Initial suspended sediment diameter. Range [0.6 - 1.0] 
   NodeRelations    = #table_s.nrd#                       [ - ]    File with Overall Node Relations(relative path to sed)
[Sediment]
	Name 			= #SedimentSand3# 	#		Name as specified in NamC in mdf-file
	SedTyp 			= bedload		  #		Must be "sand", "mud" or "bedload"
	SedMinDia = 0.00025     [  m   ] Sand only: Minimum sediment diameter
	SedMaxDia = 0.001      [  m   ] Sand only: Maximum sediment diameter
	RhoSol 			= 2.65e+003       # [kg/m3] 	Specific density
	CDryB 			= 1.6e+003        # [kg/m3] 	Dry bed density
	FacDSS 			= 1.0e+2		  # [-] 		FacDss*SedDia = Initial suspended sediment diameter.
	IniSedThick 	= morlyr.ini      Initial sediment layer thickness at bed (uniform value or filename)
	TraFrm = 1               [  -   ] General formula (written like Meyer-Peter Mueller)
    ACal                  = 1.000000                                Calibration coefficient                
    RouKs  =   0.000 
    SusFac  = 0.000	
	NodeRelations    = #table_s.nrd#                       [ - ]    File with Overall Node Relations(relative path to sed)
[Sediment]
	Name 			= #SedimentSand4# 	#		Name as specified in NamC in mdf-file
	SedTyp 			= bedload		  #		Must be "sand", "mud" or "bedload"
	SedMinDia = 0.001     [  m   ] Sand only: Minimum sediment diameter
	SedMaxDia = 0.004      [  m   ] Sand only: Maximum sediment diameter
	RhoSol 			= 2.65e+003       # [kg/m3] 	Specific density
	CDryB 			= 1.6e+003        # [kg/m3] 	Dry bed density
	FacDSS 			= 1.0e+2		  # [-] 		FacDss*SedDia = Initial suspended sediment diameter.
	IniSedThick 	= morlyr.ini      Initial sediment layer thickness at bed (uniform value or filename)
	TraFrm = 4               [  -   ] General formula (written like Meyer-Peter Mueller)
    ACal   = 8.0             [  -   ] Calibration factor
    PowerB = 0.0             [  -   ] B Power 
    PowerC = 1.5             [  -   ] C Power
    RipFac = 0.7             [  -   ] Ripple factor
    ThetaC = 0.047           [  -   ] Dimensionless critical shear stress parameter  
    NodeRelations    = #table_s.nrd#                       [ - ]    File with Overall Node Relations(relative path to sed)
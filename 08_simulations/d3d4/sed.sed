[SedimentFileInformation] 
   FileCreatedBy    = chavobsky          
   FileCreationDate = today :D          
   FileVersion      = 02.00                         
[SedimentOverall] 
   Cref             =  1.6000000e+003      [kg/m3]  CSoil Reference density for hindered settling calculations 
   IopSus           = 0                             If Iopsus = 1: susp. sediment size depends on local flow and wave conditions 
[Sediment] 
   Name             = #Sediment1#                   Name of sediment fraction 
   SedTyp           = bedload                       Must be "sand", "mud" or "bedload" 
   RhoSol           =  2.6500000e+003      [kg/m3]  Specific density 
   SedDia           =  1.0000000e-03      [m]      Minimum sediment diameter (D50) 
 
   CDryB            =  1.5900000e+003      [kg/m3]  Dry bed density 
   IniSedThick      =  1.0000000e+000      [m]      Initial sediment layer thickness at bed (overuled if IniComp is prescribed) 
   FacDSS           =  1.0000000e+000      [-]      FacDss * SedDia = Initial suspended sediment diameter. Range [0.6 - 1.0] 

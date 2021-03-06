within ClaRa.Basics.Records;
record IComVLE_L2 "Basic internal communication record for heat transfer"
  extends ClaRa.Basics.Records.IComBase_L2;

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid mediumModel "Used medium model" annotation(Dialog(tab="General"));
//____Variables for system description__________________________________________________
  TILMedia.VLEFluidObjectFunctions.VLEFluidPointer fluidPointer_bulk "Pointer to bulk gas object"
                                                                                            annotation(Dialog(tab="Bulk"));
  SI.EnthalpyMassSpecific h_bulk "Inlet enthalpy" annotation(Dialog(tab="Bulk"));
  SI.MassFraction xi_bulk[mediumModel.nc - 1] "Inlet medium composition" annotation(Dialog(tab="Bulk"));
  SI.Mass mass "||Mass of system|";
//____Inlet_____________________________________________________________________________
   TILMedia.VLEFluidObjectFunctions.VLEFluidPointer fluidPointer_in "Pointer to inlet gas object"
                                                                                           annotation(Dialog(tab="Inlet"));
  SI.EnthalpyMassSpecific h_in "Inlet enthalpy" annotation(Dialog(tab="Inlet"));
  SI.MassFraction xi_in[mediumModel.nc - 1] "Inlet medium composition" annotation(Dialog(tab="Inlet"));

//____Outlet____________________________________________________________________________
  TILMedia.VLEFluidObjectFunctions.VLEFluidPointer fluidPointer_out "Pointer to outlet gas object"
                                                                                             annotation(Dialog(tab="Outlet"));
  SI.EnthalpyMassSpecific h_out "Outlet enthalpy" annotation(Dialog(tab="Outlet"));
  SI.MassFraction xi_out[mediumModel.nc - 1] "Outlet medium composition"  annotation(Dialog(tab="Outlet"));

  annotation (   defaultComponentName="iCom",
    defaultComponentPrefixes="inner");
end IComVLE_L2;

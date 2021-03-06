within ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.VLE_HT;
model NusseltPipe_L4 "Pipe || VLE || Nusselt || 1ph"
  //___________________________________________________________________________//
  // Component of the ClaRa library, version: 1.2.2                            //
  //                                                                           //
  // Licensed by the DYNCAP/DYNSTART research team under Modelica License 2.   //
  // Copyright  2013-2017, DYNCAP/DYNSTART research team.                     //
  //___________________________________________________________________________//
  // DYNCAP and DYNSTART are research projects supported by the German Federal //
  // Ministry of Economic Affairs and Energy (FKZ 03ET2009/FKZ 03ET7060).      //
  // The research team consists of the following project partners:             //
  // Institute of Energy Systems (Hamburg University of Technology),           //
  // Institute of Thermo-Fluid Dynamics (Hamburg University of Technology),    //
  // TLK-Thermo GmbH (Braunschweig, Germany),                                  //
  // XRG Simulation GmbH (Hamburg, Germany).                                   //
  //___________________________________________________________________________//

  extends ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.VLE_HT.HeatTransfer_L4;

  import fluidObjectFunction_cp = TILMedia.VLEFluidObjectFunctions.specificIsobaricHeatCapacity_phxi;
  import fluidObjectFunction_lambda = TILMedia.VLEFluidObjectFunctions.thermalConductivity_phxi;
  import fluidObjectFunction_eta = TILMedia.VLEFluidObjectFunctions.dynamicViscosity_phxi;
  import fluidObjectFunction_rho = TILMedia.VLEFluidObjectFunctions.density_phxi;

  //  parameter Modelica.SIunits.CoefficientOfHeatTransfer kc_nom = 10
  //    "Constant heat transfer coefficient"  annotation(Dialog(group="Heat Transfer"));

  Modelica.SIunits.CoefficientOfHeatTransfer alpha[iCom.N_cv];

  Modelica.SIunits.PrandtlNumber Pr[iCom.N_cv] "Prandl number";
  Modelica.SIunits.ReynoldsNumber Re[iCom.N_cv] "Reynolds number";
  Modelica.SIunits.NusseltNumber Nu[iCom.N_cv] "Nusselt number";
  Real failureStatus[iCom.N_cv] "0== boundary conditions fulfilled | 1== failure >> check if still meaningfull results";

  parameter FluidDissipation.Utilities.Types.HeatTransferBoundary boundary=FluidDissipation.Utilities.Types.HeatTransferBoundary.UWTuDFF "Choice of heat transfer boundary condition, relevant for laminar flow heat transfer";

equation
  T_mean = iCom.T;
  heat.Q_flow = alpha .* A_heat .* (heat.T - T_mean);

  for i in 1:iCom.N_cv loop
    //  alpha[i]=kc_nom;

    (alpha[i],Pr[i],Re[i],Nu[i],failureStatus[i]) = FluidDissipation.HeatTransfer.StraightPipe.kc_overall(FluidDissipation.HeatTransfer.StraightPipe.kc_overall_IN_con(target=boundary, d_hyd=geo.diameter, L=geo.length*geo.N_passes), FluidDissipation.HeatTransfer.StraightPipe.kc_overall_IN_var(
      cp=fluidObjectFunction_cp(
        iCom.p[i],
        iCom.h[i],
        iCom.xi[i, :],
        iCom.fluidPointer[i]),
      eta=fluidObjectFunction_eta(
        iCom.p[i],
        iCom.h[i],
        iCom.xi[i, :],
        iCom.fluidPointer[i]),
      lambda=fluidObjectFunction_lambda(
        iCom.p[i],
        iCom.h[i],
        iCom.xi[i, :],
        iCom.fluidPointer[i]),
      rho=fluidObjectFunction_rho(
        iCom.p[i],
        iCom.h[i],
        iCom.xi[i, :],
        iCom.fluidPointer[i]),
      m_flow=m_flow[i]/geo.N_tubes));
  end for;

  annotation (experiment, __Dymola_experimentSetupOutput);
end NusseltPipe_L4;

within ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL;
model QuadraticNominalPoint_L2 "All geo || Quadratic pressure loss || nominal point || density dependent "
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

  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.PressureLoss_L2;
  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.TubeType_L2;
  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.ShellType_L2;
  parameter SI.Pressure Delta_p_smooth=100 "Start linearisation for decreasing pressure loss";
  parameter SI.PressureDifference Delta_p_nom=1000 "Nominal pressure loss";
  parameter SI.DensityMassSpecific rho_nom=1000 "Nominal inlet density";
  final parameter FluidDissipation.Utilities.Types.PressureLossCoefficient zeta=2*Delta_p_nom*geo.A_cross^2*rho_nom/iCom.m_flow_nom^2 "Pressure loss coefficient for total pipe";
  SI.DensityMassSpecific rho_in "Inlet density";
equation
  rho_in = TILMedia.VLEFluidObjectFunctions.density_phxi(
    iCom.p_in,
    iCom.h_in,
    iCom.xi_in,
    iCom.fluidPointer_in);
  //   iCom.m_flow_in = homotopy(iCom.m_flow_nom * ClaRa.Basics.Functions.ThermoRoot(Delta_p/Delta_p_nom, Delta_p_smooth/Delta_p_nom)* sqrt(rho_in/rho_nom),
  //                               iCom.m_flow_nom/Delta_p_nom*Delta_p);
  iCom.m_flow_in = homotopy(geo.A_cross*sqrt(2*rho_in/zeta)*ClaRa.Basics.Functions.ThermoRoot(Delta_p, Delta_p_smooth), iCom.m_flow_nom/Delta_p_nom*Delta_p);
end QuadraticNominalPoint_L2;

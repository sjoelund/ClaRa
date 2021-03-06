within ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Convection;
partial model HeatTransfer_L4 "Gas || HT Base Class"
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

  extends ClaRa.Basics.Icons.Alpha;
  extends ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.HeatTransferBaseGas_L4;
  outer ClaRa.Basics.Records.IComGas_L3 iCom;
  outer ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.GenericGeometry_N_cv geo;
  outer parameter Boolean useHomotopy;

  Modelica.SIunits.MassFlowRate m_flow[iCom.N_cv + 1] "Mass flow rate";
  Modelica.SIunits.Temperature T_mean[iCom.N_cv];
  ClaRa.Basics.Interfaces.HeatPort_a heat[iCom.N_cv] annotation (Placement(transformation(extent={{80,80},{100,100}}), iconTransformation(extent={{80,80},{100,100}})));
  annotation (Icon(graphics));
end HeatTransfer_L4;

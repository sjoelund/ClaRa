within ClaRa.Components.TurboMachines.Fundamentals.EfficiencyModels;
model TableVolumeFlow "Table based | Volume flow rate dependent"
//___________________________________________________________________________//
// Component of the ClaRa library, version: 1.1.0                        //
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
  extends ClaRa.Components.TurboMachines.Fundamentals.EfficiencyModels.EfficiencyModelBase;
 parameter Real eta_Vflow[:,2]=[0.0, 0.94; 1, 0.94] "Characteristic line eta = f(V_flow/V_flow_nom)";
     Real eta "Efficiency";
protected
  Modelica.Blocks.Tables.CombiTable1D HydraulicEfficiency(columns={2}, table=
        eta_Vflow)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

equation
    eta=HydraulicEfficiency.y[1];
    HydraulicEfficiency.u[1]=iCom.m_flow_in*iCom.rho_nom/iCom.rho_in/iCom.m_flow_nom;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TableVolumeFlow;

within ClaRa.StaticCycles.ValvesConnects;
model Tube3 " Tube || blue | blue"
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
  // Blue input:   Value of p is known in component and provided FOR neighbor component, values of m_flow and h are unknown and provided BY neighbor component.
  // Blue output:  Value of p is unknown and provided BY neighbor component, values of m_flow and h are known in component and provided FOR neighbor component.
  outer ClaRa.SimCenter simCenter;
  outer parameter Real P_target_ "Target power in p.u.";
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium = simCenter.fluid1 "Medium in the component"
    annotation(choices(choice=simCenter.fluid1 "First fluid defined in global simCenter",
                       choice=simCenter.fluid2 "Second fluid defined in global simCenter",
                       choice=simCenter.fluid3 "Third fluid defined in global simCenter"),
                                                          Dialog(group="Fundamental Definitions"));
  parameter ClaRa.Basics.Units.Pressure Delta_p_nom "Nominal friction pressure loss" annotation(Dialog(group="Fundamental Definitions"));
  parameter Real CharLine_Delta_p_fric_P_target_[:,2]=[0,0;1,1] "Characteristic line of friction loss as function of mass flow rate" annotation(Dialog(group="Part Load Definition"));

  parameter ClaRa.Basics.Units.Length z_in = 0.0 "Geodetic height at inlet" annotation(Dialog(group="Fundamental Definitions"));
  parameter ClaRa.Basics.Units.Length z_out = 0.0 "Geodetic height at outlet" annotation(Dialog(group="Fundamental Definitions"));

  parameter ClaRa.Basics.Units.Length Delta_x[:] = fill(abs(z_in-z_out)/3, 3) "Discretisation scheme" annotation(Dialog(group="Discretisation (for reporting only)"));
  parameter Boolean frictionAtInlet = false "True if pressure loss between first cell and inlet shall be considered" annotation(Dialog(group="Discretisation (for reporting only)"), choices(checkBox=false));
  parameter Boolean frictionAtOutlet = false "True if pressure loss between last cell and outlet shall be considered" annotation(Dialog(group="Discretisation (for reporting only)"), choices(checkBox=false));
  final parameter Integer N_cv = size(Delta_x,1) "Number of finite volumes" annotation(Dialog(group="Discretisation (for reporting only)"));

  final parameter ClaRa.Basics.Units.MassFlowRate m_flow(fixed=false);
  final parameter ClaRa.Basics.Units.Pressure p_in = p_out + Delta_p_fric + Delta_p_geo "Pressure at tube inlet";
  final parameter ClaRa.Basics.Units.EnthalpyMassSpecific h_in(fixed=false) "Spec. enthalpy at tube inlet";
  constant ClaRa.Basics.Units.MassFraction[:] xi=zeros(medium.nc - 1) "VLE composition in component, pure fluids supported only!";
  final parameter ClaRa.Basics.Units.Pressure Delta_p_geo=
    TILMedia.VLEFluidFunctions.density_phxi(medium, p_out, h_in, xi) * Modelica.Constants.g_n * ( z_out - z_in) "Geostatic pressure difference";
  final parameter ClaRa.Basics.Units.Pressure p_out(fixed=false) "Outlet pressure";

  final parameter ClaRa.Basics.Units.Pressure p[N_cv] = ClaRa.Basics.Functions.pressureInterpolation(p_in, p_out, Delta_x, frictionAtInlet, frictionAtOutlet) "Rprt: Discretisised pressure";
  final parameter ClaRa.Basics.Units.PressureDifference Delta_p_fric(fixed=false) "Actual friction pressure loss";
protected
  ClaRa.Components.Utilities.Blocks.ParameterizableTable1D table(table=CharLine_Delta_p_fric_P_target_, u = {P_target_});

public
  Fundamentals.SteamSignal_blue_a inlet(p=p_in) annotation (Placement(transformation(extent={{-100,-10},{-110,10}}), iconTransformation(extent={{-100,-10},{-110,10}})));
  Fundamentals.SteamSignal_blue_b outlet(m_flow=m_flow, h=h_in) annotation (Placement(transformation(extent={{110,-10},{100,10}}), iconTransformation(extent={{110,-10},{100,10}})));
initial equation
  Delta_p_fric = table.y[1] * Delta_p_nom;
  outlet.p=p_out;
  inlet.m_flow=m_flow;
  inlet.h=h_in;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true,extent={{-100,-40},{100,40}}),
                   graphics={
         Polygon(
          points={{-100,40},{-80,40},{-60,30},{60,30},{80,40},{100,40},{100,-40},{80,-40},{60,-30},{-60,-30},{-80,-40},{-100,-40},{-100,40}},
          lineColor={0,131,169},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,40},{-72,40},{-60,30},{-60,-30},{-80,-40},{-100,-40},{-100,40}},
          lineColor={0,131,169},
          fillColor= DynamicSelect({255,255,255}, if frictionAtInlet then {0,131,169} else {255,255,255}),
          fillPattern=FillPattern.Solid),
        Polygon(points={{100,40},{80,40},{60,30},{60,-30},{80,-40},{100,-40},{100,40}},
          lineColor={0,131,169},
          fillColor= DynamicSelect({255,255,255}, if frictionAtOutlet then {0,131,169} else {255,255,255}),
          fillPattern=FillPattern.Solid)}),
                                 Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-75},{100,75}}), graphics));
end Tube3;

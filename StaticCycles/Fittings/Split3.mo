within ClaRa.StaticCycles.Fittings;
model Split3 "Split || blue | green | blue"
//___________________________________________________________________________//
// Component of the ClaRa library, version: 1.2.1                            //
//                                                                           //
// Licensed by the DYNCAP/DYNSTART research team under Modelica License 2.   //
// Copyright  2013-2016, DYNCAP/DYNSTART research team.                     //
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
// Green output: Values of p, m_flow and h are known in component an provided FOR neighbor component.
// Blue output:  Value of p is unknown and provided BY neighbor component, values of m_flow and h are known in component and provided FOR neighbor component.
  final parameter ClaRa.Basics.Units.MassFlowRate m_flow_2 = m_flow_1*splitRatio "Mass flow rate of outlet 1";
  final parameter ClaRa.Basics.Units.MassFlowRate m_flow_3 = m_flow_1-m_flow_2 "Mass flow rate of outlet 2";
  final parameter ClaRa.Basics.Units.EnthalpyMassSpecific h1(fixed=false) "Spec. enthalpy at inlet";
  final parameter ClaRa.Basics.Units.MassFlowRate m_flow_1(fixed=false) "Mass flow rate of inlet";
  final parameter ClaRa.Basics.Units.Pressure p(fixed=false) "Mixer pressure";
  parameter Real splitRatio "Ratio of outlet_1.m_flow/inlet.m_flow";

  Fundamentals.SteamSignal_blue_a inlet(p=p) annotation (Placement(transformation(extent={{-50,10},{-60,30}}), iconTransformation(extent={{-50,10},{-60,30}})));
  Fundamentals.SteamSignal_green_b outlet_1(
    m_flow=m_flow_2,
    h=h1,
    p=p) annotation (Placement(transformation(extent={{60,10},{50,30}}), iconTransformation(extent={{60,10},{50,30}})));
  Fundamentals.SteamSignal_blue_b outlet_2(h=h1, m_flow=m_flow_3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,0}), iconTransformation(
        extent={{-10,-30},{10,-40}},
        rotation=0,
        origin={0,0})));
initial equation
  inlet.m_flow=m_flow_1;
  inlet.h=h1;
  outlet_2.p=p;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-50,-30},{50,30}}),
                         graphics={Polygon(
          points={{-50,30},{50,30},{50,10},{10,10},{10,-30},{-10,-30},{-10,10},{-50,10},{-50,30}},
          lineColor={0,131,169},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-50,-30},{50,30}}),     graphics));
end Split3;
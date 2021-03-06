within ClaRa.Basics.ControlVolumes.Fundamentals.Check;
model Test_SmoothedDeltaTmean_arith
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

  extends ClaRa.Basics.Icons.PackageIcons.ExecutableExampleb50;

  Real DT_wo=T_w - T_o.y;
  Real DT_wi=T_w - (T_i.y + ramp.y);
  Real T_w=200;
  Real T_i1=(T_i.y + ramp.y);

  Real DT_mean;
  Modelica.Blocks.Sources.Trapezoid T_o(
    rising=1,
    falling=1,
    startTime=5,
    nperiod=1,
    offset=150,
    amplitude=+100,
    period=20,
    width=5) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Trapezoid T_i(
    rising=1,
    startTime=5,
    falling=1,
    period=10,
    width=1,
    nperiod=1,
    offset=100,
    amplitude=0) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=1,
    startTime=7,
    height=200) annotation (Placement(transformation(extent={{-2,-18},{18,2}})));
equation

  DT_mean = ClaRa.Basics.Functions.Stepsmoother(
    100,
    -100,
    DT_wi*DT_wo)*(DT_wi + DT_wo)/2;
  annotation ();
end Test_SmoothedDeltaTmean_arith;

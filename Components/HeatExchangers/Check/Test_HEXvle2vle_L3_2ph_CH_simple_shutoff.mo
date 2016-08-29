within ClaRa.Components.HeatExchangers.Check;
model Test_HEXvle2vle_L3_2ph_CH_simple_shutoff "Quickly reduce the steam mass flow from full load to near zero. Vary liquid pressure state location"
 extends ClaRa.Basics.Icons.PackageIcons.ExecutableExampleb50;

  HEXvle2vle_L3_2ph_CH_simple
                           hex(
    redeclare model WallMaterial =
        TILMedia.SolidTypes.TILMedia_Aluminum,
    redeclare model PressureLossTubes =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.PressureLossCoeffcient_L2 (             Delta_p_smooth=100, zeta_TOT=5),
    redeclare model PressureLossShell =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.Generic_PL.LinearParallelZones_L3,
    initTypeTubes=ClaRa.Basics.Choices.Init.noInit,
    m_flow_nom_shell=78,
    p_start_shell=0.023e5,
    CF_geo=1,
    m_flow_nom_tubes=11500,
    p_nom_tubes=1e5,
    h_nom_tubes=60e3,
    h_start_tubes=60e3,
    p_start_tubes=1e5,
    mass_struc=500,
    level_rel_start=0.2,
    initTypeShell=ClaRa.Basics.Choices.Init.steadyDensity,
    redeclare model HeatTransfer_Shell =
        Basics.ControlVolumes.Fundamentals.HeatTransport.VLE_HT.Constant_L3_ypsDependent (                   alpha_nom={1000,5000}),
    z_out_shell=0.05,
    redeclare model HeatTransferTubes =
        Basics.ControlVolumes.Fundamentals.HeatTransport.VLE_HT.NusseltPipe1ph_L2 (                          CF_alpha_tubes=0.5),
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    z_in_shell=9.9,
    z_in_aux1=9.9,
    z_in_aux2=9.9,
    orientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
    flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
    z_in_tubes=5,
    z_out_tubes=5,
    shell(equalPressures=false),
    levelOutput=true)
                   annotation (Placement(transformation(extent={{0,-20},{20,0}})));

  Modelica.Blocks.Sources.Ramp h_steam(
    height=124e3,
    duration=600,
    offset=2212.6e3,
    startTime=10000) annotation (Placement(transformation(extent={{124,32},{104,52}})));
  Modelica.Blocks.Sources.Ramp m_cool(
    duration=100,
    startTime=1000,
    height=0,
    offset=11500) annotation (Placement(transformation(extent={{120,-66},{100,-46}})));
  Modelica.Blocks.Sources.Ramp m_steam(
    startTime=10000,
    offset=76.8,
    height=-76,
    duration=3)   annotation (Placement(transformation(extent={{128,2},{108,22}})));
  VolumesValvesFittings.Valves.ValveVLE_L1                      valve_shell1(
    checkValve=true,
    redeclare model PressureLoss =
        VolumesValvesFittings.Valves.Fundamentals.QuadraticNominalPoint (                           m_flow_nom=10, Delta_p_nom=250),
    openingInputIsActive=true)
    annotation (Placement(transformation(extent={{-30,-92},{-50,-80}})));
  VolumesValvesFittings.Valves.ValveVLE_L1                      valve_tubes1(
    openingInputIsActive=false,
    checkValve=true,
    redeclare model PressureLoss =
        VolumesValvesFittings.Valves.Fundamentals.LinearNominalPoint (                           Delta_p_nom=1000, m_flow_nom=11500))
    annotation (Placement(transformation(extent={{-10,-6},{10,6}},
        rotation=180,
        origin={-24,-8})));
  BoundaryConditions.BoundaryVLE_phxi pressureSink_ph(h_const=300e3, p_const=21e5,
    variable_p=true)                                                               annotation (Placement(transformation(extent={{-74,-96},{-54,-76}})));
  BoundaryConditions.BoundaryVLE_phxi pressureSink_ph1(h_const=2000e3, p_const=250e5,
    variable_p=true)                                                                  annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-56,-8})));
  BoundaryConditions.BoundaryVLE_hxim_flow massFlowSource_h(variable_m_flow=true, variable_h=true,
    showData=true)                                                                                 annotation (Placement(transformation(extent={{92,46},{72,26}})));
  BoundaryConditions.BoundaryVLE_Txim_flow massFlowSource_h1(
    variable_m_flow=true,
    showData=true,
    variable_T=true)
                   annotation (Placement(transformation(extent={{82,-18},{62,2}})));
  Modelica.Blocks.Sources.Ramp T_cool(
    duration=600,
    offset=13.7 + 273.15,
    startTime=10000,
    height=2)        annotation (Placement(transformation(extent={{120,-96},{100,-76}})));
  inner SimCenter simCenter(
    useHomotopy=true,
    redeclare TILMedia.VLEFluidTypes.TILMedia_SplineWater fluid1,
    showExpertSummary=true) annotation (Placement(transformation(extent={{100,100},{140,120}})));
  Visualisation.Quadruple quadruple(largeFonts=false) annotation (Placement(transformation(extent={{-40,-26},{-10,-16}})));
  Modelica.Blocks.Sources.Ramp p_steam(
    duration=600,
    startTime=10000,
    height=0.005e5,
    offset=0.023e5) annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
  Modelica.Blocks.Sources.Ramp p_cool(
    duration=600,
    startTime=10000,
    height=0,
    offset=1e5) annotation (Placement(transformation(extent={{-100,2},{-80,22}})));
  Visualisation.Quadruple quadruple2(
                                    largeFonts=false) annotation (Placement(transformation(extent={{28,-21},{58,-11}})));
  Visualisation.Quadruple quadruple1(
                                    largeFonts=false) annotation (Placement(transformation(extent={{14,-43},{44,-33}})));
  Visualisation.Quadruple quadruple3(
                                    largeFonts=false, decimalSpaces(p=3))
                                                      annotation (Placement(transformation(extent={{28,39},{58,49}})));
  Visualisation.DynamicBar            level_abs1(
    provideConnector=true,
    u_set=0.8,
    u_high=1,
    u_low=0.6,
    u_max=4,
    u=hex.shell.summary.outline.level_abs)
                     annotation (Placement(transformation(extent={{4,-46},{-8,-26}})));
  Utilities.Blocks.LimPID PI(
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Tau_d=60,
    k=0.1,
    u_ref=1,
    y_ref=1,
    y_max=1,
    sign=-1,
    y_start=0.5,
    Tau_i=120,
    y_min=0.001)
               annotation (Placement(transformation(extent={{-72,-52},{-62,-62}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=0.8) annotation (Placement(transformation(extent={{-96,-62},{-80,-52}})));
equation

  connect(m_steam.y, massFlowSource_h.m_flow) annotation (Line(
      points={{107,12},{100,12},{100,30},{94,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(massFlowSource_h.h, h_steam.y) annotation (Line(
      points={{94,36},{98,36},{98,42},{103,42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pressureSink_ph.steam_a,valve_shell1. outlet) annotation (Line(
      points={{-54,-86},{-50,-86}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(pressureSink_ph1.steam_a,valve_tubes1. outlet) annotation (Line(
      points={{-46,-8},{-34,-8}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hex.Out2, valve_tubes1.inlet) annotation (Line(
      points={{0,-8},{-14,-8}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(m_cool.y, massFlowSource_h1.m_flow) annotation (Line(
      points={{99,-56},{96,-56},{96,-2},{84,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hex.In1, massFlowSource_h.steam_a) annotation (Line(
      points={{10,-0.2},{10,36},{72,36}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hex.eye2, quadruple.eye) annotation (Line(points={{-1,-10},{-2,-10},{-2,-21},{-40,-21}},  color={190,190,190}));
  connect(p_steam.y, pressureSink_ph.p) annotation (Line(points={{-79,-80},{-74,-80}},           color={0,0,127}));
  connect(pressureSink_ph1.p, p_cool.y) annotation (Line(points={{-66,-14},{-74,-14},{-74,12},{-79,12}},
                                                                                            color={0,0,127}));
  connect(T_cool.y, massFlowSource_h1.T) annotation (Line(points={{99,-86},{84,-86},{84,-8}},  color={0,0,127}));
  connect(valve_shell1.inlet, hex.Out1) annotation (Line(
      points={{-30,-86},{10,-86},{10,-20}},
      color={0,131,169},
      thickness=0.5));
  connect(massFlowSource_h1.steam_a, hex.In2) annotation (Line(
      points={{62,-8},{52,-8},{20,-8}},
      color={0,131,169},
      thickness=0.5));
  connect(quadruple2.eye, massFlowSource_h1.eye) annotation (Line(points={{28,-16},{62,-16}},          color={190,190,190}));
  connect(quadruple1.eye, hex.eye1) annotation (Line(points={{14,-38},{14,-38},{14,-21}},        color={190,190,190}));
  connect(massFlowSource_h.eye, quadruple3.eye) annotation (Line(points={{72,44},{56,44},{28,44}},
                                                                                         color={190,190,190}));
  connect(level_abs1.y, PI.u_m) annotation (Line(points={{-9.2,-46},{-9.2,-46},{-66.95,-46},{-66.95,-51}},
                                                                                            color={0,0,127}));
  connect(PI.y, valve_shell1.opening_in) annotation (Line(points={{-61.5,-57},{-40,-57},{-40,-77}},            color={0,0,127}));
  connect(realExpression.y, PI.u_s) annotation (Line(points={{-79.2,-57},{-79.2,-57},{-73,-57}},
                                                                                     color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{140,120}},
          preserveAspectRatio=false,
        initialScale=0.1),            graphics={  Text(
          extent={{-100,116},{136,70}},
          lineColor={0,128,0},
          horizontalAlignment=TextAlignment.Left,
          fontSize=11,
          textString="______________________________________________________________________________________________
PURPOSE:
>>check HEXvle2vle_L3_2ph_CH_simple as a condenser in a trip scenario

LOOK AT: level development (hex.summary.outline.level_abs). If equalPressure = true then the liquid mass in the vessl
will temporarily boil and the level will rise quickly.  To avoid this behaviour set the parameter equalPressures to false.

______________________________________________________________________________________________"),
                       Text(
          extent={{-100,120},{58,102}},
          lineColor={0,128,0},
          fontSize=31,
          textString="TESTED -- 2016-03-23 //TH")}),
                                                 Icon(coordinateSystem(initialScale=0.1)),
    experiment(
      StopTime=20000,
      __Dymola_NumberOfIntervals=50000,
      Tolerance=1e-005,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput(equidistant=false));
end Test_HEXvle2vle_L3_2ph_CH_simple_shutoff;
within ClaRa.Examples;
model ClosedLoopBoilerExample
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
  extends ClaRa.Basics.Icons.PackageIcons.ExecutableRegressiong100;

  model Regression
  extends ClaRa.Basics.Icons.RegressionSummary;

  Modelica.Blocks.Interfaces.RealInput m_flow_flueGas_eco_out "Mass flow of flue gas eco outlet";
  Modelica.Blocks.Interfaces.RealInput m_flow_coal_in_burner2 "Inlet coal mass flow burner 2";
  Modelica.Blocks.Interfaces.RealInput T_eco_out "Outlet temperature eco";
  Modelica.Blocks.Interfaces.RealInput Q_flow_oh2 "Heat flux at superheater wall";
  Modelica.Blocks.Interfaces.RealInput T_flueGas_in "Inlet temperature of flue gas";
  Modelica.Blocks.Interfaces.RealInput h_oh_out "Overhater outlet temperature";

  Modelica.Blocks.Interfaces.RealInput V_flow_pump "Volume flow of feedwater";
  Modelica.Blocks.Interfaces.RealInput p_turbine_in "Inlet pressure turbine";
  Modelica.Blocks.Interfaces.RealInput T_turbine_in "Inlet temperature turbine";
  Modelica.Blocks.Interfaces.RealInput level_condenser "level of condenser";
  Modelica.Blocks.Interfaces.RealInput m_flow_eco_out "Water mass flow out of eco";

  Real y_m_flow_flueGas_eco_out_min = timeExtrema_m_flow_flueGas_eco_out.y_min;
  Real y_m_flow_flueGas_eco_out_max = timeExtrema_m_flow_flueGas_eco_out.y_max;
  Real y_m_flow_coal_in_burner2_int = integrator_m_flow_coal_in_burner2.y;
  Real y_T_eco_out_min = timeExtrema_T_eco_out.y_min;
  Real y_T_eco_out_max = timeExtrema_T_eco_out.y_max;
  Real y_Q_flow_oh2_int = integrator_Q_flow_oh2_wall.y;
  Real y_T_flueGas_in_max = timeExtrema_T_flueGas_in.y_max;
  Real y_T_flueGas_in_min = timeExtrema_T_flueGas_in.y_min;
  Real y_h_oh_out_min = timeExtrema_h_oh_out.y_min;
  Real y_h_oh_out_max = timeExtrema_h_oh_out.y_max;

  Real y_V_flow_pump_min = timeExtrema_V_flow_pump.y_min;
  Real y_V_flow_pump_max = timeExtrema_V_flow_pump.y_max;
  Real y_p_turbine_in_min = timeExtrema_p_turbine_in.y_min;
  Real y_p_turbine_in_max = timeExtrema_p_turbine_in.y_max;
  Real y_T_turbine_in_int = integrator_T_turbine_in.y;
  Real y_level_condenser_max = timeExtrema_level_condenser.y_max;
  Real y_level_condenser_min = timeExtrema_level_condenser.y_min;
  Real y_m_flow_eco_out_min = timeExtrema_m_flow_eco.y_min;
  Real y_m_flow_eco_out_max = timeExtrema_m_flow_eco.y_max;

  protected
  Components.Utilities.Blocks.TimeExtrema timeExtrema_m_flow_flueGas_eco_out(startTime=5000, u=m_flow_flueGas_eco_out) annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_T_eco_out(startTime=5000, u=T_eco_out) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Components.Utilities.Blocks.Integrator integrator_m_flow_coal_in_burner2(u=m_flow_coal_in_burner2) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Components.Utilities.Blocks.Integrator integrator_Q_flow_oh2_wall(u=Q_flow_oh2) annotation (Placement(transformation(extent={{-80,-34},{-60,-14}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_T_flueGas_in(u = T_flueGas_in, startTime=5000) annotation (Placement(transformation(extent={{-80,-64},{-60,-44}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_h_oh_out(startTime=5000, u=h_oh_out) annotation (Placement(transformation(extent={{-80,-94},{-60,-74}})));

  Components.Utilities.Blocks.TimeExtrema timeExtrema_V_flow_pump(u = V_flow_pump, startTime=5000) annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_p_turbine_in(u = p_turbine_in, startTime=5000) annotation (Placement(transformation(extent={{14,18},{34,38}})));
  Components.Utilities.Blocks.Integrator integrator_T_turbine_in(u = T_turbine_in) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_level_condenser(u = level_condenser, startTime=5000) annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Components.Utilities.Blocks.TimeExtrema timeExtrema_m_flow_eco(u = m_flow_eco_out) annotation (Placement(transformation(extent={{-20,-76},{0,-56}})));
  end Regression;

  inner SimCenter simCenter(
    redeclare ClaRa.Basics.Media.Fuel.Coal_Reference fuelModel1,
    redeclare ClaRa.Basics.Media.Fuel.Slag_v2 slagModel,
    useHomotopy=false,
    redeclare TILMedia.GasTypes.FlueGasTILMedia flueGasModel,
    contributeToCycleSummary=true,
    redeclare TILMedia.VLEFluidTypes.TILMedia_InterpolatedWater fluid1)
                                                              annotation (Placement(transformation(extent={{420,360},{460,380}})));

  Components.Adapters.FuelSlagFlueGas_split                      coalSlagFlueGas_split_top
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,246})));
  Components.BoundaryConditions.BoundarySlag_Tm_flow
                                               slagFlowSource_top(m_flow_const=0.0, T_const=658.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={42,296})));
  Components.BoundaryConditions.BoundaryFuel_pTxi coalSink_top(T_const=658.15)
                                                   annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,298})));
  Components.BoundaryConditions.BoundaryFuel_Txim_flow coalFlowSource(
    xi_const={0.661,0.0383,0.066,0.016,0.0057,0.135},
    m_flow_const=15,
    variable_m_flow=true,
    T_const=293.15,
    LHV_predefined=25.1e6/0.91,
    variable_xi=true) annotation (Placement(transformation(extent={{-140,0},{-120,20}})));
  Components.Adapters.FuelFlueGas_join coalGas_join_burner(fuel_inlet(xi_outflow(start={0.661,0.0383,0.066,0.016,0.0057,0.135}))) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-56,4})));
  Components.Adapters.FuelSlagFlueGas_join
    coalSlagFlueGas_join
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,-70})));
  Components.BoundaryConditions.BoundaryGas_Txim_flow
                                                fluelGasFlowSource_bottom(
    m_flow_const=0.0,
    T_const=293.15,
    xi_const={0,0,0.0005,0,0.7581,0.2314,0,0,0.01}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,-108})));
  Components.BoundaryConditions.BoundaryFuel_Txim_flow
                                               coalFlowSource_bottom(
    xi_const={0.86,0.035,0.025,0.014,0.007,0.0505},
    m_flow_const=0,
    T_const=293.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={22,-110})));
  Components.BoundaryConditions.BoundarySlag_pT    slaglSink_bottom(T_const=
        373.15)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={42,-110})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedTemperatureBottom(Q_flow=0)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={102,-66})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperatureTop(T=658.15)
                annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={116,274})));
  Components.Furnace.Burner.Burner_L2_Dynamic burner1(
    T_slag=873,
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=5),
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Gas_advanced_L2 (
         suspension_calculationType="Calculated"),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Wall_advanced_L2 (
         suspension_calculationType="Calculated", CF_fouling=0.95),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlock (
        width=10,
        length=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        height=7.5),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.1),
    T_start_flueGas_out=1620)
    annotation (Placement(transformation(extent={{28,-6},{88,14}})));

  Components.Furnace.Hopper.Hopper_L2 hopper(
    flueGasOutlet(h(start=-22790)),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlock (
        width=10,
        height=3,
        length=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.horizontal),
    T_start_flueGas_out=780,
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Gas_advanced_L2 (
        suspension_calculationType="Gas calculated, particles fixed"),
    xi_start_flueGas_out={0.0103,0,0.2270,0.001,0.6999,0.0225,0,0.0393,0},
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Wall_advanced_L2 (
                                                                                                suspension_calculationType="Calculated", CF_fouling=0.95),
    T_Slag=873) annotation (Placement(transformation(
        extent={{-30,-10},{30,10}},
        rotation=0,
        origin={58,-30})));

  Components.Furnace.Burner.Burner_L2_Dynamic burner2(
    T_slag=873,
    xi_fuel_in(start={0.661,0.0383,0.066,0.016,0.0057,0.135}),
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=15),
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Gas_advanced_L2 (
         suspension_calculationType="Calculated"),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Wall_advanced_L2 (
         suspension_calculationType="Calculated", CF_fouling=0.95),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlock (
        width=10,
        length=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        height=7.5),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.1),
    T_start_flueGas_out=1370)
    annotation (Placement(transformation(extent={{28,24},{88,44}})));

  Components.BoundaryConditions.BoundaryFuel_Txim_flow coalFlowSource1(
    xi_const={0.661,0.0383,0.066,0.016,0.0057,0.135},
    m_flow_const=15,
    variable_m_flow=true,
    T_const=293.15,
    LHV_predefined=25.1e6/0.91,
    variable_xi=true) annotation (Placement(transformation(extent={{-140,30},{-120,50}})));
  Components.Adapters.FuelFlueGas_join coalGas_join_burner1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-56,34})));
  Components.Furnace.FlameRoom.FlameRoomAdditionalAir_L2_Dynamic flameRoom_1(
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=16),
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Gas_advanced_L2 (
         suspension_calculationType="Calculated"),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Wall_advanced_L2 (
         suspension_calculationType="Calculated", CF_fouling=0.95),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlock (
        width=10,
        length=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        height=5),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.1),
    T_start_flueGas_out=1370)
    annotation (Placement(transformation(extent={{28,52},{88,72}})));

  Components.Furnace.FlameRoom.FlameRoom_L2_Dynamic flameRoom_2(
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=16),
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Gas_advanced_L2 (
         suspension_calculationType="Calculated"),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    m_flow_nom=342,
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlock (
        width=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        length=10,
        height=18),
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Radiation.Radiation_gas2Wall_advanced_L2 (
         suspension_calculationType="Calculated", CF_fouling=0.95),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.1),
    T_start_flueGas_out=1320)
    annotation (Placement(transformation(extent={{28,82},{88,102}})));

  Components.Furnace.FlameRoom.FlameRoomWithTubeBundle_L2_Dynamic
    flameRoom_oh_1(
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Adiabat_L2,
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=13),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.3),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    m_flow_nom=342,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.CharLine_L2 (
         alpha_nom=80),
    redeclare model HeatTransfer_CarrierTubes =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L2 (
         alpha_nom=30),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlockWithTubesAndCarrierTubes (
        width=10,
        length=10,
        diameter_t=0.04,
        Delta_z_par=0.1,
        Delta_z_ort=0.1,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        N_rows=40,
        N_tubes=3000,
        height=6),
    T_start_flueGas_out=680,
    redeclare model HeatTransfer_TubeBundle =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Convection.ConvectionAndRadiation_tubeBank_L2 (
        CF_fouling=0.95,
        suspension_calculationType="Gas calculated, particles fixed",
        emissivity_particle=0))
    annotation (Placement(transformation(extent={{28,112},{88,132}})));

  Components.Furnace.FlameRoom.FlameRoomWithTubeBundle_L2_Dynamic
    flameRoom_oh_2(
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Adiabat_L2,
    redeclare model ParticleMigration =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.ParticleMigration.MeanMigrationSpeed (
         w_initial=9),
    redeclare model Burning_time =
        ClaRa.Components.Furnace.GeneralTransportPhenomena.BurningTime.ConstantBurningTime (
         Tau_burn_const=1.3),
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    m_flow_nom=342,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.CharLine_L2 (
         alpha_nom=20),
    redeclare model HeatTransfer_CarrierTubes =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L2 (
         alpha_nom=30),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlockWithTubesAndCarrierTubes (
        width=10,
        length=10,
        flowOrientation=ClaRa.Basics.Choices.GeometryOrientation.vertical,
        diameter_t=0.04,
        Delta_z_par=0.1,
        Delta_z_ort=0.1,
        N_rows=40,
        N_tubes=4000,
        height=6),
    T_start_flueGas_out=530,
    redeclare model HeatTransfer_TubeBundle =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Convection.ConvectionAndRadiation_tubeBank_L2 (
        CF_fouling=0.95,
        suspension_calculationType="Gas calculated, particles fixed",
        emissivity_particle=0))
    annotation (Placement(transformation(extent={{28,158},{88,178}})));

  Components.BoundaryConditions.BoundaryFuel_Txim_flow coalFlowSource2(
    xi_const={0.661,0.0383,0.066,0.016,0.0057,0.135},
    m_flow_const=0,
    T_const=293.15,
    LHV_predefined=25.1e6/0.91) annotation (Placement(transformation(extent={{-140,58},{-120,78}})));
  Components.BoundaryConditions.BoundaryGas_Txim_flow
                                                fluelGasFlowSource2(
    variable_m_flow=false,
    variable_xi=false,
    m_flow_const=2*10.396,
    T_const=573.15,
    xi_const={0,0,0.0005,0,0.7581,0.2314,0,0,0.01}) annotation (Placement(transformation(extent={{-122,46},{-102,66}})));
  Components.Adapters.FuelFlueGas_join coalGas_join_burner2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-56,62})));
  Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple evap(
    diameter_i=0.03,
    z_in=0,
    N_tubes=300,
    N_cv=8,
    redeclare model HeatTransfer =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4 (                      alpha_nom=20000),
    length=80,
    z_out=80,
    frictionAtInlet=true,
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.QuadraticNominalPoint_L4,
    frictionAtOutlet=true,
    Delta_p_nom=2e5,
    m_flow_nom=275,
    h_start=linspace(
        697563,
        2.21373e6,
        evap.N_cv),
    p_start=linspace(
        296.9e5,
        290.2e5,
        evap.N_cv),
    initOption=0) annotation (Placement(transformation(
        extent={{-10,-6},{10,6}},
        rotation=90,
        origin={266,62})));
  Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple ct(
    diameter_i=0.03,
    N_tubes=300,
    length=30,
    redeclare model HeatTransfer =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4 (                      alpha_nom=10000),
    z_in=80,
    z_out=50,
    N_cv=3,
    frictionAtInlet=true,
    frictionAtOutlet=false,
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.QuadraticNominalPoint_L4,
    Delta_p_nom=2e5,
    m_flow_nom=275,
    h_start=linspace(
        2.21373e6,
        2.21525e6,
        ct.N_cv),
    p_start=linspace(
        290.2e5,
        287.43e5,
        ct.N_cv),
    initOption=0) annotation (Placement(transformation(
        extent={{-10,6},{10,-6}},
        rotation=-90,
        origin={338,202})));
  Basics.ControlVolumes.SolidVolumes.ThinWall_L4 evap_wall(
    diameter_i=evap.diameter_i,
    length=evap.length,
    N_tubes=evap.N_tubes,
    redeclare model Material = TILMedia.SolidTypes.TILMedia_Steel,
    N_ax=evap.N_cv,
    diameter_o=evap.diameter_i + 0.01,
    T_start=ones(evap_wall.N_ax)*(273.15 + 300),
    suppressChattering="True",
    stateLocation=3,
    initOption=203) annotation (Placement(transformation(
        extent={{-12,-4.00036},{12,4.00035}},
        rotation=90,
        origin={232,62})));
  Basics.ControlVolumes.SolidVolumes.ThinWall_L4 ct_wall(
    redeclare model Material = TILMedia.SolidTypes.TILMedia_Steel,
    stateLocation=3,
    N_ax=ct.N_cv,
    diameter_o=ct.diameter_i + 0.01,
    diameter_i=ct.diameter_i,
    length=ct.length,
    N_tubes=ct.N_tubes,
    T_start=ones(ct_wall.N_ax)*(273.15 + 395),
    suppressChattering="False",
    initOption=203) annotation (Placement(transformation(
        extent={{-12,-4.00036},{12,4.00035}},
        rotation=90,
        origin={292,202})));
  Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple oh_1(
    diameter_i=0.03,
    N_cv=4,
    redeclare model HeatTransfer =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4 (                      alpha_nom=10000),
    N_tubes=100,
    z_in=60,
    z_out=50,
    frictionAtInlet=true,
    frictionAtOutlet=false,
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.QuadraticNominalPoint_L4,
    length=300,
    Delta_p_nom=2e5,
    m_flow_nom=275,
    h_start=linspace(
        2.21525e6,
        3.3501e6,
        oh_1.N_cv),
    p_start=linspace(
        287.43e5,
        275.699e5,
        oh_1.N_cv),
    initOption=0) annotation (Placement(transformation(
        extent={{-10,6},{10,-6}},
        rotation=-90,
        origin={338,112})));
  Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple oh_2(
    diameter_i=0.03,
    N_cv=4,
    redeclare model HeatTransfer =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4 (                      alpha_nom=10000),
    N_tubes=150,
    z_in=60,
    z_out=70,
    frictionAtInlet=true,
    frictionAtOutlet=false,
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.QuadraticNominalPoint_L4,
    length=300,
    Delta_p_nom=2e5,
    m_flow_nom=275,
    h_start=linspace(
        3.3501e6,
        3.545e6,
        oh_2.N_cv),
    p_start=linspace(
        275.699e5,
        260e5,
        oh_2.N_cv),
    initOption=0) annotation (Placement(transformation(
        extent={{10,6},{-10,-6}},
        rotation=-90,
        origin={398,158})));
  Basics.ControlVolumes.SolidVolumes.ThinWall_L4 oh_1_wall(
    redeclare model Material = TILMedia.SolidTypes.TILMedia_Steel,
    stateLocation=3,
    N_ax=oh_1.N_cv,
    diameter_o=oh_1.diameter_i + 0.01,
    diameter_i=oh_1.diameter_i,
    length=oh_1.length,
    N_tubes=oh_1.N_tubes,
    T_start=ones(oh_1_wall.N_ax)*(273.15 + 330),
    suppressChattering="False",
    initOption=203) annotation (Placement(transformation(
        extent={{-12,-4.00036},{12,4.00034}},
        rotation=90,
        origin={292,112})));
  Basics.ControlVolumes.SolidVolumes.ThinWall_L4 oh_2_wall(
    redeclare model Material = TILMedia.SolidTypes.TILMedia_Steel,
    stateLocation=3,
    N_ax=oh_2.N_cv,
    diameter_o=oh_2.diameter_i + 0.01,
    diameter_i=oh_2.diameter_i,
    length=oh_2.length,
    N_tubes=oh_2.N_tubes,
    T_start=ones(oh_2_wall.N_ax)*(273.15 + 400),
    suppressChattering="False",
    initOption=203) annotation (Placement(transformation(
        extent={{-12,-3.99984},{12,3.99984}},
        rotation=90,
        origin={292,158})));
  Components.Adapters.Scalar2VectorHeatPort scalar2VectorHeatPort2(
    length=oh_1.length,
    N=oh_1.N_cv,
    Delta_x=ClaRa.Basics.Functions.GenerateGrid(
        {0,0},
        oh_1.length,
        oh_1.N_cv)) annotation (Placement(transformation(extent={{220,102},{240,122}})));
  Components.Adapters.Scalar2VectorHeatPort scalar2VectorHeatPort3(
    length=100,
    N=4,
    Delta_x=ClaRa.Basics.Functions.GenerateGrid(
        {0,0},
        100,
        4)) annotation (Placement(transformation(extent={{220,148},{240,168}})));
  Components.Furnace.FlameRoom.FlameRoomWithTubeBundle_L2_Dynamic flameRoom_eco(
    redeclare model HeatTransfer_Top =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Adiabat_L2,
    xi_start_flueGas_out={0.01,0,0.25,0,0.7,0,0,0.04,0},
    redeclare model ReactionZone =
        ClaRa.Components.Furnace.ChemicalReactions.CoalReactionZone,
    redeclare model HeatTransfer_Wall =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.CharLine_L2 (
         alpha_nom=20),
    m_flow_nom=342,
    redeclare model HeatTransfer_CarrierTubes =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L2 (
         alpha_nom=30),
    redeclare model Geometry =
        ClaRa.Basics.ControlVolumes.Fundamentals.Geometry.HollowBlockWithTubesAndCarrierTubes (
        width=10,
        length=10,
        diameter_t=0.04,
        Delta_z_par=0.13,
        Delta_z_ort=0.11,
        N_rows=40,
        N_tubes=4000,
        height=5),
    redeclare model HeatTransfer_TubeBundle =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Gas_HT.Convection.Convection_tubeBank_L2 (
         CF_fouling=0.95),
    T_start_flueGas_out=390)
    annotation (Placement(transformation(extent={{28,204},{88,224}})));

  Components.VolumesValvesFittings.Pipes.PipeFlowVLE_L4_Simple eco(
    N_cv=7,
    diameter_i=0.03,
    redeclare model HeatTransfer =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L4 (                      alpha_nom=20000),
    N_tubes=150,
    z_in=80,
    z_out=70,
    frictionAtInlet=false,
    frictionAtOutlet=false,
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.VLE_PL.QuadraticNominalPoint_L4,
    length=300,
    Delta_p_nom=2e5,
    m_flow_nom=275,
    h_start=linspace(
        99766,
        697563,
        eco.N_cv),
    p_start=linspace(
        297.3e5,
        296.9e5,
        eco.N_cv),
    initOption=0) annotation (Placement(transformation(
        extent={{-10,-6},{10,6}},
        rotation=90,
        origin={266,-20})));
  Basics.ControlVolumes.SolidVolumes.ThinWall_L4 eco_wall(
    redeclare model Material = TILMedia.SolidTypes.TILMedia_Steel,
    N_ax=eco.N_cv,
    diameter_o=eco.diameter_i + 0.01,
    diameter_i=eco.diameter_i,
    length=eco.length,
    N_tubes=eco.N_tubes,
    T_start=ones(eco_wall.N_ax)*(273.15 + 280),
    stateLocation=3,
    suppressChattering="False",
    initOption=203) annotation (Placement(transformation(
        extent={{-12,-3.99985},{12,3.99985}},
        rotation=90,
        origin={232,-20})));
  Components.Adapters.Scalar2VectorHeatPort scalar2VectorHeatPort4(
    length=eco.length,
    N=eco.N_cv,
    Delta_x=ClaRa.Basics.Functions.GenerateGrid(
        {0,0},
        eco.length,
        eco.N_cv)) annotation (Placement(transformation(extent={{192,-30},{212,-10}})));
  Components.Sensors.SensorVLE_L1_T oh_T annotation (Placement(transformation(extent={{404,180},{424,202}})));
  Components.Utilities.Blocks.LimPID PID_lambda(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni=0.90,
    y_max=600,
    y_min=100,
    y_start=28*10.396,
    sign=1,
    u_ref=1.12,
    y_ref=28*10.369,
    k=1,
    y_inactive=28*10.369,
    t_activation=0,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    Tau_i=1)
    annotation (Placement(transformation(extent={{-314,186},{-294,166}})));
  Modelica.Blocks.Sources.RealExpression actual_lambda(y=burner1.lambdaComb_primary) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-356,206})));
  Modelica.Blocks.Sources.Ramp lambda(
    offset=1.12,
    duration=1000,
    startTime=4000,
    height=0.03)
    annotation (Placement(transformation(extent={{-366,166},{-346,186}})));
  Modelica.Blocks.Sources.Ramp coalMassFlow(
    offset=15,
    startTime=4000,
    duration=1000,
    height=-0.03*15)
    annotation (Placement(transformation(extent={{-194,36},{-174,56}})));
  Components.Mills.HardCoalMills.VerticalMill_L3 mill(initOption=1) annotation (Placement(transformation(extent={{-12,-6},{8,14}})));
  Components.Mills.HardCoalMills.VerticalMill_L3 mill1(initOption=1) annotation (Placement(transformation(extent={{-34,24},{-14,44}})));
  Components.BoundaryConditions.BoundaryGas_pTxi
    flueGasPressureSink2(p_const=101300)
    annotation (Placement(transformation(extent={{-172,160},{-192,180}})));
  Components.BoundaryConditions.BoundaryGas_Txim_flow
                                                fluelGasFlowSource4(
    variable_T=false,
    variable_xi=false,
    xi_const={0,0,0.0005,0,0.7581,0.2314,0,0,0.01},
    m_flow_const=291,
    variable_m_flow=true,
    T_const=313.15) annotation (Placement(transformation(extent={{-264,160},{-244,180}})));
  Components.HeatExchangers.RegenerativeAirPreheater_L4 regenerativeAirPreheater(
    s_sp=0.6e-3,
    redeclare model Material = TILMedia.SolidTypes.TILMedia_St35_8,
    A_flueGas=0.45*(regenerativeAirPreheater.A_cross - regenerativeAirPreheater.A_hub),
    A_air=0.45*(regenerativeAirPreheater.A_cross - regenerativeAirPreheater.A_hub),
    diameter_reg=10,
    height_reg=3,
    N_sp=1000,
    N_cv=10,
    Delta_p_flueGas_nom=1000,
    Delta_p_freshAir_nom=1000,
    m_flow_freshAir_nom=291,
    m_flow_flueGas_nom=341,
    xi_start_flueGas={0.01,0,0.25,0,0.7,0,0,0.04,0},
    xi_start_freshAir={0,0,0.0005,0,0.7581,0.2314,0,0,0.01},
    T_start_wall={385,675},
    T_start_flueGas={677,398},
    T_start_freshAir={376,673},
    p_start_flueGas={100002,99000},
    frictionAtFlueGasInlet=false,
    frictionAtFlueGasOutlet=false,
    frictionAtFreshAirInlet=false,
    frictionAtFreshAirOutlet=true,
    p_start_freshAir={142169,141311},
    redeclare model PressureLoss =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.Generic_PL.LinearPressureLoss_L4)         annotation (Placement(transformation(extent={{-226,154},{-206,174}})));

  Components.VolumesValvesFittings.Fittings.FlueGasJunction_L2
    flueGasJunction1(
    volume=1,
    portA(m_flow(fixed=false)),
    portB(m_flow(fixed=false)),
    mixingRatio_initial={0,0,0.0005,0,0.7581,0.2314,0,0,0.01},
    T_start=273.15 + 40,
    p_start=1.4e5)                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-216,130})));
  Components.VolumesValvesFittings.Valves.ValveGas_L1     flueGasValve_L1_1(
      redeclare model PressureLoss =
        ClaRa.Components.VolumesValvesFittings.Valves.Fundamentals.LinearNominalPoint (
         Delta_p_nom=1000, m_flow_nom=200))
    annotation (Placement(transformation(extent={{-160,124},{-140,138}})));

  Components.VolumesValvesFittings.Valves.ValveGas_L1     flueGasValve_L1_2(
      redeclare model PressureLoss =
        ClaRa.Components.VolumesValvesFittings.Valves.Fundamentals.LinearNominalPoint (
         Delta_p_nom=1000, m_flow_nom=200))
    annotation (Placement(transformation(extent={{-160,94},{-140,108}})));

  Components.TurboMachines.Turbines.SteamTurbineVLE_L1 turbine(
    eta_mech=0.9,
    rho_nom=98,
    Pi=0.04/260,
    m_flow_nom=275,
    p_nom=26000000,
    p_in_start=260e5,
    p_out_start=0.04e5)
    annotation (Placement(transformation(extent={{502,110},{516,138}})));
  Components.HeatExchangers.HEXvle_L3_2ph_BU condenser(
    width=5,
    showExpertSummary=true,
    z_in_shell=6,
    level_rel_start=0.6/6,
    width_hotwell=5,
    length_hotwell=5,
    height=5,
    length=15,
    h_liq_start=-10 + TILMedia.VLEFluidFunctions.dewSpecificEnthalpy_pxi(condenser.medium_shell, condenser.p_start_shell),
    h_vap_start=-3000 + TILMedia.VLEFluidFunctions.dewSpecificEnthalpy_pxi(condenser.medium_shell, condenser.p_start_shell),
    p_start_shell=0.04e5,
    p_nom_shell=4000,
    redeclare model PressureLossShell =
        ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.Generic_PL.LinearParallelZones_L3,
    N_tubes=1500,
    Tau_evap=0.5,
    alpha_ph=5000,
    redeclare model HeatTransfer_Shell =
        ClaRa.Basics.ControlVolumes.Fundamentals.HeatTransport.Generic_HT.Constant_L3 (                      alpha_nom={10000,20000}),
    m_flow_nom_shell=375,
    Tau_cond=0.3,
    A_phaseBorder=100,
    z_out_shell=0,
    absorbInflow=1,
    z_in_aux2=1,
    z_in_aux1=1,
    initOptionShell=211) annotation (Placement(transformation(
        extent={{-10,-11.5},{10,11.5}},
        rotation=0,
        origin={516,41.5})));
  Components.Sensors.SensorVLE_L1_p vlePressureSensor annotation (Placement(transformation(extent={{530,82},{550,102}})));
  Components.Utilities.Blocks.LimPID       PI_CondPressure(
    Tau_d=1,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    perUnitConversion=true,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    u_ref=4000,
    Tau_add=0.01,
    sign=1,
    y_max=-100e3,
    y_min=-2e9,
    k=2,
    y_ref=5.9e8,
    y_inactive=-5.9e8,
    y_start=-5.9e8,
    t_activation=0,
    Tau_i=200)    annotation (Placement(transformation(extent={{580,114},{600,134}})));
  Modelica.Blocks.Sources.Constant const500degC2(k=5000)
    annotation (Placement(transformation(extent={{546,114},{566,134}})));
  Components.Utilities.Blocks.LimPID       PI_Pump_FW(
    Tau_d=1,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    perUnitConversion=true,
    initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    sign=-1,
    t_activation=0,
    Tau_add=1,
    y_inactive=0.7e7,
    y_start=0.7e7,
    u_ref=487 + 273.15,
    y_max=7e8,
    y_ref=5e7,
    y_min=5e6,
    Tau_i=100,
    k=20)
    annotation (Placement(transformation(extent={{456,32},{436,12}})));
  Modelica.Blocks.Sources.Constant const500degC(k=508 + 273.15)
    annotation (Placement(transformation(extent={{488,12},{468,32}})));
  Modelica.Blocks.Sources.RealExpression classifierSpeed1(y=1.50) annotation (Placement(transformation(extent={{-64,94},{-38,112}})));
  Components.TurboMachines.Pumps.PumpVLE_L1_simple pump(Delta_p_eps=100, eta_mech=0.9) annotation (Placement(transformation(extent={{402,-66},{378,-42}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation (Placement(transformation(extent={{566,32},{546,52}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0.7e7) annotation (Placement(transformation(extent={{422,12},{402,32}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0.661,0.0383,0.066,0.016,0.0057,0.135; 2000,0.661,0.0383,0.066,0.016,0.0057,0.135; 2100,0.68,0.04,0.05,0.01,0.0057,0.13; 3000,0.68,0.04,0.05,0.01,0.0057,0.13]) annotation (Placement(transformation(extent={{-194,0},{-174,20}})));
  Visualisation.StatePoint_phTs statePoint_phTs(stateViewerIndex=1) annotation (Placement(transformation(extent={{420,-54},{460,-10}})));
  Visualisation.StatePoint_phTs statePoint_phTs1(stateViewerIndex=2) annotation (Placement(transformation(extent={{340,-54},{380,-10}})));
  Visualisation.StatePoint_phTs statePoint_phTs2(stateViewerIndex=3) annotation (Placement(transformation(extent={{266,226},{306,270}})));
  Visualisation.StatePoint_phTs statePoint_phTs3(stateViewerIndex=4) annotation (Placement(transformation(extent={{398,224},{438,268}})));
  Visualisation.StatePoint_phTs statePoint_phTs4(stateViewerIndex=5) annotation (Placement(transformation(extent={{460,72},{500,116}})));
  Visualisation.QuadrupleGas quadrupleGas1(
    value1=1,
    value2=2,
    value3=11,
    value4=4) annotation (Placement(transformation(extent={{16,210},{-38,234}})));
  Visualisation.QuadrupleGas quadrupleGas2(
    value1=1,
    value2=2,
    value3=3,
    value4=6) annotation (Placement(transformation(extent={{14,118},{-40,142}})));
  Regression regression(
    m_flow_flueGas_eco_out = flameRoom_eco.outlet.flueGas.m_flow,
    m_flow_coal_in_burner2 = burner2.fuelFlueGas_inlet.fuel.m_flow,
    T_eco_out = flameRoom_eco.outlet.flueGas.T_outflow,
    Q_flow_oh2 = oh_2_wall.innerPhase[1].Q_flow,
    T_flueGas_in = inStream(burner2.fuelFlueGas_inlet.flueGas.T_outflow),
    h_oh_out = oh_1.outlet.h_outflow,
    V_flow_pump = pump.summary.outline.V_flow,
    p_turbine_in = turbine.summary.inlet.p,
    T_turbine_in = turbine.summary.inlet.T,
    level_condenser = condenser.summary.outline.absLevel,
    m_flow_eco_out = eco.outlet.m_flow) annotation (Placement(transformation(extent={{442,360},
            {462,380}})));

equation
  connect(burner1.heat_bottom, hopper.heat_top) annotation (Line(
      points={{60,-6},{60,-20}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hopper.heat_bottom, fixedTemperatureBottom.port)  annotation (Line(
      points={{60,-40},{60,-66},{92,-66}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(burner2.heat_top,flameRoom_1. heat_bottom)
    annotation (Line(
      points={{60,44},{60,52}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_1.heat_top,flameRoom_2. heat_bottom)
    annotation (Line(
      points={{60,72},{60,82}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_2.heat_top,flameRoom_oh_1. heat_bottom)      annotation (
      Line(
      points={{60,102},{60,112}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_1.heat_top,flameRoom_oh_2. heat_bottom)
    annotation (Line(
      points={{60,132},{60,158}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(burner1.heat_top, burner2.heat_bottom)
                                                annotation (Line(
      points={{60,14},{60,24}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(evap_wall.innerPhase,evap. heat) annotation (Line(
      points={{236,62},{261.2,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hopper.heat_wall, evap_wall.outerPhase[1])  annotation (Line(
      points={{88,-30},{158,-30},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(burner1.heat_wall, evap_wall.outerPhase[2])
                                                     annotation (Line(
      points={{88,4},{158,4},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(burner2.heat_wall,evap_wall. outerPhase[3]) annotation (Line(
      points={{88,34},{158,34},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_1.heat_wall,evap_wall. outerPhase[4])
    annotation (Line(
      points={{88,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_2.heat_wall,evap_wall. outerPhase[5]) annotation (Line(
      points={{88,92},{158,92},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_1.heat_wall,evap_wall. outerPhase[6])      annotation (
      Line(
      points={{88,122},{158,122},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_2.heat_wall,evap_wall. outerPhase[7])       annotation (
      Line(
      points={{88,168},{158,168},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ct_wall.innerPhase,ct. heat) annotation (Line(
      points={{296,202},{333.2,202}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(scalar2VectorHeatPort2.heatVector,oh_1_wall. outerPhase) annotation (
      Line(
      points={{240,112},{288,112}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(oh_1_wall.innerPhase,oh_1. heat) annotation (Line(
      points={{296,112},{333.2,112}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_1.heat_TubeBundle,scalar2VectorHeatPort2. heatScalar)
    annotation (Line(
      points={{78,112},{220,112}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_2.heat_TubeBundle,scalar2VectorHeatPort3. heatScalar)
    annotation (Line(
      points={{78,158},{220,158}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(scalar2VectorHeatPort3.heatVector,oh_2_wall. outerPhase)
                                                                  annotation (
      Line(
      points={{240,158},{288,158}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(oh_2_wall.innerPhase,oh_2. heat)
                                         annotation (Line(
      points={{296,158},{393.2,158}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_2.heat_top,flameRoom_eco. heat_bottom)
    annotation (Line(
      points={{60,178},{60,204}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_eco.heat_top,fixedTemperatureTop. port)        annotation (
      Line(
      points={{60,224},{60,274},{106,274}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_eco.heat_TubeBundle,scalar2VectorHeatPort4. heatScalar)
    annotation (Line(
      points={{78,204},{138,204},{138,-20},{192,-20}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(scalar2VectorHeatPort4.heatVector,eco_wall. outerPhase) annotation (
      Line(
      points={{212,-20},{228,-20}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(eco_wall.innerPhase,eco. heat) annotation (Line(
      points={{236,-20},{261.2,-20}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_eco.heat_wall,evap_wall. outerPhase[8])        annotation (
      Line(
      points={{88,214},{158,214},{158,62},{228,62}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(PID_lambda.u_m,actual_lambda. y) annotation (Line(
      points={{-303.9,188},{-303.9,206},{-345,206}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(flameRoom_eco.heat_CarrierTubes, ct_wall.outerPhase[1]) annotation (
      Line(
      points={{78,224},{176,224},{176,202},{288,202}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_2.heat_CarrierTubes, ct_wall.outerPhase[2]) annotation (
      Line(
      points={{78,178},{176,178},{176,202},{288,202}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_1.heat_CarrierTubes, ct_wall.outerPhase[3]) annotation (
      Line(
      points={{78,132},{176,132},{176,202},{288,202}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(evap.inlet, eco.outlet) annotation (Line(
      points={{266,52},{266,-10}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ct.inlet, evap.outlet) annotation (Line(
      points={{338,212},{338,226},{266,226},{266,72}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(oh_1.inlet, ct.outlet) annotation (Line(
      points={{338,122},{338,192}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(oh_2.inlet, oh_1.outlet) annotation (Line(
      points={{398,148},{398,80},{338,80},{338,102}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalSlagFlueGas_split_top.fuelSlagFlueGas_inlet, flameRoom_eco.outlet) annotation (Line(
      points={{42,236},{42,224}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_eco.inlet, flameRoom_oh_2.outlet) annotation (Line(
      points={{42,204},{42,178}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_2.inlet, flameRoom_oh_1.outlet) annotation (Line(
      points={{42,158},{42,132}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_oh_1.inlet, flameRoom_2.outlet) annotation (Line(
      points={{42,112},{42,102}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_2.inlet, flameRoom_1.outlet) annotation (Line(
      points={{42,82},{42,72}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flameRoom_1.inlet, burner2.outlet) annotation (Line(
      points={{42,52},{42,44}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hopper.inlet,coalSlagFlueGas_join.fuelSlagFlueGas_outlet)
    annotation (Line(
      points={{42,-40},{42,-60}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(hopper.outlet, burner1.inlet) annotation (Line(
      points={{42,-20},{42,-6}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(burner1.outlet, burner2.inlet) annotation (Line(
      points={{42,14},{42,24}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalGas_join_burner2.fuelFlueGas_outlet, flameRoom_1.fuelFlueGas_inlet) annotation (Line(
      points={{-46,62},{28,62}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(mill1.outlet, burner2.fuelFlueGas_inlet) annotation (Line(
      points={{-14,34},{28,34}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(mill.outlet, burner1.fuelFlueGas_inlet) annotation (Line(
      points={{8,4},{28,4}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalGas_join_burner1.fuelFlueGas_outlet, mill1.inlet) annotation (Line(
      points={{-46,34},{-34,34}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalGas_join_burner.fuelFlueGas_outlet, mill.inlet) annotation (Line(
      points={{-46,4},{-12,4}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flueGasValve_L1_1.outlet, coalGas_join_burner1.flueGas_inlet)
    annotation (Line(
      points={{-140,129.833},{-80,129.833},{-80,28},{-66,28}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flueGasValve_L1_2.outlet, coalGas_join_burner.flueGas_inlet)
    annotation (Line(
      points={{-140,99.8333},{-96,99.8333},{-96,-2},{-66,-2}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalFlowSource.fuel_a,coalGas_join_burner.fuel_inlet)  annotation (
      Line(
      points={{-120,10},{-66,10}},
      color={27,36,42},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalFlowSource1.fuel_a,coalGas_join_burner1.fuel_inlet)  annotation (
      Line(
      points={{-120,40},{-66,40}},
      color={27,36,42},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalFlowSource2.fuel_a,coalGas_join_burner2.fuel_inlet)  annotation (
      Line(
      points={{-120,68},{-66,68}},
      color={27,36,42},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(flueGasJunction1.portB, flueGasValve_L1_1.inlet) annotation (Line(
      points={{-206,130},{-174,130},{-174,129.833},{-160,129.833}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));

  connect(flueGasJunction1.portC, flueGasValve_L1_2.inlet) annotation (Line(
      points={{-216,120},{-216,100},{-160,100},{-160,99.8333}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fluelGasFlowSource4.gas_a, regenerativeAirPreheater.freshAirInlet)
    annotation (Line(
      points={{-244,170},{-226,170}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(flueGasPressureSink2.gas_a, regenerativeAirPreheater.flueGasOutlet)
    annotation (Line(
      points={{-192,170},{-206,170}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slagFlowSource_top.slag_outlet, coalSlagFlueGas_split_top.slag_inlet) annotation (Line(
      points={{42,286},{42,256}},
      color={234,171,0},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalSink_top.fuel_a, coalSlagFlueGas_split_top.fuel_outlet) annotation (Line(
      points={{18,288},{18,282},{36,282},{36,256}},
      color={27,36,42},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalSlagFlueGas_join.fuel_inlet,coalFlowSource_bottom.fuel_a)
    annotation (Line(
      points={{36,-80},{36,-90},{22,-90},{22,-100}},
      color={27,36,42},
      thickness=0.5,
      smooth=Smooth.None));
  connect(slaglSink_bottom.slag_inlet, coalSlagFlueGas_join.slag_outlet)
    annotation (Line(
      points={{42.2,-100},{42.2,-90},{42,-90},{42,-80}},
      color={234,171,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(coalSlagFlueGas_join.flueGas_inlet, fluelGasFlowSource_bottom.gas_a)
    annotation (Line(
      points={{48,-80},{48,-90},{62,-90},{62,-98}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(fluelGasFlowSource2.gas_a, coalGas_join_burner2.flueGas_inlet)
    annotation (Line(
      points={{-102,56},{-66,56}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(regenerativeAirPreheater.flueGasInlet, coalSlagFlueGas_split_top.flueGas_outlet) annotation (Line(
      points={{-206,158},{-48,158},{-48,342},{64,342},{64,282},{48,282},{48,256}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(regenerativeAirPreheater.freshAirOutlet, flueGasJunction1.portA)
    annotation (Line(
      points={{-226,158},{-238,158},{-238,130},{-226,130}},
      color={118,106,98},
      thickness=0.5,
      smooth=Smooth.None));
  connect(PID_lambda.y, fluelGasFlowSource4.m_flow) annotation (Line(
      points={{-293,176},{-264,176}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(vlePressureSensor.p,PI_CondPressure. u_m) annotation (Line(
      points={{551,92},{590.1,92},{590.1,112}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const500degC2.y,PI_CondPressure. u_s) annotation (Line(
      points={{567,124},{578,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(turbine.inlet, oh_2.outlet) annotation (Line(
      points={{502,132.4},{502,224},{398,224},{398,168}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(const500degC.y,PI_Pump_FW. u_s)   annotation (Line(
      points={{467,22},{458,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.outlet, eco.inlet) annotation (Line(
      points={{378,-54},{266,-54},{266,-30}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(turbine.outlet, condenser.inlet) annotation (Line(
      points={{516,110},{516,53}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(vlePressureSensor.port, condenser.inlet) annotation (Line(
      points={{540,82},{540,72},{516,72},{516,53}},
      color={0,131,169},
      thickness=0.5,
      smooth=Smooth.None));
  connect(condenser.outlet, pump.inlet) annotation (Line(
      points={{516,30},{516,-54},{402,-54}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(prescribedHeatFlow.Q_flow, PI_CondPressure.y) annotation (Line(
      points={{566,42},{616,42},{616,124},{601,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(oh_2.outlet, oh_T.port) annotation (Line(
      points={{398,168},{398,180},{414,180}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5,
      smooth=Smooth.None));
  connect(PI_Pump_FW.u_m, oh_T.T) annotation (Line(
      points={{445.9,34},{445.9,191},{425,191}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(classifierSpeed1.y, mill1.classifierSpeed) annotation (Line(
      points={{-36.7,103},{-24,103},{-24,44.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(classifierSpeed1.y, mill.classifierSpeed) annotation (Line(
      points={{-36.7,103},{-2,103},{-2,14.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(condenser.heat, prescribedHeatFlow.port) annotation (Line(
      points={{526,41.5},{538,41.5},{538,42},{546,42}},
      color={167,25,48},
      thickness=0.5,
      smooth=Smooth.None));
  connect(PI_Pump_FW.y, firstOrder.u) annotation (Line(
      points={{435,22},{424,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(firstOrder.y, pump.P_drive) annotation (Line(
      points={{401,22},{390,22},{390,-39.6},{390,-39.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lambda.y, PID_lambda.u_s) annotation (Line(
      points={{-345,176},{-316,176}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(coalMassFlow.y, coalFlowSource1.m_flow) annotation (Line(
      points={{-173,46},{-140,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(coalMassFlow.y, coalFlowSource.m_flow) annotation (Line(
      points={{-173,46},{-156,46},{-156,16},{-140,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y, coalFlowSource1.xi) annotation (Line(
      points={{-173,10},{-152,10},{-152,34},{-140,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTimeTable.y, coalFlowSource.xi) annotation (Line(
      points={{-173,10},{-152,10},{-152,4},{-140,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.inlet, statePoint_phTs.port) annotation (Line(
      points={{402,-54},{412,-54},{420,-54}},
      color={0,131,169},
      thickness=0.5));
  connect(statePoint_phTs1.port, pump.outlet) annotation (Line(
      points={{340,-54},{340,-54},{378,-54}},
      color={0,131,169},
      thickness=0.5));
  connect(evap.outlet, statePoint_phTs2.port) annotation (Line(
      points={{266,72},{266,164},{266,226}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(oh_2.outlet, statePoint_phTs3.port) annotation (Line(
      points={{398,168},{398,168},{398,224}},
      color={0,131,169},
      pattern=LinePattern.Solid,
      thickness=0.5));
  connect(statePoint_phTs4.port, turbine.outlet) annotation (Line(
      points={{460,72},{516,72},{516,74},{516,110}},
      color={0,131,169},
      thickness=0.5));
  connect(quadrupleGas1.eye, flameRoom_eco.eyeOut) annotation (Line(points={{16,222},{28,222},{28,222}}, color={190,190,190}));
  connect(quadrupleGas2.eye, flameRoom_2.eyeOut) annotation (Line(points={{14,130},{14,130},{20,130},{20,100},{28,100}}, color={190,190,190}));
  annotation (Diagram(coordinateSystem(extent={{-400,-160},{640,400}},
          preserveAspectRatio=false),graphics={
                                Text(
          extent={{-396,402},{-38,254}},
          lineColor={0,128,0},
          horizontalAlignment=TextAlignment.Left,
          fontSize=11,
          textString="________________________________________________________________
PURPOSE:
>> Basic model of a coal fired boiler with load change and a closed water steam cycle
________________________________________________________________
LOOK AT the following time plots:
>> Live steam temperature
>> Coal mass flow into the boiler
>> Air and flue gas temperatures at in and outlets of the air preheater
 ________________________________________________________________
NOTES
>> Excess air control for the burner stages
>> Boiler is designed exemplary
"),                             Text(
          extent={{-378,440},{280,400}},
          lineColor={0,128,0},
          fontSize=34,
          textString="TESTED -- 2015-01-27 //LN"),
        Rectangle(
          extent={{-400,400},{640,-162}},
          lineColor={115,150,0},
          lineThickness=0.5)}),                                          Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true)),
    experiment(
      StopTime=10000,
      __Dymola_NumberOfIntervals=1001,
      Tolerance=1e-005),
    __Dymola_experimentSetupOutput);
end ClosedLoopBoilerExample;

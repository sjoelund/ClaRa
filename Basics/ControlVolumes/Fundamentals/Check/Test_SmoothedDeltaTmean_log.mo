within ClaRa.Basics.ControlVolumes.Fundamentals.Check;
model Test_SmoothedDeltaTmean_log
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

  import SM = ClaRa.Basics.Functions.Stepsmoother;
  import SZT = ClaRa.Basics.Functions.SmoothZeroTransition;

  Real DT_wo=T_w - T_o.y;
  Real DT_wi= T_w -  T_i.y;
  Real T_w=200;
  Real T_i1= T_i.y;

  Real DTU=max(DT_wi, DT_wo);
  Real DTL=min(DT_wi, DT_wo);

  Real DT_mean_unsmooth "Logarithmic mean";
  Real DT_mean_smooth "Logarithmic mean - smoothed";
  Modelica.Blocks.Sources.Trapezoid T_o(
    rising=1,
    falling=1,
    startTime=5,
    nperiod=1,
    offset=150,
    amplitude=+100,
    period=20,
    width=5) annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Ramp T_i(
    duration=1,
    startTime=7,
    height=200,
    offset=100) annotation (Placement(transformation(extent={{-2,-18},{18,2}})));
equation

//   DT_mean = ClaRa.Basics.Functions.Stepsmoother(
//     100,
//     -100,
//     DT_wi*DT_wo)*noEvent(if abs(DT_wo) <= 1e-6 or abs(DT_wi) <= 1e-6 then 0 elseif (T_w < T_o.y and T_w > T_i1) or (T_w > T_o.y and T_w < T_i1) then 0 elseif abs(DT_wo - DT_wi) <= eps then DT_wi else (DTU - DTL)/log(DTU/DTL));

//     DT_mean_unsmooth = noEvent(if floor(abs(DT_wo)*1/eps) <= 1 or floor(abs(DT_wi)*1/eps) <= 1 then
//                                  0
//                                elseif (T_w < T_o.y and T_w > T_i.y) or (T_w > T_o.y and T_w < T_i.y) then
//                                  0
//                                elseif floor(abs(DT_wo - DT_wi)*1/eps) < 1 then
//                                  DTL
//                                else
//                                  (DTU - DTL)/log(DTU/(DTL+1e-6)));
    DT_mean_unsmooth = noEvent(
                             if floor(abs(DTU)*1/eps) <= 1 or floor(abs(DTL)*1/eps) <= 1 then
                               0
                             elseif (T_w < T_o.y and T_w > T_i.y) or (T_w > T_o.y and T_w < T_i.y) then
                               0
                             elseif floor(abs(DTU - DTL)*1/eps) < 1 then
                               DTL
                             else
                               (DTU - DTL)/log(DTU/(DTL)));

    DT_mean_smooth = SM(0.1,eps, abs(DTL))*SM(0.01,eps, DTU*DTL) * SZT((DTU - DTL)/log(abs(DTU)/(abs(DTL)+1e-9)), DT_wi, (abs(DTU)-abs(DTL))-0.01, 0.001);

     annotation (experiment(StopTime=20), __Dymola_experimentSetupOutput);
end Test_SmoothedDeltaTmean_log;

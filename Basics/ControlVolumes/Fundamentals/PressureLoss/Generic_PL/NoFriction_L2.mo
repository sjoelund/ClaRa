within ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.Generic_PL;
model NoFriction_L2 "All geo || No pressure loss due to friction"
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

  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.Generic_PL.PressureLoss_L2;
  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.TubeType_L2;
  extends ClaRa.Basics.ControlVolumes.Fundamentals.PressureLoss.ShellType_L2;

equation
  Delta_p = 0;
end NoFriction_L2;

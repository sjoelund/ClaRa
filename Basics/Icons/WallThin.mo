within ClaRa.Basics.Icons;
model WallThin
//___________________________________________________________________________//
// Component of the ClaRa library, version: 1.1.2                        //
//                                                                           //
// Licensed by the DYNCAP/DYNSTART research team under Modelica License 2.   //
// Copyright � 2013-2016, DYNCAP/DYNSTART research team.                     //
//___________________________________________________________________________//
// DYNCAP and DYNSTART are research projects supported by the German Federal //
// Ministry of Economic Affairs and Energy (FKZ 03ET2009/FKZ 03ET7060).      //
// The research team consists of the following project partners:             //
// Institute of Energy Systems (Hamburg University of Technology),           //
// Institute of Thermo-Fluid Dynamics (Hamburg University of Technology),    //
// TLK-Thermo GmbH (Braunschweig, Germany),                                  //
// XRG Simulation GmbH (Hamburg, Germany).                                   //
//___________________________________________________________________________//

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -50},{100,50}}),
                   graphics={Bitmap(
          extent={{-100,-50},{100,50}},
          imageSource=
              "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",
          fileName="modelica://ClaRa/figures/Components/WallThinSmall.png")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-50},{
            100,50}})));

end WallThin;

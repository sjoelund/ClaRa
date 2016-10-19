within ClaRa.Basics.Icons;
model WallThick
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
            -75},{100,75}}),
                   graphics={Bitmap(
          extent={{-100,-76},{100,76}},
          imageSource=
              "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",
          fileName="modelica://ClaRa/figures/Components/WallThick.png")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-75},{
            100,75}})));

end WallThick;

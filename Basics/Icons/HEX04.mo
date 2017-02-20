within ClaRa.Basics.Icons;
model HEX04
//___________________________________________________________________________//
// Component of the ClaRa library, version: 1.2.0                            //
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
            -100},{100,100}}),
                   graphics={Bitmap(
          extent={{-100,-100},{100,100}},
          imageSource=
              "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",
          fileName="modelica://ClaRa/figures/Components/Condenser.png")}));

end HEX04;

within ClaRa.Basics.Icons;
model Pipe_L1
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -50},{140,50}}),
                   graphics={Bitmap(
          extent={{-140,-50},{140,50}},
          imageSource=
              "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",
          fileName="modelica://ClaRa/figures/Components/Pipe_L1.png")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-50},{
            140,50}})));

end Pipe_L1;

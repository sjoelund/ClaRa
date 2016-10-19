within ClaRa.Basics.Icons;
model Hopper
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,
            -100},{300,100}}),
                   graphics={Bitmap(
          extent={{-300,-100},{300,100}},
          imageSource=
              "iVBORw0KGgoAAAANSUhEUgAABpAAAAIwCAIAAAAOEr9rAAAABmJLR0QA/wD/AP+gvaeTAAAgAElEQVR4nOzdaXSV5cH/+70TMGFGRAH1sUoFBZWqFbQUtPS4SrVoUbG0aIuCIwYiIRAFAglDNEDAMCoPoLRKS0WlSqV47OEoFB9FC4WqRVyKyKBlEAhDAtnJecFZffrvYFWSa99JPp93Vdi/vSy6Fl/u67rjZ5zbMQYAAAAARENKsr8AAAAAAPC/BDsAAAAAiBDBDgAAAAAiRLADAAAAgAgR7AAAAAAgQgQ7AAAAAIgQwQ4AAAAAIkSwAwAAAIAIEewAAAAAIEIEOwAAAACIEMEOAAAAACJEsAMAAACACBHsAAAAACBCBDsAAAAAiBDBDgAAAAAiRLADAAAAgAgR7AAAAAAgQgQ7AAAAAIgQwQ4AAAAAIkSwAwAAAIAIEewAAAAAIELqnfhHXPeD7192ySUn/jkAAAAAUKO9uW7dC7/93Ql+SBUEu/PPbdfjym4n/jkAAAAAUKMdLDn4QuxEg50jsQAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAAQIQIdgAAAAAQIYIdAAAAAESIYAcAAAAAESLYAQAAAECECHYAAAAAECGCHQAAAABEiGAHAAAAABEi2AEAAABAhAh2AAAAABAhgh0AAAAARIhgBwAAAAARItgBAAAA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",
          fileName="modelica://ClaRa/figures/Components/Hopper.png")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,-100},{
            300,100}})));

end Hopper;

within ClaRa.Basics.Icons;
model Efficiency

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics), Icon(graphics={Bitmap(
          extent={{-100,-100},{100,100}},
          imageSource=
              "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",
          fileName="modelica://ClaRa/figures/Components/Efficiency.png")}));

end Efficiency;

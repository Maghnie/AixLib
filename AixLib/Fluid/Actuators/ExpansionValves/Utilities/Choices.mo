within AixLib.Fluid.Actuators.ExpansionValves.Utilities;
package Choices "Types, constants to define menu choices"
  extends Modelica.Icons.Package;

  // Types describing calculation procedures of mass flow and pressure drop
  //

  // Types describing calculation procedures of flow coefficients
  //

  type CalcProc = enumeration(
      linear
      "Usage of linear behaviour: m_flow = A * f(dp)",
      nominal
      "Usage of nominal conditions: m_flow = (m_flow/dp)_nominal * f(dp)",
      flowCoefficient
      "Usage of flow coefficient: m_flow = C * f(dp)")
    "Enumeration to define calculation procedure of mass flow and pressure drop"
    annotation (Evaluate=true);
  type PolynomialModels = enumeration(
      ShanweiEtAl2005
      "ShanweiEtAl2005 - Function of area, pressures, subcooling and densities",
      Li2013
      "Li2013 - Function of opening degree and subcooling")
    "Enumeration to define polynomial models for calculating flow coefficient"
    annotation (Evaluate=true);
  type PowerModels = enumeration(
      ShanweiEtAl2005
      "ShanweiEtAl2005 - Function of area, pressures, subcooling and densities",
      ZhifangAndOu2008
      "ZhifangAndOu2008 - Function of geometry data and various media properties",
      Li2013
      "Li2013 - Function of opening degree and subcooling")
    "Enumeration to define power models for calculating flow coefficient"
    annotation (Evaluate=true);
  annotation (Documentation(revisions="<html>
  <ul>
    <li>
    October 9, 2017, by Mirko Engelpracht:<br/>
    First implementation (see <a href=\"https://github.com/RWTH-EBC/AixLib/issues/408\">issue 408</a>).
    </li>
  </ul>
  </html>", info="<html>
  <p>This package contains types and constants to define menue choices.</p>
  </html>"));
end Choices;

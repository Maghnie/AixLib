within AixLib.DataBase.WindowsDoors.ASHRAE140WithPanes;
record Default "Default ASHRAE140 double pane glazing"
  extends AixLib.DataBase.Walls.WallBaseDataDefinition(
    n(min=1) = 1 "Number of wall layers",
    d={0.003175} "Thickness of wall layers",
    rho={2.5} "Density of wall layers",
    lambda={1.06} "Thermal conductivity of wall layers",
    c={750} "Specific heat capacity of wall layers",
    eps=0.5 "DUMMY FOR WINDOWS. Emissivity of inner wall surface");

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Default;

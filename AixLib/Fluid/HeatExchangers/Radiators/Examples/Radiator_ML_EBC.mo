within AixLib.Fluid.HeatExchangers.Radiators.Examples;
model Radiator_ML_EBC "Example for EBC radiator"
  extends Modelica.Icons.Example;
  package Medium = AixLib.Media.Water "Medium model";
  Sources.MassFlowSource_T source(redeclare package Medium = Medium,
    nPorts=1,
    m_flow=0.02761,
    T=328.15) annotation (Placement(transformation(extent={{-70,-8},{-50,12}})));
  Sources.FixedBoundary sink(redeclare package Medium = Medium,
  nPorts=1)
    annotation (Placement(transformation(extent={{98,-10},{78,10}})));
  Radiators.Radiator_ML_EBC radiator_ML_EBC(redeclare package Medium = Medium,m_flow_nominal=1,
    calc_dT=AixLib.Fluid.HeatExchangers.Radiators.BaseClasses.Calc_Excess_Temp.exp,
    selectable=true,
    radiatorType=DataBase.Radiators.RadiatorMLBaseDataDefinition(
        NominalPower=496,
        RT_nom={55,45,20},
        PressureDrop=1017878,
        Exponent=1.2776,
        VolumeWater=3.6,
        MassSteel=17.01,
        length=2.6,
        height=0.3))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  FixedResistances.FixedResistanceDpM res(redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=100000)
    annotation (Placement(transformation(extent={{46,-10},{66,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature convTemp(T=293.15)
    annotation (Placement(transformation(extent={{-30,42},{-10,62}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature radTemp(T=293.15)
    annotation (Placement(transformation(extent={{30,42},{10,62}})));
equation
  connect(radiator_ML_EBC.port_b, res.port_a)
    annotation (Line(points={{10,0},{46,0}},        color={0,127,255}));
  connect(res.port_b, sink.ports[1])
    annotation (Line(points={{66,0},{66,0},{78,0}}, color={0,127,255}));
  connect(radTemp.port, radiator_ML_EBC.RadiativeHeat)
    annotation (Line(points={{10,52},{8,52},{8,2},{4,2}}, color={191,0,0}));
  connect(convTemp.port, radiator_ML_EBC.ConvectiveHeat) annotation (Line(
        points={{-10,52},{-6,52},{-6,2},{-2,2}}, color={191,0,0}));
  connect(source.ports[1], radiator_ML_EBC.port_a)
    annotation (Line(points={{-50,2},{-50,0},{-10,0}}, color={0,127,255}));
end Radiator_ML_EBC;

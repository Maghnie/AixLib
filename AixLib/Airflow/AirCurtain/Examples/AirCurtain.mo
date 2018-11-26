within AixLib.Airflow.AirCurtain.Examples;
model AirCurtain
  "This model is an example for the use of an air curtain in the low order model"
  extends Modelica.Icons.Example;




  AirCurtainSimplified                    airCurtainSimplyfied(
    VolumeFlowAirCurtain=5,
    TemperatureAdditionAirCurtain=5,
    eta_air_curtain=0.73,
    PowerAirCurtain=50000,
    TemperatureThreshold=287.15)
    annotation (Placement(transformation(extent={{-14,-12},{20,20}})));
  ThermalZones.HighOrder.Components.DryAir.Airload airload
    annotation (Placement(transformation(extent={{62,-8},{82,12}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    calTSky=AixLib.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    computeWetBulbTemperature=false,
    filNam=Modelica.Utilities.Files.loadResource(
        "modelica://AixLib/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    "Weather data reader"
    annotation (Placement(transformation(extent={{-100,62},{-80,82}})));

  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1,
    width=50,
    period=86400,
    offset=0,
    startTime=25200)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
equation
  connect(airCurtainSimplyfied.port_b, airload.port)
    annotation (Line(points={{20,2.54545},{40,2.54545},{40,0},{63,0}},
                                             color={191,0,0}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-80,72},{-72,72},{-72,0},{-64,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus.TDryBul, airCurtainSimplyfied.T_ambient) annotation (Line(
      points={{-64,0},{-38,0},{-38,-6.18182},{-15.2364,-6.18182}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(pulse.y, airCurtainSimplyfied.schedule) annotation (Line(points={{-39,
          50},{-24,50},{-24,14.1818},{-15.2364,14.1818}}, color={0,0,127}));
  annotation (experiment(StopTime=1209600, Interval=3600));
end AirCurtain;

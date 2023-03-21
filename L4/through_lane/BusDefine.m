% EgoLocation = struct();
Ego = Simulink.Bus;

x = Simulink.BusElement;
x.Name = 'x';
x.Dimensions = 1;
x.DimensionsMode = 'Fixed';
x.DataType = 'double';
x.SampleTime = -1;
x.Complexity = 'real';
 
y = Simulink.BusElement;
y.Name = 'y';
y.Dimensions = 1;
y.DimensionsMode = 'Fixed';
y.DataType = 'double';
y.SampleTime = -1;
y.Complexity = 'real';

a = Simulink.BusElement;
a.Name = 'a';
a.Dimensions = 1;
a.DimensionsMode = 'Fixed';
a.DataType = 'double';
a.SampleTime = -1;
a.Complexity = 'real';

speed = Simulink.BusElement;
speed.Name = 'speed';
speed.Dimensions = 1;
yawrate.DimensionsMode = 'Fixed';
speed.DataType = 'double';
speed.SampleTime = -1;
speed.Complexity = 'real';

Ego.Elements = [x y a speed];


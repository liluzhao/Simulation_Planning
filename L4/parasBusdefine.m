% EgoLocation = struct();
EgoLocation = Simulink.Bus;
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

heading = Simulink.BusElement;
heading.Name = 'heading';
heading.Dimensions = 1;
heading.DimensionsMode = 'Fixed';
heading.DataType = 'double';
heading.SampleTime = -1;
heading.Complexity = 'real';
 
vx = Simulink.BusElement;
vx.Name = 'vx';
vx.Dimensions = 1;
vx.DimensionsMode = 'Fixed';
vx.DataType = 'double';
vx.SampleTime = -1;
vx.Complexity = 'real';

vy = Simulink.BusElement;
vy.Name = 'vy';
vy.Dimensions = 1;
vy.DimensionsMode = 'Fixed';
vy.DataType = 'double';
vy.SampleTime = -1;
vy.Complexity = 'real';

ax = Simulink.BusElement;
ax.Name = 'ax';
ax.Dimensions = 1;
ax.DimensionsMode = 'Fixed';
ax.DataType = 'double';
ax.SampleTime = -1;
ax.Complexity = 'real';

ay = Simulink.BusElement;
ay.Name = 'ay';
ay.Dimensions = 1;
ay.DimensionsMode = 'Fixed';
ay.DataType = 'double';
ay.SampleTime = -1;
ay.Complexity = 'real';

yawrate = Simulink.BusElement;
yawrate.Name = 'yawrate';
yawrate.Dimensions = 1;
yawrate.DimensionsMode = 'Fixed';
yawrate.DataType = 'double';
yawrate.SampleTime = -1;
yawrate.Complexity = 'real';

speed = Simulink.BusElement;
speed.Name = 'speed';
speed.Dimensions = 1;
yawrate.DimensionsMode = 'Fixed';
speed.DataType = 'double';
speed.SampleTime = -1;
speed.Complexity = 'real';

EgoLocation.Elements = [x y heading vx vy ax ay yawrate speed];

%% object
object = Simulink.Bus;
type = Simulink.BusElement;
type.Name = 'type';
type.Dimensions = 1;
type.DimensionsMode = 'Fixed';
type.DataType = 'uint8';
type.SampleTime = -1;
type.Complexity = 'real';

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

heading = Simulink.BusElement;
heading.Name = 'heading';
heading.Dimensions = 1;
heading.DimensionsMode = 'Fixed';
heading.DataType = 'double';
heading.SampleTime = -1;
heading.Complexity = 'real';

v = Simulink.BusElement;
v.Name = 'v';
v.Dimensions = 1;
v.DimensionsMode = 'Fixed';
v.DataType = 'double';
v.SampleTime = -1;
v.Complexity = 'real';
object.Elements = [type x y heading v];















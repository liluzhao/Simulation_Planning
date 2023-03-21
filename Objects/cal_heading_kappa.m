function [path_heading,path_kappa] = cal_heading_kappa(path_x,path_y)
%该函数将计算path的切线方向与x轴的夹角和曲率
%输入：path_x,y路径坐标
%输出：path heading kappa 路径的heading和曲率
%原理 heading = arctan(dy/dx);
%     kappa = dheading/ds;
%     ds = (dx^2 + dy^2)^0.5

%注意，角度的多值性会带来很大的麻烦，需要慎重处理
%例，x 与 x + 2pi往往代表同一个角度，这种多值性在计算曲率会带来麻烦
%比如 原本是(0.1 - (-0.1))/ds，但如果计算出的-0.1多了一个2pi
%kappa就等于(0.1 - (-0.1 + 2*pi))/ds，曲率会变得非常大
%还有若采用中点欧拉法计算heading时，(即使用(y2 - y1)/(x2 - x1)的反正切计算一个角度 ，用(y1 - y0)/(x1
%-x0)的反正切又计算一个角度，然后加起来除以2),如果精确值是 (a1 + a2)/2,但最终计算的结果可能是(a1 + a2 + 2pi)/2
% 还有 tan(x) = tan(x + pi) 所以arctan(tan(x))可能等于x，也可能等于x + pi
% 角度的处理非常麻烦，而且角度处理不当往往是许多奇怪错误的源头

dx = diff(path_x);
dy = diff(path_y);
%用中点欧拉法要比向前欧拉法向后欧拉法更精确，但是也可能计算出的结果比精确值多一个pi
%在这里对dx,dy做中点欧拉法，使用四象限反正切计算角度
dx_pre = [dx(1);dx];
dx_after = [dx;dx(end)];
dx_final = (dx_pre + dx_after)/2;

dy_pre = [dy(1);dy];
dy_after = [dy;dy(end)];
dy_final = (dy_pre + dy_after)/2;

ds_final = sqrt(dx_final.^2 + dy_final.^2);
path_heading = atan2(dy_final,dx_final);

dheading = diff(path_heading);
dheading_pre = [dheading(1);dheading];
dheading_after = [dheading;dheading(end)];
dheading_final = (dheading_pre + dheading_after) / 2;
%为了防止dheading出现多一个2pi的错误，假设真实的dheading较小，用sin(dheading)近似dheading
path_kappa = sin(dheading_final) ./ ds_final;
end
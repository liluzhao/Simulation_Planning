function [px,py]=Path_S_L(plan_start_x,plan_start_y,plan_start_heading,plan_start_kappa,...
    plan_end_x,plan_end_y,plan_end_heading,plan_send_kappa)
    px = [];
    py = [];
    distance = sqrt((plan_start_x - plan_end_x)^2 + (plan_start_y - plan_end_y)^2);
    [ax,bx,cx,dx,ex,fx,ay,by,cy,dy,ey,fy...
        ]=getParas(plan_start_x,plan_start_y,plan_start_heading,plan_start_kappa,...
    plan_end_x,plan_end_y,plan_end_heading,plan_send_kappa,distance);
    num = round(distance / 0.1);
    eta_ = zeros(num,5);
    for j = 1 : num
        for k = 1 : 5
           eta_(j,k) = power((j - 1)/ (num -1), k);
        end
    end
    for i = 1:num
       temp_x = ax * eta_(i,5) + bx * eta_(i,4) + cx * eta_(i,3) + dx * eta_(i,2) +  ex * eta_(i,1) + fx;
       temp_y = ay * eta_(i,5) + by * eta_(i,4) + cy * eta_(i,3) +dy * eta_(i,2) +ey * eta_(i,1) +fy;
       px = [px temp_x];
       py = [py temp_y];
    end
end
function [ax_,bx_,cx_,dx_,ex_,fx_,ay_,by_,cy_,dy_,ey_,fy_...
    ]=getParas(sp_x,sp_y,sp_theta,sp_kappa,ep_x,ep_y,ep_theta,ep_kappa,distance)
l = distance;%两点之间的距离
p0x = sp_x;
p0y = sp_y;
t0x = cos(sp_theta);
t0y = sin(sp_theta);
k0x = -sp_kappa * sin(sp_theta);
k0y = sp_kappa * cos(sp_theta);

p1x = ep_x;
p1y = ep_y;
t1x = cos(ep_theta);
t1y = sin(ep_theta);
k1x = -ep_kappa * sin(ep_theta);
k1y = ep_kappa * cos(ep_theta);

fx_ = +(p0x);
ex_ = +(t0x) * l;
dx_ = +(k0x) * l * l / 2.0;
cx_ = +(+ 10 * p1x - 10 * p0x) + (-  4 * t1x -  6 * t0x) * l+ (+   k1x -  3 * k0x) * l * l / 2.0;         
bx_ = +(- 15 * p1x + 15 * p0x) + (+  7 * t1x +  8 * t0x) * l+ (-  2 * k1x +  3 * k0x) * l * l / 2.0;
ax_ = +(+  6 * p1x -  6 * p0x) + (-  3 * t1x -  3 * t0x) * l + (+      k1x -      k0x) * l * l / 2.0;

fy_ = +(p0y);
ey_ = +(t0y) * l;
dy_ = +(k0y) * l * l / 2.0;  
cy_ = +(+ 10 * p1y - 10 * p0y) + (-  4 * t1y -  6 * t0y) * l + (+      k1y -  3 * k0y) * l * l / 2.0;
by_ = +(- 15 * p1y + 15 * p0y) + (+  7 * t1y +  8 * t0y) * l + (-  2 * k1y +  3 * k0y) * l * l / 2.0;
ay_ = +(+  6 * p1y -  6 * p0y)+ (-  3 * t1y -  3 * t0y) * l+ (+      k1y -      k0y) * l * l / 2.0;
end

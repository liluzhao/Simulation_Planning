LaneLength = 800;%路长800米
global_path_x = 0: 0.2 : LaneLength;%两个点的距离0.2米
num1 = uint16(length(global_path_x));%计算多少个点
global_path_y = zeros(1,num1);%
global_path_heading = zeros(1,num1);%朝向为0
global_path_kappa = zeros(1,num1);%q曲率为0




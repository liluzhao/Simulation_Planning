function [trajectory_x,trajectory_v,trajectory_a] = Path_S_T(plan_start_s,plan_start_s_dot,plan_start_s_dot2,...
        plan_end_s,plan_end_s_dot,plan_end_dot2,recommend_T)
    %%
    trajectory_x =[];
    trajectory_v = [];
    trajectory_a = [];
    n = round(recommend_T / 0.025);
    s_init = zeros(n,1);
    s_dot_init = zeros(n,1);
    s_dot2_init = zeros(n,1);
    %% Aeq .* X = 0 X=[S1 S1' S1" ...Sn Sn' Sn" ] n个点 等式约束
    Aeq = zeros(3*n,2*n - 2);
    beq = zeros(2*n - 2,1);
    lb = ones(3*n,1);
    ub = lb;
    dt = 0.025;%
    A_sub =[1,0;
            dt,1;
            (1/3)*dt^2,(1/2)*dt;
            -1,0;
            0,-1;
            (1/6)*dt^2,dt/2];
    for i = 1:n - 1
        Aeq(3*i-2:3*i+3,2*i-1:2*i) = A_sub;
    end
    %% 不等式约束条件 
    %中间的一些点 S(位置) 速度 加速度的约束 理论上通过投影到ST图上的障碍物 动态规划获得
    for i = 1:n
       lb(3*i - 2) = -inf;% S的约束 最小值
       lb(3*i - 1) = 0;%速度的约束  最小值
       lb(3*i) = -2;%加速度约束  最小值
       ub(3*i - 2) = inf;
       ub(3*i - 1) = 10;
       ub(3*i) = 3;
    end
    %起点和终点约束
    lb(1) = plan_start_s;
    lb(2) = plan_start_s_dot;
    lb(3) = plan_start_s_dot2;
    ub(1) = lb(1);
    ub(2) = lb(2);
    ub(3) = lb(3);
    lb(3*n - 2) = plan_end_s;
    lb(3*n - 1) = plan_end_s_dot;
    lb(3*n) = plan_end_dot2;
    ub(3*n - 2) = lb(3*n - 2);
    ub(3*n - 1) = lb(3*n - 1);
    ub(3*n) = lb(3*n);
    %% 代价函数 只有平滑性的代价函数 
    A3 = zeros(3*n,3*n);
    A4 = zeros(3*n,n - 1);
    A4_sub =[0;0;1;0;0;-1];
    for i = 1:n - 1
       A3(3*i,3*i) = 1;%二阶导数尽可能小
       A4(3*i-2:3*i+3,i:i) = A4_sub;%三阶导数尽可能小
    end
    A3(3*n,3*n) = 1;
    H = A3 + 100*(A4*A4');
    H = 2*H;
    f = zeros(3*n,1);%只有平滑性代价 f=[0]矩阵
    %% 最终求解
    X = quadprog(H,f,[],[],Aeq',beq,lb,ub);
    for i = 1:n
       s_init(i) = X(3*i - 2);
       s_dot_init(i) = X(3*i - 1);
       s_dot2_init(i) = X(3*i);
    end
    trajectory_x =s_init;
    trajectory_v = s_dot_init;
    trajectory_a = s_dot2_init;
end



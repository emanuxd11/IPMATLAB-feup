clear; clc;

ITERATIONS = 50;                                       % número de iterações
X_MIN = 0; X_MAX = 10;                                 % domínio de x
Y_MIN = 0; Y_MAX = 10;                                 % domínio de y
SPEED = 10;                                            % velocidade

x = zeros(1, ITERATIONS); y = zeros(1,ITERATIONS);      % posição
x(1) = 5; y(1) = 5;                                    % posição inicial
v_x = zeros(1, ITERATIONS); v_y = zeros(1,ITERATIONS);  % velocidade
v_x(1) = 1; v_y(1) = 1;                                % velocidade inicial
accel_x = 0; accel_y = -1;

clf; figure(1);

for i = 2:ITERATIONS
    x(i) = x(i - 1) + v_x(i - 1);
    y(i) = y (i - 1) + v_y(i - 1);

    if x(i) < X_MIN
        x(i) = -x(i);
        v_x(i) = -v_x(i - 1);
        v_y(i - 1) = v_y(i - 1);
    elseif x(i) > X_MAX
        x(i) = X_MAX * 2 - x(i);
        v_x(i) = -v_x(i - 1);
        v_y(i) = v_y(i);
    elseif y(i) < Y_MIN
        y(i) = -y(i);
        v_x(i) = v_x(i - 1);
        v_y(i) = -v_y(i - 1);
    elseif y(i) > Y_MAX
        y(i) = Y_MAX * 2 - y(i);
        v_x(i) = v_x(i - 1);
        v_y(i) = -v_y(i - 1);
    else
        v_x(i) = v_x(i - 1);
        v_y(i) = v_y(i - 1);
    end

    v_y(i) = v_y(i) + accel_y * 1;

    plot(x(i), y(i), 'or', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); hold off;
    axis([X_MIN X_MAX Y_MIN Y_MAX])
    pause(1 / SPEED)
end

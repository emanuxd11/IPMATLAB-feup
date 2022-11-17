clear; clc;

ITERATIONS = 500;
X_MIN = 0; X_MAX = 10;
Y_MIN = 0; Y_MAX = 10;
SPEED = 100;
LOST_PERCENTAGE = 50;

% posicoes
x1 = zeros(1, ITERATIONS); y1 = zeros(1,ITERATIONS);
x2 = zeros(1, ITERATIONS); y2 = zeros(1,ITERATIONS);

% posicoes iniciais
x1(1) = 5; y1(1) = 3;
x2(1) = 3; y2(1) = 5;

%velocidades
v_x1 = zeros(1, ITERATIONS); v_y1 = zeros(1,ITERATIONS);
v_x2 = zeros(1, ITERATIONS); v_y2 = zeros(1, ITERATIONS);

% velocidades iniciais
v_x1(1) = 2; v_y1(1) = 2;
v_x2(1) = -3; v_y2(1) = 5;

% aceleracoes
accel_x1 = 0; accel_y1 = 0;
accel_x2 = 0; accel_y2 = 0;

clf; figure(1);

for i = 2:ITERATIONS
    x1(i) = x1(i - 1) + v_x1(i - 1) / 10;
    y1(i) = y1(i - 1) + v_y1(i - 1) / 10;

    x2(i) = x2(i - 1) + v_x2(i - 1) / 10;
    y2(i) = y2(i - 1) + v_y2(i - 1) / 10;

    if x1(i) < X_MIN
        x1(i) = -x1(i);
        v_x1(i) = -v_x1(i - 1);
        v_y1(i) = v_y1(i - 1);
    elseif x1(i) > X_MAX
        x1(i) = X_MAX * 2 - x1(i);
        v_x1(i) = -v_x1(i - 1);
        v_y1(i) = v_y1(i - 1);
    elseif y1(i) < Y_MIN
        y1(i) = -y1(i);
        v_x1(i) = v_x1(i - 1);
        v_y1(i) = -v_y1(i - 1);
    elseif y1(i) > Y_MAX
        y1(i) = Y_MAX * 2 - y1(i);
        v_x1(i) = v_x1(i - 1);
        v_y1(i) = -v_y1(i - 1);
    else
        v_x1(i) = v_x1(i - 1);
        v_y1(i) = v_y1(i - 1);
    end

    if x2(i) < X_MIN
        x2(i) = -x2(i);
        v_x2(i) = -v_x2(i - 1);
        v_y2(i) = v_y2(i - 1);
    elseif x2(i) > X_MAX
        x2(i) = X_MAX * 2 - x2(i);
        v_x2(i) = -v_x2(i - 1);
        v_y2(i) = v_y2(i - 1);
    elseif y2(i) < Y_MIN
        y2(i) = -y2(i);
        v_x2(i) = v_x2(i - 1);
        v_y2(i) = -v_y2(i - 1);
    elseif y2(i) > Y_MAX
        y2(i) = Y_MAX * 2 - y2(i);
        v_x2(i) = v_x2(i - 1);
        v_y2(i) = -v_y2(i - 1);
    else
        v_x2(i) = v_x2(i - 1);
        v_y2(i) = v_y2(i - 1);
    end

    range = 0.5;
    if (x1(i) > x2(i) - range && x1(i) < x2(i) + range) && \
      (y1(i) > y2(i) - range && y1(i) < y2(i) + range)
      printf("same");
      v_x1(i) = -v_x1(i) * ((100 - LOST_PERCENTAGE) / 100);
      v_y1(i) = -v_y1(i) * ((100 - LOST_PERCENTAGE) / 100);
      v_x2(i) = -v_x2(i) * ((100 - LOST_PERCENTAGE) / 100);
      v_y2(i) = -v_y2(i) * ((100 - LOST_PERCENTAGE) / 100);
    endif

    v_x1(i) = v_x1(i) + accel_x1;
    v_y1(i) = v_y1(i) + accel_y1;

    v_x2(i) = v_x2(i) + accel_x2;
    v_y2(i) = v_y2(i) + accel_y2;

    printf("vel_x1: %f   vel_x2: %f\n", v_x1(i), v_x2(i))

    plot(x1(i), y1(i), '.', 'MarkerSize', 50); hold on;
    plot(x2(i), y2(i), '.', 'MarkerSize', 50); hold off;
    grid on;

    axis([X_MIN X_MAX Y_MIN Y_MAX])
    pause(1 / SPEED)
end

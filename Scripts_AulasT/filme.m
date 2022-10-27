clear M

x = -4 * pi:0.1:4 * pi;
y = sin(x);
h = plot(x, y, 'LineWidth', 3);

for i=0:20000
    set(h,'YData', sin(x - i/250))
    drawnow
    %M(i) = getframe;
end

%movie(M);
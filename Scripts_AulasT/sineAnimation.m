ITERATIONS = 10;
MULTIPLIER = 100000;
XLIM = 10;
YLIM = 8;

currentMult = 1;
increase = 1;
speed = 20;
speed = 1 + speed / 10000;

x = -XLIM:0.1:XLIM;
y = sin(x);
h = plot(x, y, 'LineWidth', 3);
xlim([-XLIM XLIM]);
ylim([-YLIM YLIM]);

for i=0:ITERATIONS*MULTIPLIER
  if sin(pi/2) * currentMult > YLIM - 1.5
    increase = 0;
  elseif sin(pi/2) * currentMult < (YLIM - 1.5) / 10
    increase = 1;
  endif

  if increase
    currentMult = currentMult * speed;
  else
    currentMult = currentMult / speed;
  endif

  set(h, 'YData', sin(x - i/300) * currentMult);

  drawnow
 end

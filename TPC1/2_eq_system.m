pkg load symbolic
syms x1 x2 x3;
eq1 = 2*x1 + 3*x2 == 0;
eq2 = 3*x2 + 4*x3 == -1;
eq3 = x1 + x2 + x3 == -2;
[solx1, solx2, solx3] = solve([eq1, eq2, eq3], [x1, x2, x3])

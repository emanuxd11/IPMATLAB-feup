pkg load symbolic
syms x1 x2 x3
eqn1 = 2*x1 + 3*x2 == 0;
eqn2 = 3*x2 + 4*x3 == -1;
eqn3 = x1 + x2 + x3 == -2;
sol = solve([eqn1, eqn2, eqn3], [x1, x2, x3]);
x1Sol = sol.x1
x2Sol = sol.x2
x3Sol = sol.x3

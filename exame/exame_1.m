pkg load symbolic;

syms x y z;

eq1 = x + z == 3;
eq2 = x - y + 3*z == 1;
eq3 = y + 2*z == -2;

sol = solve([eq1, eq2, eq3], [x, y, z]);
xSol = sol.x
ySol = sol.y
zSol = sol.z


function desenharGrafico
  X = -2:0.1:2;
  Y = -2:0.1:2;
  [X,Y] = meshgrid(-2:0.1:2);
  Z = exp(-X.^2 - 2 * (Y.^2));
  surf(X,Y,Z);

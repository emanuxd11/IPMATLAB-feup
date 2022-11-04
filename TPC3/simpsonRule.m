function simpsonRule
  format long

  f = @(x) sin(x) + tan(cos(x))
  approx = simp(f, -e, e, 10.^6)

  function approx = simp(f, a, b, n)
    h = (b - a) / n;
    sum = 0;
    for i = 0:n
      xi = a + i * h;
      if i == 0 || i == n
        sum += f(xi);
        continue;
      endif
      if mod(i, 2) != 0
        sum += 4 * f(xi);
      else
        sum += 2 * f(xi);
      endif
    approx = (h / 3) * sum;
    endfor

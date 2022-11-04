function sum = iterativeCubedSum(n)
  sum = 0;
  for i = 1:n
    sum += i.^3;
  endfor

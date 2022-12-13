function sum = recursiveCubedSum(n)
  if n < 1
    sum = 0;
    return;
  endif

  if n == 0
    sum = 0;
  else
    sum = n.^3;
    sum += recursiveCubedSum(n -1);
  endif
end

recursiveCubedSum(5)

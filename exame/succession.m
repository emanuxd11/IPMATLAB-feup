function success = succession(n)
  if n == 0
    success = 1;
    return;
  else if n == 1
    success = 1;
    return;
  endif

  success = succession(n - 1) + 2*succession(n - 2);
end

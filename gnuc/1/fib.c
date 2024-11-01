int fib (int n){
  if (n <= 2)  /* This avoids infinite recursion.  */
    return 1;
  else
    return fib (n - 1) + fib (n - 2);
}

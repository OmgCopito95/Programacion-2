program CalculoFibonacci;
   var num:integer;
 Function Fib (n: integer): integer;
   begin
    if (n = 1)then Fib:= 0
              else if (n = 2) then Fib:= 1
                              else Fib:= Fib(n-1)+ Fib(n-2);
   end;
begin
  read(num);
  Write ('El término', num, 'de la serie de Fibonacci es:', Fib(num));
  readln;
end.

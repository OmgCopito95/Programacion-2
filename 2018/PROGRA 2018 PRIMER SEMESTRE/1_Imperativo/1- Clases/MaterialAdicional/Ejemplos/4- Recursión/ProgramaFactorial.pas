program programa_recursion;
Function factorial (n: integer): integer;
begin
  if (n <= 1) then  begin
    factorial:= 1;
   end
  else begin
    factorial := n * factorial(n-1);   
  end
end;
var 
  num: integer;
Begin

  writeln( 'Ingrese un entero no negativo:');
  readln (num);

  writeln ( num, '! = ', factorial(num));
  readln;
End.


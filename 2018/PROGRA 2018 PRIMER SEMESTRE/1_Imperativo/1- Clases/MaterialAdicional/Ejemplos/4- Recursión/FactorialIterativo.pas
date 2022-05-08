program Factorial_Iterativo;
  var num: integer;
Function factorial (n: integer): real;	
var 	
   i : integer;
   product: real;
begin
   product := 1;
   for i:=2 to n do 
      product:= product * i;
   factorial:=product;
end;
Begin
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  writeln ( num, '! = ', factorial (num));
  readln
end.

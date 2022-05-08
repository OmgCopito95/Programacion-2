program binario;

function bss2(n:integer):integer;
var
  dig: integer;
begin
  if(n <> 0) then begin
    dig := n mod 2;
    bss2:= (bss2(n div 2)*10) + dig;
  end
  else
    bss2:= 0
end;


procedure bss(n: integer; var res:integer);
var
  dig: integer;
begin
  if(n <> 0) then begin
    dig := n mod 2;
    bss(n div 2, res);    
    res:= res*10;
    res:= res + dig;
  end;
end;

var
  n, res: integer;

begin
  readln(n);
  res:= 0;
  bss(n, res);
  writeln('res:', res);

  writeln('res2:', bss2(n));
  readln;

end.

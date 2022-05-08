Program Mergelistas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;


{-----------------------------------------------------------------------------
INSERTAR - Inserta num en la lista pri manteniendo el orden creciente}
Procedure Insertar ( var pri: lista; num: integer);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.datos := num;
   act := pri;
   ant := pri;
  { Recorro mientras no se termine la lista y no encuentro la posición correcta}
   while (act<>NIL) and (act^.datos < num) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;


{-----------------------------------------------------------------------------
CREARLISTAORDENADA - Genera una lista con números aleatorios ordenados de forma
creciente}
procedure crearListaOrdenada(var l: Lista);
var
  n: integer;
begin
 n := random (50);
 While (n <> 0) do Begin
   Insertar (L, n);
   n := random (50);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIR - Imprime la lista pri}
Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
  writeln;
end;



Var
 L1, L2: Lista;

begin
 randomize;
 L1:=nil;
 L2:=nil;
 CrearListaOrdenada (L1);
 CrearListaOrdenada (L2);
 write ('Lista1: ');
 Imprimir (L1);
 writeln;
 writeln;
 write ('Lista2: ');
 Imprimir (L2);
 readln;
end.

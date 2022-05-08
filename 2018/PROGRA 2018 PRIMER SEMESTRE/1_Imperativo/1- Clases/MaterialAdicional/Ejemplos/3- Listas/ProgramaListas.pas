Program listas;

Type
  Lista= ^Nodo;
  Nodo= Record
           Dato: integer;
           Sig: Lista;
        End;



 {AGREGARALFINAL
 Agrega al final de la lista l}
 {Procedure agregarAlFinal ( var l,ult: Lista; num:integer);
 begin
  //creo el nodo
  //si es el primer nodo actualizo l
  //si no es el primero engancho con el ultimo
  //actualizo el puntero al ultimo
 end;}



{INSERTAR
Inserta un número en la lista en orden creciente}
Procedure Insertar ( var pri: lista; num: integer);
var
  ant, nue, act: lista;
begin
  {Crea un nuevo nodo con el numero num}
  new (nue);
  nue^.dato := num;
  act := pri;
  ant := pri;
  {Recorro mientras no se termine la lista y no encuentro la posición}
  while (act <> NIL) and (act^.dato < num) do begin
    ant := act;
    act := act^.sig ;
  end;
  if (ant = act) then
    pri := nue   {el dato va al principio}
  else
    ant^.sig := nue; {el dato va entre otros dos o al final}
  nue^.sig := act ;
end;



{CREARLISTA
Crea una lista l con numeros random con longitudLista elementos}
Procedure crearListaOrdenada(var l:lista; longitudLista: integer);
var
  i,n: integer;
begin
  l := nil;
  for i := 1 to longitudLista do begin
    n := random (100);
    Insertar(l, n);
  end;
end;


{IMPRIMIR
Imprime la lista L}
Procedure Imprimir (l:lista);
Begin
  while (l <> NIL) do begin
    write ('[', l^.dato, '] ');
    l:= l^.sig;
  end;
  writeln;
end;


Var
  L1, L2: Lista;

begin
  randomize;

  {Creo las listas}
  crearListaOrdenada(L1, 4);
  crearListaOrdenada(L2, 3);

  writeln('Listas generadas: ');
  writeln;
  write('L1 --> ');
  imprimir(L1);          
  write('L2 --> ');
  imprimir(L2);
  readln;



end.

Program listas;
           

Type
  Lista= ^Nodo;
  Nodo= Record
           Dato: integer;
           Sig: Lista;
        End;



{AGREGARALFINAL
Agrega al final de la lista l}
Procedure agregarAlFinal ( var l,ult: Lista; num: integer);
var
  nue: Lista;
begin
  //creo el nodo
  new(nue);
  nue^.dato:= num;
  nue^.sig:= nil;
  //si es el primer nodo actualizo l
  if( l = nil)then
    l := nue
  else
    ult^.sig := nue; //si no es el primero engancho con el ultimo
  //actualizo el puntero al ultimo
  ult:= nue;
end;

{DETERMINAR_MINIMO
Recibe 2 listas odenadas de forma creciente y retorna el elemento minimo. El
elemento se quita de la lista original}
procedure determinar_minimo( var l1,l2: lista; var min: integer);
begin
  if(l1 <> nil) and (l2 <> nil) then begin
    if(l1^.dato < l2^.dato)then begin
      min:= l1^.dato;
      l1 := l1^.sig;
    end
    else begin
      min:= l2^.dato;
      l2 := l2^.sig;
    end;
  end
  else begin
    if(l1 <> nil)then begin {solo l1 tiene datos}
      min:= l1^.dato;
      l1 := l1^.sig;
    end
    else begin {solo l2 tiene datos}
      min:= l2^.dato;
      l2 := l2^.sig;
    end;
  end;
end;


{MERGE
Realiza un merge de 2 listas}
Procedure merge( l1, l2: lista; var l3: lista);
var
  min: integer;
  ult: lista;
begin
  l3:= nil;
  ult:= nil;
  while (l1 <> nil) or (l2 <> nil) do begin
    determinar_minimo(l1, l2, min);
    agregarAlFinal(l3, ult, min);
  end;
end;




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
  l1, l2, l3: Lista;

begin

  {Creo las listas}
  crearListaOrdenada(l1, 4);
  crearListaOrdenada(l2, 3);

  writeln('Listas generadas: ');
  writeln;
  write('L1 --> ');
  imprimir(l1);
  write('L2 --> ');
  imprimir(l2);
  readln;

  merge(l1, l2, l3);
  writeln('Listas mergeadas: ');
  writeln;
  write('L3 --> ');  
  imprimir(l3);
                  
  readln;
end.

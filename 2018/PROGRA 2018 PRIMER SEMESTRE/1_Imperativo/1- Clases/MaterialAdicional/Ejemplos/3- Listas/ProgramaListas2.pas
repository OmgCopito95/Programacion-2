Program listas2;

CONST

  dimFis = 4; // dimension fisica del arreglo

Type
  Lista= ^Nodo;
  Nodo= Record
           Dato: integer;
           Sig: Lista;
        End;

  arrListas = array[1..dimFis] of Lista;


 {AGREGARALFINAL
 Agrega al final de la lista l}
 {Procedure agregarAlFinal ( var l,ult: Lista; num: integer);
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
 end; }



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
  l:= nil;
  for i := 1 to longitudLista do begin
    n := random (100);
    Insertar(l, n);
  end;
end;



{CARGARARREGLO
Completa el arreglo con listas en las 4 posiciones}
Procedure cargarArreglo(var a:arrListas);
var
  i,longitudLista: integer;
begin
  for i := 1 to dimFis do begin
    longitudLista := random (10);
    crearListaOrdenada(a[i], longitudLista);
  end;
end;



{IMPRIMIR
Imprime la lista L}
Procedure imprimir (l:lista);
Begin
  while (l <> NIL) do begin
    write ('[', l^.dato, '] ');
    l:= l^.sig;
  end;
  writeln;
end;



{IMPRIMIRARREGLO
Imprime la lista L}
Procedure imprimirArreglo (a:arrListas);
var i: integer;
Begin
  writeln('Listas generadas: ');
  for i := 1 to dimFis do begin
    writeln;
    write('L',i,' --> ');
    imprimir(a[i]);
  end;
end;



{------ PROG PPAL -----------------------}
Var
  a: arrListas;

begin
  randomize;

  cargarArreglo(a);
  imprimirArreglo(a);

  readln;

end.

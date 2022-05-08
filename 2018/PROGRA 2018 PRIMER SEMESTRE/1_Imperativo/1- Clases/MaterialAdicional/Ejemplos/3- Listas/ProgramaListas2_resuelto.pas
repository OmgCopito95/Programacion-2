Program listas2;

CONST

  dimFis = 4; // dimension fisica del arreglo
  valorMax = 100;
Type
  Lista= ^Nodo;
  Nodo= Record
           Dato: integer;
           Sig: Lista;
        End;

  arrListas = array[1..dimFis] of Lista;


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
Recibe una arreglo con listas odenadas de forma creciente y retorna el elemento minimo. El
elemento se quita de la lista original}
procedure determinar_minimo( var a: arrListas; var min: integer);
var
  i, posMin: integer;
begin
  min:= valorMax;
  for i:= 1 to dimFis do begin
    if(a[i] <> nil) and (a[i]^.dato < min)then begin
      min:= a[i]^.dato;
      posMin := i;
    end;
  end;
  if(min <> valorMax)then {encontró al menos un valor}
    a[posMin] := a[posMin]^.sig;
end;


{MERGE
Realiza un merge de 2 listas}
Procedure merge( a: arrListas; var l3: lista);
var
  min: integer;
  ult: lista;
begin
  l3:= nil;
  ult:= nil;                    
  determinar_minimo(a, min);
  while (min <> valorMax) do begin
    agregarAlFinal(l3, ult, min);  
    determinar_minimo(a, min);
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
  l:= nil;
  for i := 1 to longitudLista do begin
    n := random (valorMax);
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
  l3: lista;
begin
  randomize;
  cargarArreglo(a);
  imprimirArreglo(a);

  merge(a, l3);
  writeln('Listas mergeadas: ');
  writeln;
  write('L3 --> ');  
  imprimir(l3);
                  
  readln;

end.

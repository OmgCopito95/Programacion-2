program CargaMatrices;
  const
    max = 10;

  type
    rangofila= 1..max;
    rangoCol= 1..max;
    Matriz = array [rangofila, rangoCol] of integer;

  var
    DF: rangofila;
    DC: rangocol;
    Mat: Matriz;

Procedure  Cargar (var M:Matriz; Filas: rangofila; Cols:rangoCol);
   var
      fil: rangofila;
      col: rangoCol;

  Begin
     randomize;
     For fil:=1 to Filas do
        For col:= 1 to Cols do begin
          M[fil,col]:= random(100)
        end;
     readln
  End;

Procedure  Imprimir (var M:Matriz; Filas: rangofila; Cols:rangoCol);
 var
    fil: rangofila;
    col: rangoCol;
 begin
   For fil:= 1 to Filas do begin
      For col:= 1 to Cols do
        write (M[fil,col], ' ');
      writeln;
   end;
 end;

begin
  write ('Ingrese nro de filas');
  read(DF);
  write ('Ingrese nro de columnas');
  read(DC);
  {carga matriz por fila}
  cargar (Mat, DF, DC);
  {mostrar matriz por filas}
  imprimir (Mat, DF, DC);
  readln()
end.

program cargarMatriz;
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
    d: integer;
    fila: rangofila;
    exito: boolean;

Procedure  Cargar (var M:Matriz; Filas: rangofila; Cols:rangoCol);
   var
      fil: rangofila;
      col: rangoCol;

  Begin
     For fil:=1 to Filas do
        For col:= 1 to Cols do begin
          writeln ('Ingrese valor:');
          readln(M[fil,col]);
        end;
  End;

Procedure  Mostrar (M:Matriz; Filas: rangofila; Cols:rangoCol);
var
  fil: rangofila;
  col: rangoCol;

Begin
  For fil:=1 to Filas do begin
     For col:= 1 to Cols do
        write (M[fil,col]);
     writeln;
  end;
End;

Function Buscar ( M: matriz; DimFila: rangofila; DimCol: rangocol; elem: integer): boolean;
var
  existe : boolean;
  i: rangofila;
  j: rangocol;

Begin
  existe := false;
  i:= 1;
  while ( i<= DimFila) and (not existe) do begin
    j := 1;
    while ( j <= DimCol) and (not existe) do
        if M[i,j] = elem then existe := true
                         else j := j+1;
        if not existe then i := i+1;
    end;
    Buscar := existe;
End;

Procedure EliminarFila ( var M: matriz; var DimFila: rangofila; DimCol: rangoCol;
                         fila: rangofila; var exito:boolean);
var
  k:rangocol;
  f:rangofila;
begin
 { verifica que el índice es válido, para efectuar la operación}
  if (fila>=1) and (fila<DimFila) then begin
                                   exito := True;
                                  {desplaza todas las filas una posición arriba}
                                   for f := fila to DimFila-1 do
                                   {desplaza todas las columnas de una fila}
                                     for  k := 1 to DimCol do
                                       M [f, k] := M [f+1, k];
                                   DimFila := DimFila - 1
                                   end
                                  else
                                    if fila = DimFila then begin
                                                        DimFila:=DimFila-1;
                                                        exito := True;
                                                      end
                                                      else exito := False;
 end;

begin
  write ('Ingrese nro de filas');
  read(DF);
  write ('Ingrese nro de columnas');
  read(DC);
  {cargar matriz por filas, se conoce dimensión lógica de filas y columnas}
  cargar (Mat, DF, DC);
  {mostrar matriz por filas}
  Mostrar (Mat, DF, DC);
  writeln ('Ingresar el nro a buscar en la matriz');
  read (d);
  if Buscar (Mat, DF, DC, d) then writeln ('El nro se encuentra en la matriz')
                             else writeln ('El nro no se encuentra en la matriz');
  write ('Ingresar el nro de fila a eliminar: ');
  readln (fila);
  EliminarFila (Mat, DF, DC, fila, exito);
  if exito then writeln ('la fila se elimino')
           else writeln ('la fila no se pudo eliminar');
  writeln ('Matriz resultante');
  Mostrar (Mat, DF, DC);
  readln;
end.

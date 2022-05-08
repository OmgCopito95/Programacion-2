unit Matrices;
interface
const
    max = 50;

   type
    rangofila= 1..max;
    rangoCol= 1..max;

    matriz = array [rangofila, rangoCol] of integer;

    export = matriz;

    Procedure  Cargar (var M:Matriz; Filas: rangofila; Cols:rangoCol);
    Procedure  Mostrar (M:Matriz; Filas: rangofila; Cols:rangoCol);
    Function Buscar ( M: matriz; DimFila: rangofila; DimCol: rangocol; elem: integer): boolean;
    Procedure EliminarFila ( var M: matriz; var DimFila: rangofila; DimCol: rangoCol;
                         fila: rangofila; var exito:boolean);
implementation

   Procedure  Cargar (var M:Matriz; Filas: rangofila; Cols:rangoCol);
   var
      fil: rangofila;
      col: rangoCol;
   Begin
     Randomize;
     For fil:=1 to Filas do
        For col:= 1 to Cols do begin
          M[fil,col] := random(100);
        end;
   End;

   Procedure  Mostrar (M:Matriz; Filas: rangofila; Cols:rangoCol);
   var
      fil: rangofila;
      col: rangoCol;
   Begin
        For col:= 1 to Cols do
            write('-----');
        writeln;
        For fil:=1 to Filas do begin
            write (' ');
            For col:= 1 to Cols do
                if(M[fil,col] > 9)then
                              write (M[fil,col], ' | ')
                else
                     write ('0',M[fil,col], ' | ');
            writeln;
            For col:= 1 to Cols do
                        write('-----');
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

end.

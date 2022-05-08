Program arboles;
Type
  arbol= ^Nodo;
  Nodo= Record
           dato: integer;
           HI: arbol;
           HD: arbol;
        End;
Var
 Ar: arbol;
 n: integer;

Procedure InsertarNodo (Var a:arbol; dato:integer);
Begin
 if a = nil Then begin { llegué al final de la rama }
             New( A );
             a^.dato := dato;
             a^.HI:= nil;
             a^.HD:= nil;
   		    End
            Else
               if dato<a^.dato then InsertarNodo (a^.HI,dato)
   		                        Else InsertarNodo (a^.HD,dato)
end;

Procedure ImprimirenOrden ( a: arbol );
begin
   if ( a<> nil ) then begin
                    ImprimirenOrden (a^.HI);
                    writeln (a^.dato);
                    ImprimirenOrden (a^.HD)
                   end;
end;

Procedure imprimirpornivel(a: arbol);
var
   l: listaNivel;
   pos: integer;
begin
   l:= nil;
   pos:= 1;
   if(a <> nil)then begin
        agregarAListaNiveles(a^.dato, l, );
   end
end;

procedure agregarAListaNiveles(d:integer; var l:listaNivel)


begin
 ar:=nil;
 write ('Ingreso Nro para guardar en el arbol: ');
 Randomize;
 n:= random(100); //readln (n);
 While (n<>990) do Begin
   InsertarNodo (ar, n);
   write ('Ingreso Nro para guardar en el arbol: ');
   n:= random(100); //readln (n);
 End;
 writeln ('Arbol generado: ');
 imprimirenorden(ar);
 imprimirpornivel(ar);
 readln;
end.

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


begin
 ar:=nil;
 {write ('Ingreso Nro para guardar en el arbol: ');}
 Randomize;
 n:= random(10);
 While (n<>0) do Begin
   InsertarNodo (ar, n);
   n:= random(10);
 End;
 writeln ('Arbol generado: ');
 imprimirenorden(ar);
 readln;
end.

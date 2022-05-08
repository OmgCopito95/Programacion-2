Program listas;
Type
  Lista= ^Nodo;
  Nodo= Record
           Datos: integer;
           Sig: Lista;
        End;
Var
 L: Lista;
 n: integer;

{Procedure AgregarAdelante (var L:lista; num:integer);
Var nue:Lista;
  Begin
    New(nue);
    nue^.datos:=num;
    nue^.sig:=L;
    L:=nue;
  End;
  }
Procedure Imprimir (pri:lista);
Begin
   while (pri <> NIL) do begin
     write (pri^.datos, ' ');
     pri:= pri^.sig
  end;
end;

{function buscar ( pri: lista; x: integer): boolean;
Var
   encontre : boolean;
begin
  encontre := false;
   while (not encontre) and (pri <> NIL) do
      if x = pri^.datos then encontre := true
		                else pri := pri^.sig;
  buscar := encontre
end;	
}

function buscarOrd ( pri: lista; x: integer): boolean;
begin
   while (pri <> Nil) and (pri^.datos < x) do
      pri := pri^.sig;
   if (pri^.datos = x) then buscarOrd := True
                       else buscarOrd := False;
end;

Procedure Insertar ( var pri: lista; num: integer);
var ant, nue, act: lista;
begin
   new (nue);
   nue^.datos := num;
   act := pri;
   ant := pri;
  {Recorro mientras no se termine la lista y no encuentro la posición correcta}
   while (act<>NIL) and (act^.datos < num) do begin
      ant := act;
      act := act^.sig ;
   end;
   if (ant = act) then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {el dato va entre otros dos o al final}
   nue^.sig := act ;
end;

Procedure Borrar ( var pri: lista; num:integer);
var ant, act: lista;
begin
  act := pri;
  ant := pri;
 {Recorro mientras no se termine la lista y no encuentre el elemento a borrar}
  while  (act <> NIL) and (act^.datos <> num) do begin
     ant := act;
     act := act^.sig
  end;
  if (act <> NIL) then begin
	                if (act = pri) then   {El dato a borrar es el primero}
                                     pri := act^.sig
                                   else
                                     ant^.sig:= act^.sig;
                    dispose (act);
                  end;
end;

begin
 L:=nil;
 write ('Ingreso Nro para guardar en la lista: ');
 readln (n);
 While (n<>0) do Begin
   {AgregarAdelante (L, n);}
   Insertar (L, n);
   write ('Ingreso Nro para guardar en la lista: ');
   readln (n);
 End;
 writeln ('Lista generada: ');
 imprimir (L);
 writeln ('Ingrese el nro a buscar: ');
 readln (n);
 {if buscar (L, n) then writeln ('El nro se encuentra en la lista')
                  else writeln ('El nro no se encuentra en la lista'); }
 if buscarOrd (L, n) then writeln ('El nro se encuentra en la lista')
                     else writeln ('El nro no se encuentra en la lista');
 write ('Ingrese el nro a borrar: ');
 readln (n);
 Borrar (L, n);
 writeln ('Lista resultante: ');
 imprimir (L);
 readln
end.

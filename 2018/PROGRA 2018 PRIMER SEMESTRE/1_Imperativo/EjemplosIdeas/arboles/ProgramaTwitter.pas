Program twitter;
Uses
	sysutils;
Type
	tweet = record
		codigoUsuario: integer;
		nombreUsuario: string;
		mensaje: string;
		esRetweet: boolean;
	end;

	listaTweets = ^nodoLista;
	nodoLista = record
		dato: tweet;
		sig: listaTweets;
	end;
	
	{Completar agregando aquí las estructuras de datos necesarias en el ejercicio 9}



{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}

Procedure agregarAdelante(var l: listaTweets; t: tweet); 
var
  aux: listaTweets;
begin
  new(aux);
  aux^.dato := t;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con tweets aleatorios }
procedure crearLista(var l: listaTweets);
var
  t: tweet; 
  texto: string;
  v : array [1..10] of string;
begin

 v[1]:= 'juan'; 
 v[2]:= 'pedro'; 
 v[3]:= 'carlos'; 
 v[4]:= 'julia'; 
 v[5]:= 'mariana';
 v[6]:= 'gonzalo'; 
 v[7]:='alejandra'; 
 v[8]:= 'silvana'; 
 v[9]:= 'angie'; 
 v[10]:= 'hernan';
 
 l:= nil;
 t.codigoUsuario := random (10);
 
 while (t.codigoUsuario <> 0) do Begin
   texto:= Concat(v[t.codigoUsuario], '-mensaje-', IntToStr(random (200)));
   t.nombreUsuario := v[t.codigoUsuario];
   t.mensaje := texto;
   t.esRetweet := (random (1) = 0);
   agregarAdelante(l, t);
   t.codigoUsuario := random (10);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: listaTweets);
begin
 While (l <> nil) do begin
   {imprimir(l^.dato); Completar el algoritmo para validar}
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
AGREGARELEMENTO - Resuelve la inserción de la estructura de la ACTIVIDAD 9
agregarElemento ( VAR arbolUsuarios, elementoLista)
 Completar
}

{-----------------------------------------------------------------------------
GENERARNUEVAESTRUCTURA - Resuelve la generación de la ACTIVIDAD 9
generarNuevaEstructura (listaTweets, VAR arbolUsuarios)
	mientras (no llegue al final de la lista de tweets)
		agregarElemento (arbolUsuarios, elementoLista);
		avanzar en el recorrido de la lista
}

{-----------------------------------------------------------------------------
CANTIDADTWEETS - Resuelve la cuenta de elementos de la ACTIVIDAD 10
cantidadTweets (usuario)
	// recorrer la lista de tweets 
}

{-----------------------------------------------------------------------------
RECORRERARBOL - Resuelve el recorrido de la ACTIVIDAD 10
recorrerArbol (arbolUsuarios)
	si (tenemos un nodo en la raíz)
		si (el código de usuario > 300)
			informar (cantidadTweets (usuarioActual));
			recorrerArbol (hijoIzquierdo)
		recorrerArbol (hijoDerecho)
}



Var

 l: listaTweets;
 {Completar agregando variables}

begin
 Randomize;
 
 crearLista(l);
 writeln ('Lista generada: ');
 {imprimirLista(l);}
 
 {Completar el programa}
 
 writeln('Fin del programa');
 readln;
end.
{Ejercicio: Escribir un procedimiento recursivo que permita leer una cadena terminada en punto,
    y contar cuantas letras tiene}

  Program Eje1;
  Var K:integer;
  { contar las letras de una cadena terminada en punto}

    Procedure ContarLetras(VAR Cont:integer);
    { Cont representa la cantidad de letras}
    Var ch:char;
    Begin
      read(ch);  {se lee un caracter}
      if ch<>'.'   { si no es punto}
        then
         Begin
          ContarLetras(Cont);  {se invoca recursivamente}
          Cont:=Cont+1;   {y a la vuelta se incrementa Cont}
         End
        else
          Cont:=0  {si se leyo' un punto, Cont es 0}
    End;

  Begin {prog. principal}
     ContarLetras(K);
     writeln('Ud. ingreso ',K,' letras!');
     readln();
  End.


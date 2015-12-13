{Вычисление производной функции}
program proizvodnaya;
 uses crt;
 const epsmin=1e-6;
type
 func=function(x:real):real;
var
    L1,L2, epsilon:real; i:integer;
   {$F+}
   function ftest(x:real):real;
    begin
      ftest:=sin(x)
    end;
   function f1(x:real):real;
    begin
      if x<>0 then f1:=sin(x)/x else f1:=1;
    end;
   function df(f:func; a,eps:real):real;
       var pme:integer; y1, y2, dx:real;
    begin
     pme:=-1;y2:=(f(a+5)-f(a))/5;
     i:=1;
     repeat
      y1:=y2;
      pme:=pme*(-1);
      dx:=pme/i;
      y2:=(f(a+dx)-f(a))/dx;
      i:=i+1;
     until (abs (y2-y1)<eps ) ;
     df:=y2;
    end;
Begin
 clrscr; epsilon:=1;
 writeln('Производная');
 repeat
   L1:=df(ftest,    0,  epsilon);
   L2:=df(f1,       0,  epsilon);
   writeln ('epsilon=', epsilon:8:6,'  L1=',L1:8:4,'  L2=', L2:8:4);
   epsilon := epsilon*0.1;
 until epsilon < epsmin;
 readln;
End.



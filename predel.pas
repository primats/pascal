{Вычисление предела функции}
program predel;
 uses crt;
 const d=1e-8;
type
 func=function(x:real):real;
var
    L1,L2,L3,L4, epsilon:real; i:integer;
   {$F+}
   {Четыре разных функции}
   function f1(x:real):real;
    begin
      f1:=sin(x)/x
    end;
   function f2(x:real):real;
    begin
     f2:=sin(5*x)/sin(6*x);
    end;
   function f3(x:real):real;
    begin
     f3:=(sqr(sin(x))-sqr(sqr(sin(x)/cos(x))))/(3*sqr(x)+5*sqr(sqr(x)));
    end;
    function f4(x:real):real;
     begin
      f4:=(sqrt(1-x)-3)/(-exp(ln(-x)/3)+2)
     end;
   function lim(f:func; a:real;eps:real):real;
   {Приближение предела функции f(x) при x->a, вычисления до тех
    пор, пока модуль разности соседних значений не станет меньше eps}
    var pme:integer; y1, y2, x:real;
    begin
     pme:=-1;y2:=f(a+5);
     i:=1;
     repeat
      y1:=y2;
      pme:=pme*(-1);;
      x:=a+pme/i;
      y2:=f(x);
      i:=i+1;
     until (abs (y2-y1)<eps ) ;
     lim:=y2;
    end;
Begin
 clrscr; epsilon:=1;
 writeln('Пределы');
 repeat
   L1:=lim(f1,  0,  epsilon);
   L2:=lim(f2,  pi, epsilon);
   L3:=lim(f3,  0,  epsilon);
   L4:=lim(f4, -8,  epsilon);
   writeln ('epsilon=', epsilon:10:8,'  L1=',L1:8:5,
            '  L2=', L2:8:5,'  L3=', L3:8:5,'  L4=', L4:8:5 );
   epsilon := epsilon*0.1;
 until epsilon < d;
 readln;
End.



{���᫥��� ��ன �ந������� �㭪樨}
program proizvodnaya;
 uses crt;
 const epsmin=1e-6;
type
 func=function(x:real):real;
var
    L1,L2,L3,epsilon:real; i:integer;
   {$F+}
   function ftest(x:real):real;
    begin
      ftest:=sin(x)
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
 clrscr;
   {�ந������� � �窥 pi/2}
   L1:=df(ftest,    pi/2,       epsmin);
   {�ந������� � �窥 (pi/2+���饭��)}
   L2:=df(ftest,    pi/2+0.01,  epsmin);
   {�⭮襭�� ���饭�� ��ࢮ� �ந������� � ���饭�� ��㬥��}
   L3:=(L2-L1)/0.01;
   writeln('���� �ந������� sin(x) �� x=pi/2 ',L3:8:4);
   readln;
End.



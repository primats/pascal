program metod_euler;
{��襭�� ���. �ࠢ����� ��⮤�� �����}
 uses crt;
 const n = 10000;
 var
   x0, y0, xk, h , x: real;
function f(x,y:real):real;
{���ᬠ�ਢ����� ���. �ࠢ����� y'= f(x,y)}
 begin
  f:=-4*y+8*x*x+3
  {��� �ࠦ�����}
  {f:=x*sqrt(y);}
 end;
 procedure euler(x0, y0, xk:real);
 {��楤�� ��⮤� �����}
  var dx:real;
  begin
      dx:=(xk - x0)/n;
    repeat
     y0:=y0+dx*f(x0, y0);
     x0:=x0 + dx
    until x0 > xk;
    writeln('x  = ', x0 - dx:4:2,'   y  = ',y0:4:2)
  end;
Begin
 clrscr;
 write('������ x0  ');readln(x0);
 write('������ y0  ');readln(y0);
 write('������ xk  ');readln(xk);
 writeln('��砫�� �᫮���');
 writeln('x0 = ',x0:4:2,'   y0 = ',y0:4:2);
 h:=(xk - x0)/5; x:=x0;
 writeln('������ ��� ��� �஬������� �祪');
 repeat
   x:=x+h;
   euler(x0, y0, x);
 until abs(x-xk)<h/2;
 writeln('����� ����');
 readln
End.

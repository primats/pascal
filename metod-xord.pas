program metod_hord;
{��襭�� �ࠢ����� ��⮤�� ��}
uses crt;
var a, b, x, eps :real;

function f(x:real):real;
{O��ᠭ��  �㭪樨 ��� �ࠢ����� f(x) = 0}
begin
   f:=x*x*x*x-2*x-4
end;

{���ᠭ�� ��⮤� ��}
function horda (a,b, eps:real):real;
 var n:integer; x0,x1:real;
 begin
   n:=0; x1:=0;
   repeat
      x0:=x1;
      x1:=a-((b-a)*f(a))/(f(b)-f(a));
      if f(x1)<>0 then
            if f(a)*f(x1)<0 then b:=x1
            else a:=x1
      else
           begin
              writeln('��᫮ ���権 =',n, 'x0=',x1);
              horda:=x1;
              exit
           end;
      n:=n+1;
      writeln('����� ', n,', a=', a:8:5,'      b=', b:8:5);
      writeln('x',n, ' = ',x1:8:5,'        f(x', n, ')=', f(x1):8:5);
      readln;

      until (abs(x0-x1)<eps) {or (abs(f(b)-f(a))<1e-5)};
   horda:= x1
end;

Begin
   TextBackGround(Blue); TextColor(Yellow); ClrScr;
   write('a = ');readln(a);
   write('b = ');readln(b);
   write('epsilon = ');readln(eps);
   x:=horda(a,b,eps);
   writeln('�ਡ�������� ���祭�� ���� � �筮���� ',eps:7:5);
   writeln('x =',x:8:6);
   readln
End.

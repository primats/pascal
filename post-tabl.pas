Program TablFunc1;
{�ணࠬ�� ����஥��� ⠡���� ���祭�� �㭪樨}
{Crt - ������⥪� ������ࠬ� ⥪�⮢��� ०���}
uses Crt;
var
 a,b,s:real;
 i:byte;
 function f(x:real):real;
   begin
    f:=4*exp(x/4)*sin(8*x)
   end;
 {⠡��� ���祭�� �㭪樨 �� a �� b � 蠣�� s}
 procedure Tabl(a,b,s:real);
  var x:real;i:byte;
   begin
     x:=a;
     repeat
       i:=1;
       repeat
        writeln('x=',x:5:2,' y=',f(x):5:2);
        x:=x+s;i:=i+1;
       until (i>24) or (x>b);
       readln; ClrScr;
     until x>b
    end;
Begin
  ClrScr; {���⪠ �࠭� - ��楤�� �� ����� Crt}
  write('a=');readln(a);
  write('b=');readln(b);
  write('s=');readln(s);
  ClrScr;
  Tabl(a,b,s);
End.
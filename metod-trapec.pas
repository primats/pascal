program int_met_trap;
{���᫥��� ��⥣ࠫ� ��⮤�� �࠯�権}
uses crt;
 const epsilon:real=0.0001; a:real=0; b:real=6;
var
   s:real;
function f(x:real):real;
  {����⥣ࠫ쭠� �㭪��}
begin
   if x=0 then f:=1 else f:=sin(x)/x;
   {�㭪樨 ��� ���஢����}
   {f:=sin(x)}
   {f:=x*x;}
   {f:=exp(-sqr(x));}
end;

function imetrap(a,b:real):real;
  {�㭪��, ॠ������� ��⮤ �࠯�権 }
var
   n,i:longint;
   s1,s2,h,v:real;
begin
   n:=2; h:=(b-a)/n; s2:=0;
   writeln('�஬������ ���祭�� ��⥣ࠫ�');
   repeat
      s1:=0;
      for i:=1 to n-1 do  s1:=s1+f(a+i*h);
      s1:=(s1+f(a)/2+f(b)/2)*h;
{�஬������ ���祭��}
      writeln(s1:9:7,', n=',n);
      n:=2*n;  v:=s2; s2:=s1; s1:=v;
      h:=(b-a)/n
   until abs(s2-s1)<epsilon;
{�������}

   imetrap:=s2;
end;
Begin
   clrscr;
   s:=imetrap(a,b);
   writeln('��⥣ࠫ =',s:9:7,' � �筮���� ',epsilon:6:4);
   readln
End.

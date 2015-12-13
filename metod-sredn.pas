program Integral_metodom_sred_prmg;
uses crt;
{���᫥��� ��⥣ࠫ� ��⮤�� �।��� ��אַ㣮�쭨���}
const
  {��室�� �����: e - �筮��� ���᫥��� ��⥣ࠫ�;
   a - ������ �।��; b - ���孨� �।�� ��⥣�஢����}
   e:real = 0.00000001; a:real = 0; b:real= 6.0;
  var
    IntSum:real;
 function f(x:real):real;{ ��।������ �㭪樨}
  begin
    f:=sin(x)/x;
    {�㭪�� �����}
    {f:=exp(-sqr(x)/2)/sqrt(2*pi);}
    {��� ���஢����}
    {f:=sqr(x);} {f:=cos(x);}
   end;
 procedure Integral(e, a, b :real; var i2:real);
 {��楤�� ���᫥��� ��⥣ࠫ�
     begin       { ��⮤�� �।��� ��אַ㣮�쭨���}
   var
      i1,d,s:real; i,n:word;
      {d=b-a ������� �� n ��१���;n �� ������ 蠣� 㤢��������
      i1- �㬬� ���頤�� n ��אַ㣮�쭨��� c �᭮������ d/n,
      i2- �㬬� ���頤�� 2n ��אַ㣮�쭨��� c �᭮������ d/(2n)}
   begin
     d:=b-a;
     {���� ��אַ㣮�쭨�� ࠢ�� ���祭�� �㭪樨 � �।��� �窥
      ������� �� ��१��� ����� (b-a)/n}
     i1:=(f(a+d/4)+f(b-d/4))*d/2;  {��� n=2}
     {��� n=4}
     i2:=(f(a+d/8)+f(a+3*d/8)+f(a+5*d/8)+f(a+7*d/8))*d/4;
     n:=8;
     while abs(i2-i1) >= e do
       begin
         s:=0;
         for i:=1 to n do s:=s+f(a+(2*i-1)*d/(2*n));
         i1:=i2;  i2:=s*d/n;
         writeln('I= ',IntSum:10:9, ', n=',n:6);
         n:=2*n
       end;
   end;
Begin
   clrscr;
   Integral(e, a, b ,IntSum);
   writeln('��⥣ࠫ ��⮤�� �।��� ��אַ㣮�쭨���');
   writeln('�� a=',a:4:2,' �� b=',b:4:2,' � �筮���� ',e:10:9);
   writeln('I= ',IntSum:10:9);
   readln;
End.

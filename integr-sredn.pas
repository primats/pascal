program Integral_metodom_sred_prmg;
uses crt;
{���᫥��� ��⥣ࠫ� ��⮤�� �।��� ��אַ㣮�쭨���}
const
  {��室�� �����: e - �筮��� ���᫥��� ��⥣ࠫ�;
   a - ������ �।��; b - ���孨� �।�� ��⥣�஢����}
   e:extended = 0.000000000001; a:extended = 0; b:extended= 43.0;
  var
    IntSum:extended;
 function f(x:extended):extended;{ ��।������ �㭪樨}
  begin
        f:=exp(-sqr(x));
   end;
 procedure Integral(e, a, b :extended; var i2:extended);
 {��楤�� ���᫥��� ��⥣ࠫ�
     begin       { ��⮤�� �।��� ��אַ㣮�쭨���}
   var
      i1,d,s:extended; i,n:word;
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
   writeln('�� a=',a:4:2,' �� b=',b:4:2,' � �筮���� ',e:15:14);
   writeln('I= ',IntSum:15:14);
   writeln('(��७� �� pi)/2 = ', sqrt(pi)/2:15:14);
   readln;
End.

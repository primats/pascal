program reurpol;
 {��襭�� �ࠢ����� ��������� ��������
  �।��ਥ�쭮 �뢮����� ⠡��� ��� ��������樨 ��୥�}
uses crt;
var
   a,b,n,x,d,c,eps,f:real;

function y(x:real):real;
  begin
   y:=sin(ln(abs(x*x+2)))
  end;
Begin
   clrscr; writeln('������ ���祭�� �㭪樨');
   writeln('������ ��砫�� � ������ ����� ���ࢠ��');
   write('a='); readln (a);
   write('b='); readln(b);
   writeln('��᫮ �祪 �� ���ࢠ��:');
   write('n='); readln(n);
   d:=(b-a)/n;   x:=a;
   while x<=b do
      begin
         f:=y(x);
         writeln('x=',x:5:3,'  f=',f:5:3);
         x:=x+d
      end;
   readln;
   writeln('��宦����� ����: ����� ���ࢠ��, �筮��� ���᫥���');
   writeln('(a, b � eps)');
   write('a ='); readln (a); write('b ='); readln(b);
   write('eps =');readln(eps);
   {����� ��१�� ����� ࠧ�� �����}
   if y(a)*y(b) < 0 then
      begin
        {�� �� ���, ���� �� ���⨣��� �������� �筮���}
         repeat
           c:=(a+b)/2;
           {�᫨ ������ ��� ��७�, � ��� �뢮� � ��室}
           if y(c)=0 then
            begin
             writeln('������ ��� ��७� ', c:6:3);
             readln;
             exit
            end
             else
           {��।������ ������ �஬���⪠ ��� ᫥���饩 ���樨}
           if y(a)*y(c)<0 then b:=c else a:=c;
         until (b-a)<eps;
         writeln('K�७� � �筮���� ',eps:8:6);
         writeln('ࠢ�� ', c:8:6);
      end
   else
     {�᫨ �� ����� ��१�� �뫨 ��������� �����}
     writeln('���� ��� ��� �� �� �����⢥���');
   readln
end.

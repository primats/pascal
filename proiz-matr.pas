{�ந�������� �����, �ᯮ�짮����� ��楤��
 � ��ࠬ��஬}
program wwod3;
  uses crt;
  {������ ���ᠭ�� ����⠭�: nmax � mmax -
   ���ᨬ��쭮 ��������� �᫮ ��ப � �⮫�殢.
   � ��砥 ����室����� ����� ��������}
  const
       nmax=10;mmax=10;
 {��।������ ⨯� ��६�����, ����室��� ��� ��ࠬ��� ��楤���}
  type
       vector = array[1..mmax] of real;
       {⨯ "�����" ��।���� ��� ���ᨢ ����஢}
       matrica= array[1..nmax] of vector;
  var
       n,m,k,i,j,s:integer;
       sum:real;
       {A,B,C ��।���塞��� ⨯� matrica}
       A,B,C:matrica;
       quit:char;
       {��楤�� ����� � ��ࠬ��ࠬ� n,m,A;
        ��ࠬ��� A ⨯� var (��६�����)- "��।������" ��ࠬ���}
       procedure wwod(n,m:integer; var A:matrica);
        var i,j:integer;
         begin
          for i:=1 to n do
            begin
             writeln('������ ',i,'-�� ��ப�');
             for j:=1 to m do read(a[i,j]);
            end;
            writeln;clrscr;
         end;
         {��楤�� �뢮��}
         procedure wywod(n,m:integer;A:matrica);
          var i,j:integer;
          begin
            for i:=1 to n do
             begin
              writeln;
              for j:=1 to m do write(a[i,j]:4:1,' ');
             end;
             writeln;
          end;
     Begin
         repeat
          clrscr;
           write('n=');readln(n);
           write('k=');readln(k);
           write('m=');readln(m);
           writeln('��ࢠ� �����');
           writeln('��ப - ',n,' �⮫�殢 - ',k);
           wwod(n,k,A);
           writeln('���� �����');
           writeln('��ப - ',k,' �⮫�殢 - ',m);
           wwod(k,m,B);
           writeln('��ࢠ� �����:');
           wywod(n,k,A);
           writeln('���� �����:');
           wywod(k,m,b);
           {��宦����� �ந�������� ����� C=A*B}
           for i:=1 to n do
            for j:=1 to m do
             begin
               sum:=0;
               for s:=1 to k do sum:=sum+a[i,s]*b[s,j];
               c[i,j]:=sum;
             end;
           writeln('�ந�������� �����:');
           wywod(n,m,C);
       {��室 �� ������ Esc}
       until readkey = #27;
     end.




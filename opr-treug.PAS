
program nahogdenie_opredelitelya_metodom_Gaussa;
{��宦����� ��।���⥫� ��⥬ �ਢ������ ������ � ��㣮�쭮� �ଥ}
 uses crt;
  {label 1,2;}
  const
       n=4;{�᫮ ��ப, �᫮ �⮫�殢; ����� ��������}
  type
       vector = array[1..n] of real;
       matrica= array[1..n] of vector;

  var
       a: matrica;
       i,j : integer;
       det  : real; {��।���⥫� ������}
  procedure wywod;
    {�뢮� ������}
      var  i,j:integer;
    begin
       for i:=1 to n do
                 begin
                    for j:=1 to n do
                       write (a[i,j]:9:2,' ');
                     writeln
                 end;
    end;{wywod}
  procedure movestrings(k,l:integer; var a: matrica; n:integer);
  {��楤�� ����⠭���� k-�� � l-�� ��ப � ����� � ���浪� n}
     var j : integer;
         r : real;
    begin
     if (k<=n) and (l<=n)then
       begin
         for j := 1 to n do
           begin
            r := a[l,j];
            a[l,j] :=a[k,j];
            a[k,j] := r;
           end;
       end
    end; {movestrings}
  procedure prhod(var a:matrica; n : integer; var det: real);
    {�८�ࠧ������ ������ �, ࠧ��୮�� n � ���᫥��� ��।���⥫� det -
     ᮮ⢥����� "��אַ�� 室�" ��⮤� �����}
       var i,j,k,l : integer;
         b : matrica;
         k1,k2,d:real;
    begin
     d:=1;
     for k := 1 to n-1 do
               begin
                 {�᫨ ����騩 ������� ���㫥���}
                 if a[k,k]<>0 then
                      k1:=a[k,k]
                 else
                 {� ��⨢��� ��砥: ����⠭���� ��ப,...}
                    begin
                      l:=k;
                      repeat
                       l:=l+1
                       {�饬 ���� ���㫥��� ������� ������� �⮫��,
                        ���騩 ���� ��������쭮��,...}
                      until (a[l,k]<>0) or (l=n+1);
                      {�᫨ ⠪�� ������� ������,... }
                      if l<=n then
                        begin
                         {...���塞 ��ப� ���⠬�,...}
                          movestrings(k,l,a,n);
                          {...��।���⥤� 㬭������� �� -1,...}
                          d:=d*(-1);
                          {...��।������ ���祭�� ����饣� ������� - k1,...}
                          k1:=a[k,k];
                          {(��� ��蠣���� �뢮�� �८�ࠧ������ ��אַ�� 室�
                          ᭨��� �������਩ � ᫥����� ���� �����஢)}
                          write('�८�ࠧ������ ',k);readln;wywod;
                        end
                      else
                        {� ��⨢��� ��砥 ⠪�� ������� ���������,
                         �� ����砥�, �� ��।���⥫� ��⥬� ࠢ�� ���}
                        begin
                          det:=0;
                          {��室 �� ��楤���}
                          exit;
                        end;
                    end;
                if d<>0 then
                {���⠭�� �� ������ i-�� ��ப�, ����饩 ���� k-��,...}
                   for i := k+1 to n do
                      begin
                       k2:=a[i,k];
                        {...���⠭�� k-�� ��ப�, 㬭������� �� �����樥��}
                        for j := k to  n+1   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{横� �� i}
                     d:=d*a[k,k]; readln;wywod; writeln('d=',d:5:2);
               end;{横� �� k}
               det:=d*a[n,n];
     {��।���⥫� ��⥬� ࠢ�� �ந�������� ����������� ������⮢}
    end;{prhod}
Begin
   clrscr;
   {��室��� ����� - ��⮢� �ਬ��}
   a[1,1] := 0;  a[1,2] :=0;  a[1,3] :=0;  a[1,4]:=2;
   a[2,1] := 7;  a[2,2] :=2;  a[2,3] :=0;  a[2,4]:=1;
   a[3,1] := 14; a[3,2] :=14; a[3,3] := 0; a[3,4]:=11;
   a[4,1] := 0;  a[4,2] :=0;  a[4,3] :=1;  a[4,4]:=1;
   {��室��� �����}
   wywod;
   {�८�ࠧ������ ������ - "��אַ� 室" ��⮤� �����}
   prhod(a,n,det);
   {�뢮� �८�ࠧ������� ������}
   writeln('����� ��᫥ �८�ࠧ������');wywod;
   write('��।���⥫� ࠢ�� ',det:7:3); readln;
End.
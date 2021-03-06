program Metod_Gaussa_SLAU;
{��襭�� ��⥬� n �������� �����ࠨ�᪨� �ࠢ����� c n ��������묨
��⮤�� �����}
 uses crt;
  const
       n=4;{�᫮ �ࠢ�����, �᫮ ����������,�᫮ ��ப
            ���७��� ������}
  type
       vector = array[1..n+1] of real;
       matrica= array[1..n] of vector;

  var
       a: matrica; {���७��� ����� ��⥬� n ��ப, n+1 ����������}
       i,j : integer;
       det  : real; {��।���⥫� ��⥬� �ࠢ�����}
       x:array[1..n] of real; {��������� ��⥬� �ࠢ�����}
  procedure wywod;
    {�뢮� �c�७��� ������: ������ ��ப� - ᮮ⢥�����
     �ࠢ�����, ���� n �ᥫ ������ ��ப� -  �����樥��� ��।
     ��������묨, n+1-�� (��᫥����) - ᢮����� 童� �ࠢ�����}
      var  i,j:integer;
    begin
       for i:=1 to n do
                 begin
                    for j:=1 to n+1 do
                       write (a[i,j]:5:2,' ');
                    writeln;
                 end;
    end;{wywod}
  procedure movestrings(k,l:integer; var a: matrica; n:integer);
  {��楤�� ����⠭���� k-�� � l-�� ��ப � ����� � ���浪� n}
     var j : integer;
         r : real;
    begin
     if (k<=n) and (l<=n)then
       begin
         for j := 1 to n+1 do
           begin
            r := a[l,j];
            a[l,j] :=a[k,j];
            a[k,j] := r;
           end;
       end
    end; {movestrings}
  procedure prhod(var a:matrica; n : integer; var det: real);
    {�८�ࠧ������ ������ �, ࠧ��୮�� n � ���᫥��� ��।���⥫� det -
     "��אַ� 室" ��⮤� �����}
       var i,j,k,l : integer;
         b : matrica;
         k1,k2:real;
    begin
     det:=1;
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
                          det:=det*(-1);
                          {...��।������ ���祭�� ����饣� ������� - k1,...}
                          k1:=a[k,k];
                          {(��� ��蠣���� �뢮�� �८�ࠧ������ ��אַ�� 室�
                          ᭨��� �������਩ � ᫥����� ���� �����஢)}
                          {wywod;
                          readln;}
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
                if det<>0 then
                {���⠭�� �� ������ i-�� ��ப�, ����饩 ���� k-��,...}
                   for i := k+1 to n do
                      begin
                       k2:=a[i,k];
                        {...���⠭�� k-�� ��ப�, 㬭������� �� �����樥��}
                        for j := k to  n+1   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{横� �� i}
               end;{横� �� k}
     {��।���⥫� ��⥬� ࠢ�� �ந�������� ����������� ������⮢}
     for i := 1 to n do
          det := det*a[i,i];
    end;{prhod}
  procedure obrhod(a:matrica; n : integer);
    {��宦����� ��୥� "����� 室" ��⮤� �����}
       var i,j,i1,j1 : integer;
     begin
      if det<>0 then
        begin
         x[n]:=a[n,n+1]/a[n,n];
         for i:=1 to n-1 do
               begin
                  for j:=i to n-1 do
                     a[n-j,n+1]:= a[n-j,n+1]-x[n-i+1]*a[n-j,n-i+1];
                  x[n-i]:=a[n-i,n+1]/a[n-i,n-i];
               end;
         writeln('��襭�� ��⥬�');
         for i:=1 to n do write('x',i:1,'=',x[i]:5:2,' ');
         writeln
        end
      else write('��।���⥫� ࠢ�� ���')
     end;{obrhod}
Begin
   clrscr;
   {��室��� ����� - ��⮢� �ਬ��}
   a[1,1] := 7; a[1,2] := 2; a[1,3] := 1; a[1,4]:=0;  a[1,5]:=11;
   a[2,1] := 0; a[2,2] :=5; a[2,3] :=-3; a[2,4]:=-2; a[2,5]:=-15;
   a[3,1] := 16; a[3,2] :=12; a[3,3] := 0; a[3,4]:=11;  a[3,5]:=19;
   a[4,1] := 0; a[4,2] := 17; a[4,3] :=25; a[4,4]:=0;  a[4,5]:=-9;
   writeln('��室��� ���७��� ����� ��⥬�');
   wywod;writeln;
   {�८�ࠧ������ ������ - "��אַ� 室" ��⮤� �����}
   prhod(a,n,det);
   {�뢮� �८�ࠧ������� ������}
   writeln('����७��� ����� ��᫥ ��אַ�� 室� ��⮤� �����');
   wywod;
   writeln('��।���⥫� ࠢ�� ',det:5:2);
   obrhod(a,n);
   readln;
End.
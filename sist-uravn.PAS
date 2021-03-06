program Obratnaya_matrica_metod_Gaussa;
{��襭�� ��⥬� n �ࠢ����� � n ��������묨 ���� ��宦�����
 ���⭮� ������}
 uses crt;
  const
       n=3;{�᫮ ��ப}
  type
       vector = array[1..n] of real;
       matrica= array[1..n,1..2*n] of real;

  var
       a: matrica;
       b: vector;
       i,j : integer;
       det,v  : real; {det -��।���⥫� ������}
  procedure dopolnenie(var a:matrica;n:integer);
   var i,j:integer;
    begin
     for i:=1 to n do
      for j:=1 to n do
      begin
        a[i,j+n] := 0;
        a[i,i+n]:=1;
      end
     end;
  procedure wywod;
    {�뢮� ������}
      var  i,j:integer;
    begin
       for i:=1 to n do
                 begin
                    for j:=1 to 2*n do
                       write (a[i,j]:5:2,' ');
                    writeln;
                 end;
                 {writeln;}
    end;{wywod}
  procedure movestrings(k,l:integer; var a: matrica; n:integer);
  {��楤�� ����⠭���� k-�� � l-�� ��ப � ����� � ���浪� n}
     var j : integer;
         r : real;
    begin
     if (k<=n) and (l<=n)then
       begin
         for j := 1 to 2*n do
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
                        for j := k to  2*n   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{横� �� i}
               end;{横� �� k}
     {��।���⥫� ��⥬� ࠢ�� �ந�������� ����������� ������⮢}
     for i := 1 to n do
          det := det*a[i,i];
    end;{prhod}
  procedure obrhod(var a:matrica; n : integer);
      {�८�ࠧ������ ������ �, ࠧ��୮�� n � ���᫥��� ��।���⥫� det -
       ᮮ⢥����� "��אַ�� 室�" ��⮤� �����}
         var i,j,k,l : integer;
           k1,k2:real;
      begin
       if det<>0 then
        begin
         for k := n downto 2 do
                begin
                            k1:=a[k,k];
                  {���⠭�� �� ������ i-�� ��ப�, ����饩 ���� k-��,...}
                     for i := 1 to k-1 do
                        begin
                         k2:=a[i,k];
                          {...���⠭�� k-�� ��ப�, 㬭������� �� �����樥��}
                          for j := k to  2*n   do
                              a[i,j] := a[i,j]-a[k,j]*k2/k1;
                        end;{横� �� i}
                 end;{横� �� k}
        end;
      end;{obrhod}
Begin
   clrscr;
   writeln('��室��� ���� - ',n:2,' �ࠢ����� � �⮫쪮 �� ����������');
   {a[i,j] -��室��� ����� b[i]- ����� ᢮������ 童���}
   a[1,1] := -1;   a[1,2] :=2;  a[1,3] :=9; b[1]:=-9;
   a[2,1] :=  2;   a[2,2] :=1;  a[2,3] :=0; b[2]:= 5;
   a[3,1] :=  3;   a[3,2] :=2;  a[3,3] :=1; b[3]:= 7;
  for i:=1 to n do
      begin
        for j:=1 to n-1 do
          write(a[i,j]:5:2,'*x[',i:1,'] + ');
        write(a[i,n]:5:2,'*x[',n:1,'] = ',b[i]:5:2);
        writeln;
      end;
   writeln('����������� �����');
   dopolnenie(a,n);wywod;
   writeln('��אַ� 室');
   {�८�ࠧ������ ������ - "��אַ� 室" ��⮤� �����}
   prhod(a,n,det);
   wywod;
   writeln('����� 室');
   obrhod(a,n);wywod;
   for i:=1 to n do
    begin
     v:=a[i,i];
     for j:=1 to 2*n do
      a[i,j]:=a[i,j]/v;
    end;
   writeln('���⭠� �����');
   for i:=1 to n do
          begin
            for j:=1 to n do
               write (a[i,j+n]:5:2,' ');
               writeln;
          end;
   writeln('��襭�� ��⥬�');
   for i:=1 to n do
    begin
      v:=0;
      for j:=1 to n do
       begin
        v:=v+a[i,j+n]*b[j];
       end;
      write('x[',i:1,']=',v:5:2,'  ');
    end;
    writeln;readln;
End.
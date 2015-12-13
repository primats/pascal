program Obratnaya_matrica_metod_Gaussa;
{Решение системы n уравнений с n неизвестными путём нахождения
 обратной матрицы}
 uses crt;
  const
       n=3;{число строк}
  type
       vector = array[1..n] of real;
       matrica= array[1..n,1..2*n] of real;

  var
       a: matrica;
       b: vector;
       i,j : integer;
       det,v  : real; {det -определитель матрицы}
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
    {Вывод матрицы}
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
  {Процедура перестановки k-ой и l-ой строк в матрице а порядка n}
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
    {Преобразование матрицы а, размерности n и вычисление определителя det -
     соответствует "прямому ходу" метода Гаусса}
       var i,j,k,l : integer;
         k1,k2:real;
    begin
     det:=1;
     for k := 1 to n-1 do
               begin
                 {Если ведущий элемент ненулевой}
                 if a[k,k]<>0 then
                      k1:=a[k,k]
                 else
                 {В противном случае: перестановка строк,...}
                    begin
                      l:=k;
                      repeat
                       l:=l+1
                       {ищем первый ненулевой элемент данного столбца,
                        стоящий ниже диагонального,...}
                      until (a[l,k]<>0) or (l=n+1);
                      {если такой элемент найден,... }
                      if l<=n then
                        begin
                         {...меняем строки местами,...}
                          movestrings(k,l,a,n);
                          {...определитедь умножается на -1,...}
                          det:=det*(-1);
                          {...определение значения ведущего элемента - k1,...}
                          k1:=a[k,k];
                          {(для пошаговго вывода преобразований прямого хода
                          снимите комментарий у следующих двух операторов)}
                          {wywod;
                          readln;}
                        end
                      else
                        {В противном случае такой элемент отсутствует,
                         что означает, что определитель системы равен нулю}
                        begin
                          det:=0;
                          {выход из процедуры}
                          exit;
                        end;
                    end;
                if det<>0 then
                {Вычитание из каждой i-ой строки, лежащей ниже k-ой,...}
                   for i := k+1 to n do
                      begin
                       k2:=a[i,k];
                        {...вычитание k-ой строки, умноженной на коэффициент}
                        for j := k to  2*n   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{цикл по i}
               end;{цикл по k}
     {Определитель системы равен произведению диагональных элементов}
     for i := 1 to n do
          det := det*a[i,i];
    end;{prhod}
  procedure obrhod(var a:matrica; n : integer);
      {Преобразование матрицы а, размерности n и вычисление определителя det -
       соответствует "прямому ходу" метода Гаусса}
         var i,j,k,l : integer;
           k1,k2:real;
      begin
       if det<>0 then
        begin
         for k := n downto 2 do
                begin
                            k1:=a[k,k];
                  {Вычитание из каждой i-ой строки, лежащей ниже k-ой,...}
                     for i := 1 to k-1 do
                        begin
                         k2:=a[i,k];
                          {...вычитание k-ой строки, умноженной на коэффициент}
                          for j := k to  2*n   do
                              a[i,j] := a[i,j]-a[k,j]*k2/k1;
                        end;{цикл по i}
                 end;{цикл по k}
        end;
      end;{obrhod}
Begin
   clrscr;
   writeln('Исходная СЛАУ - ',n:2,' уравнения и столько же неизвестных');
   {a[i,j] -исходная матрица b[i]- вектор свободных членов}
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
   writeln('Дополненная матрица');
   dopolnenie(a,n);wywod;
   writeln('Прямой ход');
   {Преобразование матрицы - "прямой ход" метода Гаусса}
   prhod(a,n,det);
   wywod;
   writeln('Обратный ход');
   obrhod(a,n);wywod;
   for i:=1 to n do
    begin
     v:=a[i,i];
     for j:=1 to 2*n do
      a[i,j]:=a[i,j]/v;
    end;
   writeln('Обратная матрица');
   for i:=1 to n do
          begin
            for j:=1 to n do
               write (a[i,j+n]:5:2,' ');
               writeln;
          end;
   writeln('Решение системы');
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
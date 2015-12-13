
program nahogdenie_opredelitelya_metodom_Gaussa;
{Нахождение определителя путем приведения матрицы к треугольной форме}
 uses crt;
  {label 1,2;}
  const
       n=4;{число строк, число столбцов; можно изменить}
  type
       vector = array[1..n] of real;
       matrica= array[1..n] of vector;

  var
       a: matrica;
       i,j : integer;
       det  : real; {определитель матрицы}
  procedure wywod;
    {Вывод матрицы}
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
  {Процедура перестановки k-ой и l-ой строк в матрице а порядка n}
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
    {Преобразование матрицы а, размерности n и вычисление определителя det -
     соответствует "прямому ходу" метода Гаусса}
       var i,j,k,l : integer;
         b : matrica;
         k1,k2,d:real;
    begin
     d:=1;
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
                          d:=d*(-1);
                          {...определение значения ведущего элемента - k1,...}
                          k1:=a[k,k];
                          {(для пошаговго вывода преобразований прямого хода
                          снимите комментарий у следующих двух операторов)}
                          write('Преобразование ',k);readln;wywod;
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
                if d<>0 then
                {Вычитание из каждой i-ой строки, лежащей ниже k-ой,...}
                   for i := k+1 to n do
                      begin
                       k2:=a[i,k];
                        {...вычитание k-ой строки, умноженной на коэффициент}
                        for j := k to  n+1   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{цикл по i}
                     d:=d*a[k,k]; readln;wywod; writeln('d=',d:5:2);
               end;{цикл по k}
               det:=d*a[n,n];
     {Определитель системы равен произведению диагональных элементов}
    end;{prhod}
Begin
   clrscr;
   {Исходная матрица - тестовый пример}
   a[1,1] := 0;  a[1,2] :=0;  a[1,3] :=0;  a[1,4]:=2;
   a[2,1] := 7;  a[2,2] :=2;  a[2,3] :=0;  a[2,4]:=1;
   a[3,1] := 14; a[3,2] :=14; a[3,3] := 0; a[3,4]:=11;
   a[4,1] := 0;  a[4,2] :=0;  a[4,3] :=1;  a[4,4]:=1;
   {Исходная матрица}
   wywod;
   {Преобразование матрицы - "прямой ход" метода Гаусса}
   prhod(a,n,det);
   {Вывод преобразованной матрицы}
   writeln('Матрица после преобразований');wywod;
   write('Определитель равен ',det:7:3); readln;
End.
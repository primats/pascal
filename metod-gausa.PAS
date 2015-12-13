program Metod_Gaussa_SLAU;
{Решение системы n линейных алгебраических уравнений c n неизвестными
методом Гаусса}
 uses crt;
  const
       n=4;{число уравнений, число неизвестных,число строк
            расширенной матрицы}
  type
       vector = array[1..n+1] of real;
       matrica= array[1..n] of vector;

  var
       a: matrica; {расширенная матрица системы n строк, n+1 неизвестных}
       i,j : integer;
       det  : real; {определитель системы уравнений}
       x:array[1..n] of real; {неизвестные системы уравнений}
  procedure wywod;
    {Вывод раcширенной матрицы: каждая строка - соответствует
     уравнению, первые n чисел каждой строки -  коэффициенты перед
     неизвестными, n+1-ое (последнее) - свободный член уравнения}
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
  {Процедура перестановки k-ой и l-ой строк в матрице а порядка n}
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
    {Преобразование матрицы а, размерности n и вычисление определителя det -
     "прямой ход" метода Гаусса}
       var i,j,k,l : integer;
         b : matrica;
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
                        for j := k to  n+1   do
                            a[i,j] := a[i,j]-a[k,j]*k2/k1;
                      end;{цикл по i}
               end;{цикл по k}
     {Определитель системы равен произведению диагональных элементов}
     for i := 1 to n do
          det := det*a[i,i];
    end;{prhod}
  procedure obrhod(a:matrica; n : integer);
    {Нахождение корней "обратный ход" метода Гаусса}
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
         writeln('Решение системы');
         for i:=1 to n do write('x',i:1,'=',x[i]:5:2,' ');
         writeln
        end
      else write('Определитель равен нулю')
     end;{obrhod}
Begin
   clrscr;
   {Исходная матрица - тестовый пример}
   a[1,1] := 7; a[1,2] := 2; a[1,3] := 1; a[1,4]:=0;  a[1,5]:=11;
   a[2,1] := 0; a[2,2] :=5; a[2,3] :=-3; a[2,4]:=-2; a[2,5]:=-15;
   a[3,1] := 16; a[3,2] :=12; a[3,3] := 0; a[3,4]:=11;  a[3,5]:=19;
   a[4,1] := 0; a[4,2] := 17; a[4,3] :=25; a[4,4]:=0;  a[4,5]:=-9;
   writeln('Исходная расширенная матрица системы');
   wywod;writeln;
   {Преобразование матрицы - "прямой ход" метода Гаусса}
   prhod(a,n,det);
   {Вывод преобразованной матрицы}
   writeln('Расширенная матрица после прямого хода метода Гаусса');
   wywod;
   writeln('Определитель равен ',det:5:2);
   obrhod(a,n);
   readln;
End.
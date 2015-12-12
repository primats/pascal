# Пузырьковая сортировка
Program Sort;
 Const
 Nmax = 100;
 Var
 X : Array [1..Nmax] Of Real;
 A : Real;
 n, k, i : Integer;

Begin
 Writeln('Введите количество чисел');
 Readln(n);
 Writeln('Введите массив чисел');
 For i := 1 To n Do Read (X[i]);
 { Сортировка }
 For k := 1 To n-1 Do
 For i := 1 To n-1 Do
 If X[i] > X[i+1] Then
 Begin
 A:=X[i];
 X[i]:=X[i+1];
 X[i+1]:=A
 End;
 Writeln('Отсортированный массив чисел:');
 For i:=1 To n Do
 Write (X[i]);
End.

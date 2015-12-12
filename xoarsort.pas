# Быстрая сортировка по возрастанию массива A из N целых чисел.

program Quick_Sort; 
 var A:array[1..100] of integer; 
 N,i : integer; 
 {В процедуру передаются левая и правая границы сортируемого фрагмента} 

procedure QSort(L,R:integer); 
 var X,y,i,j:integer; 
begin 
 X:=A[(L+R) div 2]; 
 i:=L; j:=R; 
 while i<=j do 
 begin 
 while A[i]X do j:=j-1; 
 if i<=j then 
 begin 
 y:=A[i]; A[i]:=A[j]; A[j]:=y; 
 i:=i+1; j:=j-1; 
 end; 
 end; 
 if L < j then QSort(L,j); 
 if i < R then QSort(i,R); 
end; 

begin 
 write('количество элементов массива '); 
 read(N); 
 for i:=1 to n do read(A[i]); 
 QSort(1,n); {упорядочить элементы с первого до n-го} 
 for i:=1 to n do write(A[i],' '); {упорядоченный массив} 
end.

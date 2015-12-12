# Сортировка выбором по возрастанию. 

program Sort_Vybor1; 
 var A:array[1..100] of integer; 
 N,i,m,k,x : integer; 

begin 
 write('количество элементов массива '); 
 read(N); 
 for i:=1 to n do read(A[i]); 
 for k:=n downto 2 do {k- количество элементов для поиска max } 
 begin 
 m:=1; { m - место max } 
 for i:=2 to k do if A[i]>A[m] then m:=i; 
 {меняем местами элементы с номером m и номером k} 
 x:=A[m]; A[m]:=A[k]; A[k]:=x; 
 end; 
 for i:=1 to n do write(A[i],' '); {упорядоченный массив} 
end. 

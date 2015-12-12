# Шейкерная сортировка по возрастанию массива A. 

program Shaker; 
 var A:array[1..100] of integer; 
 N,i,k,x,j,d : integer; 

begin 
 write('количество элементов массива '); 
 read(N); 
 for i:=1 to n do read(A[i]); 
 d:=1; i:=0; 
 for k:=n-1 downto 1 do { k - количество сравниваемых пар } 
 begin 
 i:=i+d; 
 for j:=1 to k do 
 begin 
 if (A[i]-A[i+d])*d>0 then 
 {меняем местами соседние элементы} 
 begin x:=A[i]; A[i]:=A[i+d]; A[i+d]:=x; end; 
 i:=i+d; 
 end; 
 d:=-d; 
 {меняем направление движения на противоположное}
 end; 
 for i:=1 to n do write(A[i],' '); {упорядоченный массив} 
end.

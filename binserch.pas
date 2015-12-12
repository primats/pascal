# Поиск в упорядоченном по возрастанию массиве первого вхождения числа X. 

program Poisk3a; 
 var A:array[1..100] of integer; 
 N,X,left,right:integer; 
begin 
 read(N); {N<=100} 
 write('введите упорядоченный по возрастанию массив'); 
 for i:=1 to N do read(A[i]); 
 read(X); 
 left:=1; right:=N; 
 {левая и правая граница фрагмента для поиска} 
 while left begin 
 c:=(left + right) div 2; 
 {середина с округлением в меньшую сторону} 
 if X>A[c] then 
 {если массив упорядочен по убыванию, то if X left:=c+1 
 {выбираем правую половину без середины, меняя left} 
 else right:=c; 
 {выбираем левую половину с серединой, меняя right} 
 end; 
 if X=A[left] then {здесь left = right, но не всегда = c} 
 write('первое вхождение числа ',X,' в массив A на ',left,' месте') 
 else write('не нашли'); 
end. 

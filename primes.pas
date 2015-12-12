# Вывод всех простых чисел до 500 
const LIMIT = 500;
var i,j,lim : word;

begin { основная программа }
 writeln; {перевод строки, начинаем с новой строки}
 for i:=1 to LIMIT do 
 begin 
 j:=2;
 lim:=round(sqrt(i));
 while (i mod j <> 0) and (j <= lim) do inc( j );
 if (j > lim) then write( i,' ' );
 end;
end.

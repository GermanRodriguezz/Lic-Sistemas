program practica0;
var ale,i,a,b,n : integer;

begin
randomize;
writeln('ingrese un numero A');
readln(a);

writeln('ingrese un numero B');
readln(b);

writeln('ingrese numero N');
readln(n);

for i := 1 to n do begin
	ale := random(b-a+1)+a;
	writeln('el numero aleatorio generado fue ', ale);
	end;
end.


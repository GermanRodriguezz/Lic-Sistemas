program adicional; 

type reclamo= record 
	codigo:integer;
	dni: integer;
	anio:integer;
	tipo:string;
	end; 
	
	re = record
	codigo:integer;
	anio:integer;
	tipo:string;
	end;
	
	lista= ^nodolista;
	nodolista = record
		dato: re;
		sig: lista;
	end;
	
reclamo2 = record
	dni: integer;
	listareclamo : lista;
end;


arbol = ^nodoarbol;
nodoarbol = record
	dato: reclamo2;
	hi: arbol;
	hd: arbol;
end;


listanueva= ^nodonuevo;
nodonuevo=record 
	dato:integer; 
	sig:listanueva;
	end; 


procedure leer(var r:reclamo);
begin
writeln('ingrese codigo'); readln ( r.codigo);
if (r.codigo <> 0) then begin 
	r.dni:=random (1000); writeln('el dni ', r.dni); 
	writeln('ingrese tipo'); readln (r.tipo);	
	r.anio:=2000 + random(25)+1; writeln ('el anio ',   r.anio);  
end; 
end; 

procedure agregarLista(var l:lista ; r:re);
var nue:lista;
begin 
new(nue);
nue^.dato:= r;
nue^.sig:=l;
l:=nue;
end; 

procedure insertamos(var a : arbol; r: reclamo);
var
	rec: re; 
begin
	if a = nil then begin
		new(a);
		a^.dato.dni := r.dni;
		a^.dato.listareclamo := nil;
		rec.codigo := r.codigo;
		rec.anio := r.anio;
		rec.tipo := r.tipo;
		agregarLista(a^.dato.listareclamo,rec);
		a^.hi := nil;
		a^.hd:= nil;
		end
		else if a^.dato.dni = r.dni then begin
			rec.codigo := r.codigo;
			rec.anio := r.anio;
			rec.tipo := r.tipo;
			agregarLista(a^.dato.listareclamo,rec);
		end
			else if a^.dato.dni > r.dni then
				insertamos(a^.hi,r)
				else
					insertamos(a^.hd,r);
end;

procedure cargarArbol (var a:arbol);
var r:reclamo;
begin 
leer(r); 
while(r.codigo <> 0 ) do begin 
	insertamos(a,r); 
	leer(r);
end; 
 end; 
 
 function calcular (l:lista): integer; 
 var
	c: integer;
 begin
	c:=0;
	while l <> nil do begin
		c := c + 1;
		l:=l^.sig;
 end;
 calcular:= c; 
 end; 
 
procedure incisoB(a:arbol ; dni:integer ; var cantidad:integer); 
var
l:lista;
begin 
if ( a <> nil) then 
	if (a^.dato. dni = dni ) then begin
		l:=a^.dato.listareclamo;
		cantidad:= calcular(l); 
		end
	else 
			if (a^.dato. dni >dni ) then 
				incisoB(a^.hi,dni,cantidad)
			else 
					incisoB(a^.hd,dni,cantidad); 
end;  
 
procedure calcular (l:lista; var t: integer);
begin
	while l <> nil do begin
		t := t+1;
		l:= l^.sig;
	end;
end;
 
 procedure incisoC(a: arbol; d1,d2: integer; var total: integer);
 begin
	if a <> nil then begin
		if a^.dato.dni >= d1 then
			if a^.dato.dni <= d2 then begin
				calcular(a^.dato.listareclamo,total);
				incisoC(a^.hi,d1,d2,total);
				incisoC(a^.hd,d1,d2,total);
				end
			else
				if a^.dato.dni <d2	then 
					incisoC(a^.hi,d1,d2,total)
		else
			 if a^.dato.dni > d1 then
				incisoC(a^.hd,d1,d2,total);
 end;
 end;
 
 
 procedure agregaranio ( cod:integer ; var ln:listanueva); 
 var  nue:listanueva;
 begin 
		new(nue); 
		nue^.dato:=cod;
		nue^.sig:=ln; 
		ln:=nue; 
 end;
 
 procedure retornar (l: lista ; anio: integer; var  ln:listanueva); 
 begin 
 while(l <> nil) do begin 
	if(l^.dato.anio = anio) then 
		agregaranio(l^.dato.codigo , ln); 
	l:=l^.sig;
end;  
 end; 
 
 
 procedure incisoD(a:arbol ; anio:integer; var ln:listanueva); 
 begin 
 if (a <> nil) then begin
	retornar (a^.dato.listareclamo , anio , ln ); 
	incisoD(a^.hi, anio, ln);
	incisoD(a^.hd, anio, ln ); 
 end; 
 end;
 
var a:arbol;  D,cantidad:integer;
dni1,dni2,total: integer; 
ln:listanueva; anio:integer; 
begin
a:=nil ; 
randomize;
cargarArbol(a); 
writeln ('ingrese dni'); readln (D); 
cantidad:=0; 
incisoB(a, D, cantidad); writeln ('la cantidad de reclamos de ese dni fue', cantidad); 

writeln('																			');  


writeln('ingrese parametro 1'); readln(dni1);
writeln('ingrese parametro 2'); readln(dni2);
total := 0;
incisoC(a,dni1,dni2,total);
	writeln('los reclamos totales de los dni entre esos parametros son ',total);

writeln('																			');  

ln:=nil; 
writeln ('ingrese un año'); readln (anio); 
incisoD(a,anio, ln);

end.

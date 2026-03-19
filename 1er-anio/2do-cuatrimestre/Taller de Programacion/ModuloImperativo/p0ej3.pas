type

subrangoStock : 1...1000;

 tabla = array [subrangoStock] of info
  info = record
	precio : real; 
	stock : integer;
	end;
	
 vectorProdu = array [subrangoStock] of integer;
 
 lista = ^nodo;
 nodo = record
 dato: ticket;
 sig: lista;
 end;
 
venta = record
	codVenta : integer;
	producVendidos : integer;
	end;
producto = record
	cod : subrangoStock;
	cantUnidadesSoli: integer;
	end;
ticket = record
	codigoVen: integer;
	detalle : deta;
	montoTotal : real;
	end;
 deta = record
	cProdu : subrangoStock;
	cantidad : integer;
	precioUni : real;
	end;
	
procedure leerVenta( var v : venta)
begin
	readln(v.codVenta);
	while(v.codVenta <> -1) do begin
		readln(v.producVendidos);
		readln(v.codVenta);
		end;
end;

procedure LeerProduc(var p: producto);
begin
	readln(p.cantUnidadesSoli);
	while (p.cantUnidadesSoli <> 0) do begin
		readln(p.cod);
		readln(p.cantUnidadesSoli);
		end;
end;






















	
	

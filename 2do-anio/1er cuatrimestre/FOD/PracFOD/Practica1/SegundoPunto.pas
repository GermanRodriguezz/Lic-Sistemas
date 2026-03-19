program puntos2;
type
    archivo_int = file of integer;
var
    archivo:archivo_int;
    numero, suma, contador, menores1500:integer;
    promedio:real;
BEGIN
    assign(archivo, 'ArchivoNumeros');
    reset(archivo);
    suma:=0;
    contador:=0;
    menores1500:=0;
    writeln('Contenido del archivo: ');

    //leemos y procesamos el archivo
    while (not eof(archivo))do begin
        read(archivo, numero);
        writeln(numero);
        suma := suma + numero;
        contador := contador+1;
        if(numero < 1500)then menores1500:= menores1500 + 1;
    end;
    promedio:= (suma/contador);
    writeln('La cantidad de numeros menores a 1500 son: ', menores1500);
    writeln('El promedio de los numeros del archivo: ', promedio:2:2);
    close(archivo);
END.

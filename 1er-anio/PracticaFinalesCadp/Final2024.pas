///1
program final;
type
var
begin
end.

///2
programa B = es valido y funciona, el unico error que tiene es que la variable "d", al ser un vector no sera posible su pasaje por parametro.
programa A = es valido y funciona, cambia la asignacion de la variable "d", en este caso la varible si puede ser pasada por parametros ya que es de tipo vector.

///3
calculo de memoria estatica = constantes y variables globales
                              v: vector , i, cant : integer; e : registro;
                              v = 272*80;
                              i = 4;
                              cant = 4;
                              e = 272;
                              272*80 + 8 + 272 
                              272*80 + 280 bytes
calculo de memoria dinamica = se reservaran 40 veces espacios en la memoria
                              el cada espacio de memoria ocupa 4 bytes ^integer,
                              40 * 4 -> 160 bytes.
///4
calcular tiempo ejecucion
for i := 1 to 80 do begin                       (3N + 2) + N(CUERPO)  
                                                N = (80 - 1) + 1 = 80
                                                (3*80) + 2 + 80(3) = 242 + 240 = 482 UT

    if (i mod 2 = 0) then                       2 UT
        new()
    else
        v[i].datos  := nil                      1 UT = 3 UT
    end;

    i := 0;                                     1 UT

    while (i <= 80) and (e.nombre <> zzz) do begin          C(N + 1) + N(CUERPO) 
                                                            C =  3
                                                            N = 80
                                                            CUERPO = 5
                                                            3 (80 + 1) + 80 (5)
                                                            243 + 400 = 643 UT 

                                                            486 + 643 UT
                                                            643 + 1 = 644 UT

        cant := 0;                                          1 UT 

        if (v[i].nota > 5) then                             1 UT
            cant := cant + 1;                               1 UT = 2 UT
        i := i + 1;                                         2 UT
                                                            = 4 UT
    end;
end;

482 + 644 UT
///5
a)
FALSO : el tipo de dato REAL es simple pero no puede ser un subrango, los subrango tienen que ser de tipo ordinales
b)
FALSO : 
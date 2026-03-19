import this

zen_text = this.s #copio el texto zen
palabras = zen_text.splitlines() # divido el texto en lineas
lista = 'AEIOUaeiou' #me guardo las vocales a buscar en las segundas palabras de mi

def verificar_vocal(palabra) : # recibo la linea de palabras del texto
    p = palabra.split() #divido en palabras, y guardo la linea de texto en la variable p
    if len(p) > 1 : # si tengo mas de una palabra,evaluo la segunda
        p2 = p[1] # me guardo la segunda palabra de la linea
        if p2[0] in lista : # si cumple con la condicion retornara True
            print('PALABRA QUE CUMPLE LA CONDICION : ',p2)
            return True
    return False # en caso de que no tengo segunda palabra la linea retorna Flase

for palabra in palabras: #voy a recorrer la lista de palabras separas por lineas
    if verificar_vocal(palabra): # invoco a la funcion
        print('Palabra : ' ,palabra)


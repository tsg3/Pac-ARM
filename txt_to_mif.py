def obtenerCodigo():
    archivo = open('C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Pac-ARM/code.txt', 'r+')
    lineas = [linea for linea in archivo]
    archivo.close()
    linea = lineas[0].replace('\\x', '')
##    codigo = hexToBin(linea)
    n = len(linea) // 8
    archivo = open('C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Pac-ARM/code.dat', 'w')
    for i in range(32):
        if (i < n):
            archivo.write(linea[8 * i:8 * (i + 1)] + '\n')
        else:
            archivo.write('00000000\n')
    archivo.close()
##    archivo = open('C:/Users/este0/Desktop/Esteban/TEC/2019 - II Semestre/Taller de Diseno Digital/Pac-ARM/code.mif', 'w')
##    archivo.write('DEPTH = 32;\n')
##    archivo.write('WIDTH = 8;\n')
##    archivo.write('ADDRESS_RADIX = DEC;\n')
##    archivo.write('DATA_RADIX = BIN;\n')
##    archivo.write('CONTENT\nBEGIN\n')
##    print(codigo)
##    for i in range(32):
##        if(i < n):
##            archivo.write(str(i) + ' : ' + codigo[8 * i:8 * (i + 1)] + ';\n')
##        else:
##            archivo.write(str(i) + ' : 00000000;\n')
##    archivo.write('END;\n')
##    archivo.close()

def hexToBin(linea):
    codigo = ''
    numeros = {
        '0': '0000',
        '1': '0001',
        '2': '0010',
        '3': '0011',
        '4': '0100',
        '5': '0101',
        '6': '0110',
        '7': '0111',
        '8': '1000',
        '9': '1001',
        'a': '1010',
        'b': '1011',
        'c': '1100',
        'd': '1101',
        'e': '1110',
        'f': '1111'}
    for i in linea:
        codigo = codigo + numeros.get(i, '?')
    return codigo

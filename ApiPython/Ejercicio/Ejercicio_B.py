from math import sqrt

def F(n):
    return ((1+sqrt(5))**n-(1-sqrt(5))**n)/(2**n*sqrt(5))

def Fibonacci(startNumber, endNumber):
    lista = []
    n = 0
    cur = F(n)
    while cur <= endNumber:
        if startNumber <= cur:
            lista.append( es_primo(int(cur), cur)) 
        n += 1
        cur = F(n)
    #print(lista)
    return lista.pop()
        
def es_primo(num, num_ant):
    for n in range(2, num):
        if num % n == 0:
            #print("No es primo")
            return ""  
    #print("Es primo")
    if (num < num_ant):
        #print("Es mayor")
        sumDigit, extNum = 0, 0
        numEntero = num
        while numEntero != 0:
            extNum = numEntero % 10
            numEntero //= 10
            sumDigit += extNum
        return num, sumDigit

rta = (Fibonacci(1, 100))

print(f"La suma de los digitos del numero primo más grande que se puede encontrar en los primeros 100 elementos de la sucesion de Fibonacci es: {rta[1]} ")



  
    
    

    































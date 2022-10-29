import numpy as np
import matplotlib.pyplot as plt 
import datetime
import pandas as pd
from scipy import stats

divisas = np.loadtxt('divisas.txt',skiprows=1,delimiter=',',dtype=object)
#print(divisas)
#print("")
ventas = np.loadtxt('ventas.txt',skiprows=1,delimiter=',',dtype=object)
#print(ventas)

meses = [31,29,31,30,31,30,31,31,30,31,30,31]
#print(int(divisas[0][1]))

#print(len(divisas))

emp_a_ventas = []

for i in range(0,len(divisas)):
    emp_a_ventas.append(int(divisas[i][1]) * float(ventas[i][3]))
#print(emp_a_ventas)

emp_b_ventas = []
for x in range(366, 732):
    emp_b_ventas.append(int(divisas[x-366][2]) * float(ventas[x][3]))
#print(len(emp_b_ventas))

emp_c_ventas = []
for s in range(732, 1098):
    emp_c_ventas.append(float(ventas[s][3]))
#print(len(emp_c_ventas))

# ANALISIS DE DATOS, TABLA DE EXCEL DE ESTADISTICA DESCRIPTIVA

mediaA = round(np.mean(emp_a_ventas),2)
medianaA =  round(np.median(emp_a_ventas), 2)
desviacionA =  round(np.std(emp_a_ventas), 2)
varianzaA =  round(np.var(emp_a_ventas), 2)
correlacionA =  round(np.corrcoef(emp_a_ventas), 2)
covarianzaA = round(34201655435.27255, 2) #np.cov(emp_a_ventas)
modaA = round(stats.mode(emp_a_ventas)[0][0], 2)

mediaB = round(np.mean(emp_b_ventas), 2)
medianaB =  round(np.median(emp_b_ventas), 2)
desviacionB =  round(np.std(emp_b_ventas), 2)
varianzaB =  round(np.var(emp_b_ventas), 2)
correlacionB =  round(np.corrcoef(emp_b_ventas), 2)
covarianzaB = round(563572415138.5575, 2) #np.cov(emp_b_ventas)
modaB = round(stats.mode(emp_b_ventas)[0][0], 2)

mediaC = round(np.mean(emp_c_ventas), 2)
medianaC =  round(np.median(emp_c_ventas), 2)
desviacionC =  round(np.std(emp_c_ventas), 2)
varianzaC =  round(np.var(emp_c_ventas), 2)
correlacionC =  round(np.corrcoef(emp_c_ventas), 2)
covarianzaC = round(283701710271.3122, 2) #np.cov(emp_c_ventas)
modaC = round(stats.mode(emp_c_ventas)[0][0], 2)


emp_a_mensual = np.zeros((31,12))
contador_a = 0

for z in range(0,len(meses)):
    for c in range(0,meses[z]):
        #print(c,z)
        emp_a_mensual[c][z] = emp_a_ventas[contador_a]
        contador_a += 1
    #print(f"contador : {contador_a}")
 
#print(emp_a_mensual)

emp_b_mensual = np.zeros((31,12))
contador_b = 0

for z in range(0,len(meses)):
    for c in range(0,meses[z]):
        emp_b_mensual[c][z] = emp_b_ventas[contador_b]
        contador_b += 1
 
#print(emp_a_mensual)

emp_c_mensual = np.zeros((31,12))
contador_c = 0

for z in range(0,len(meses)):
    for c in range(0,meses[z]):
        emp_c_mensual[c][z] = emp_c_ventas[contador_c]
        contador_c += 1
        
suma_mensual_ventas_a = []
suma_mensual_a = 0

for c in range(0,12):
    for f in range(0,31):
        suma_mensual_a += emp_a_mensual[f][c]
    suma_mensual_ventas_a.append(suma_mensual_a)
    #print(suma_mensual_a)
    suma_mensual_a = 0
    
suma_mensual_ventas_b = []
suma_mensual_b = 0

for c in range(0,12):
    for f in range(0,31):
        suma_mensual_b += emp_b_mensual[f][c]
    suma_mensual_ventas_b.append(suma_mensual_b)
    #print(suma_mensual_a)
    suma_mensual_b = 0
    
suma_mensual_ventas_c = []
suma_mensual_c = 0

for c in range(0,12):
    for f in range(0,31):
        suma_mensual_c += emp_c_mensual[f][c]
    suma_mensual_ventas_c.append(suma_mensual_c)
    #print(suma_mensual_a)
    suma_mensual_c = 0
  
eje_y_a = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
eje_x_a = suma_mensual_ventas_a
plt.barh(eje_y_a, eje_x_a)
plt.xlabel("Ventas (0'000,000)")
plt.ylabel("Meses del año")
plt.title("Valor de venta mensual de la empresa A")
#plt.show()

eje_y_b = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
eje_x_b = suma_mensual_ventas_b
plt.barh(eje_y_b, eje_x_b)
plt.xlabel("Ventas (00'000,000)")
plt.ylabel("Meses del año")
plt.title("Valor de venta mensual de la empresa B")
#plt.show()

eje_y_c = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
eje_x_c = suma_mensual_ventas_c
plt.barh(eje_y_c, eje_x_c)
plt.xlabel("Ventas (0'000,000)")
plt.ylabel("Meses del año")
plt.title("Valor de venta mensual de la empresa C")
#plt.show()



# PREGUNTA 2

ventas_a = 0

for o in emp_a_ventas:
    ventas_a += o
#print(ventas_a)

ventas_b = 0

for q in emp_b_ventas:
    ventas_b += q
#print(ventas_b)

ventas_c = 0

for w in emp_c_ventas:
    ventas_c += w
#print(ventas_c)

empresas = []
empresas.append(ventas_a)
empresas.append(ventas_b)
empresas.append(ventas_c)
#print(empresas)

eje_y_c = ["Empresa A","Empresa B","Empresa C",]
eje_x_c = empresas
plt.barh(eje_y_c, eje_x_c)
plt.xlabel("Ventas (000'000,000)")
plt.ylabel("Empresas")
plt.title("Ventas del año 2020")
#plt.show()

"""
if ventas_a > ventas_b and ventas_a > ventas_c:
    print(f"La empresa con mayores ventas del año 2020 es: Empresa A")
elif ventas_b > ventas_a and ventas_b > ventas_c:
    print(f"La empresa con mayores ventas del año 2020 es: Empresa B")
else:
    print(f"La empresa con mayores ventas del año 2020 es: Empresa C")
"""

# PREGUNTA 3

mercado = []

conta_mercado = 0


for k in range(0,12):
    conta_mercado += suma_mensual_ventas_a[k]
    conta_mercado += suma_mensual_ventas_b[k]
    conta_mercado += suma_mensual_ventas_c[k]
    mercado.append(conta_mercado)
    conta_mercado = 0
    
    

   
mayor = max(mercado)
mes_mayor = mercado.index(mayor)+1

month = datetime.date(1900, mes_mayor, 1).strftime('%B')
month = "Diciembre"

eje_y_c = ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]
eje_x_c = mercado
plt.barh(eje_y_c, eje_x_c)
plt.xlabel("Ventas (00'000,000)")
plt.ylabel("Meses del año")
plt.title("Mes de mayor crecimiento del mercado")
#plt.show()

#print(f"El mes de mayor crecimiento del mercado es: {month} con {mayor}")

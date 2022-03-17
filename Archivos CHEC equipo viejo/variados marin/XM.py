
#%%
import pandas as pd
#Extraccion de datos de excel:

Datos = pd.ExcelFile('XM.xlsm')
data= Datos.parse(1)
#%%
#data.dropna(inplace=True) # para quitar las filas NaN.Solo habilitar para el realizar el punto 2 o 4, 10, 11

#%%
1.# para observar la resolucción de tiempo de toma de datos:
print(data['Estampa de Tiempo']) 

#%%
2. # para ver los datos estadísticos (med,var,std,mod..etc) de cada una de las columnas de  carga del DF:
print(data.iloc[:,2:8].describe()) 

#%%
3. # para ver cuantos ambos segundos,los interruptores estuvieron cerrados al tiempo, a través de filtros:
print(len(data[(data['Interruptor 1'] == 'Cerrado') & (data['Interruptor 2'] == 'Cerrado')]))

#%%
4.# Parametros de la  ecuacion de recta para señal 1:
from sklearn.linear_model import LinearRegression
import numpy as np 
RegLin = LinearRegression()
x,y = np.array(range(1,len(data)+1)), data['Señal 1']
RegLin.fit(x.reshape(-1, 1), y) 
print('m = ' + str(RegLin.coef_) + ', b = ' + str(RegLin.intercept_))

#%%
5. #Se grafica la señal 2 para ver su comportamiento: decreciente no lineal 
import matplotlib.pyplot as plt
data['Señal 2'].plot()
plt.show()

#%%
6. #segun grafico- regresión polinómica, pero depende de observar el R2 de la muestra

#%%
7. #para hallar el numero de NaN's por filas: 
print(data.isna().any(1).sum()) # para contar las filas que tienen NaN 

#%%
8. #NaNs por columnas:
print(data.isna().sum().sum())# para contar los NaN en columnas

9. #Promedios

#%%
10.# Con este linea se peude ver los estadisticos de las columnas de cargas y ver cual tiene mayor std # En este caso Carga1
print(data.iloc[:420,2:8].describe())

#%%
11..# Con este linea se peude ver los estadisticos de las columnas de cargas y ver cual tiene mayor std # En este caso Carga4
print(data.loc[:].describe()) 

12.# calculo de la desviacion standard para cada munito entre 56 y 59
data.index=data['Estampa de Tiempo']
print('std para minuto 56 :'+ str((data.loc["2019-12-09 12:56:00": "2019-12-09 12:56:59",'Carga 4']).std()) )
print('std para minuto 57 :'+ str((data.loc["2019-12-09 12:57:00": "2019-12-09 12:57:59",'Carga 4']).std()) )
print('std para minuto 58 :'+ str((data.loc["2019-12-09 12:58:00": "2019-12-09 12:58:59",'Carga 4']).std()) )
print('std para minuto 59 :'+ str((data.loc["2019-12-09 12:59:00": "2019-12-09 12:59:59",'Carga 4']).std()) )

















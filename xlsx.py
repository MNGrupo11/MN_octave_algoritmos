import pandas as pd

data=pd.read_csv('temp.csv',header=0,index_col=0,sep=",")
data=pd.DataFrame(data)
#data=data.drop(["N","2021/09/28"],axis=1)

data_lista=pd.read_csv('data.csv',index_col=0,sep=",")
data_lista = data_lista[~data_lista.index.duplicated(keep='first')]

#Nombre de las columnas de cada fechas 
lista=data_lista.index

#Obtenemos los valores de las columnas por fecha
list1=[]  
list2=[]
for i in lista:
    lis=data[i].values
    lis2=data[i+".1"].values
    list1.append(lis)
    list2.append(lis2)
    

#Comparamos las columnas con fechas similares y concatenamos.
valores=[]
for i in range(len(list1)):
    for j in range(len(list1[0])):
        if list1[i][j] ==list2[i][j]:
            valores.append(list1[i][j])
        else:
            valores.append("S")
            
            
n=len(list1[0])           
output=[valores[i:i + n] for i in range(0, len(valores), n)]

#Eliminamos las columnas repetidas
for i in lista:
    data=data.drop([i],axis=1)
    data=data.drop([i+".1"],axis=1)

#Agreagamos las nuevas columnas concatenadas
for i in range(len(lista)):
    data[lista[i]]=output[i]
    

writer = pd.ExcelWriter('lista-so1.xlsx', engine='xlsxwriter')

# Convertimos el dataframe a un archivo excel
data.to_excel(writer, sheet_name='Sheet1')

writer.save()

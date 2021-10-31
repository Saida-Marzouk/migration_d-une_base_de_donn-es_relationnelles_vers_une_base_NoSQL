import mysql.connector
from mysql.connector import Error
import pandas as pd
import numpy as np



from pyclustering.cluster.kmeans import kmeans
from pyclustering.cluster.center_initializer import kmeans_plusplus_initializer
from pyclustering.utils  import timedcall;
from pyclustering.cluster import cluster_visualizer_multidim
sql_query0 = "SELECT `codeBien`, `libelleBien` FROM `bien`"
sql_query1 = "SELECT bien.libelleBien, faitpolice.codeBien FROM `bien`, `faitpolice` WHERE faitpolice.codeBien= bien.codeBien"

sql_query2 = "SELECT `codeClient`, `nomClient` FROM `client`"


sql_query3 = "SELECT `codeClient`, `nomClient` FROM `client`"

sql_query4 = "SELECT client.codeClient, faitpolice.codeClient ,faitpolice.codePolice, faitpolice.dateEcriture, faitpolice.NbTransaction , faitpolice.montant FROM `client`, `faitpolice` WHERE faitpolice.codeClient= client.codeClient"

sql_query5 = "SELECT `date` FROM `date`"
sql_query6 = "SELECT date.date, faitpolice.dateEcriture  ,faitpolice.codePolice,  faitpolice.NbTransaction , faitpolice.montant FROM `date` , `faitpolice` WHERE faitpolice.dateEcriture= date.date"
sql_query7 = "SELECT bien.libelleBien, faitpolice.codeBien  ,faitpolice.codePolice, faitpolice.dateEcriture, faitpolice.NbTransaction , faitpolice.montant FROM `bien`,  `faitpolice` WHERE faitpolice.codeBien= bien.codeBien and montant=1200;"
sql_query8 = "SELECT bien.libelleBien ,bien.codeBien, faitpolice.codeBien FROM `bien`, `faitpolice` WHERE faitpolice.codeBien= bien.codeBien and montant=15000"
sql_query9 = "SELECT client.codeClient,client.nomClient, faitpolice.codeClient FROM `client`,  `faitpolice` WHERE faitpolice.codeClient= client.codeClient and NbTransaction=2"
sql_query10 = "SELECT `codePolice`, `dateEcriture`, `codeClient`, `codeBien`, `NbTransaction`, `montant` FROM `faitpolice`"



sql_queryList =[sql_query0,sql_query1,sql_query2,sql_query3,sql_query4,sql_query5,sql_query6,sql_query7,sql_query8,sql_query9,sql_query10]
def isColumnExistsinQuery(sql_query,column):
    try:
        if sql_query.index(column):
            return 1
    except:
        return 0

# Obtenir le nom de columns dans une table
def ColumnsName(host,user,password,database,table):
    try:
        conn = mysql.connector.connect(
            user=user,
            host=host,
            password=password,
            database=database
        )
        cursor = conn.cursor()
        print("connected with sucess")
        #print(f"SHOW columns FROM {table}")
        cursor.execute(f"SHOW columns FROM {table}")
        return ([column[0] for column in cursor.fetchall()])
    except Error as e:
        print("Impossible to connect to the database")

#extraire la matrix
"""
calculer la distance AQM
:parameter: list de requets sql
return dictionaire de dictionaire de AQM
"""
def extract_matrix(sql_queryList):
    query_matrix = dict()
    columnsList = ColumnsName("localhost", 'root', '', 'projetbi','faitpolice')
    for index,sql_query in enumerate(sql_queryList):
        matrix = []
        for column in columnsList:
            column_dict = dict()
            column_dict[column] = isColumnExistsinQuery(sql_query,column)
            matrix.append(column_dict)
        query_matrix["Q"+str(index)]=matrix
    columnsCount = dict()
    for key in query_matrix:
        for element in query_matrix[key]:
            columnName = (list(element.keys())[0])
            Isexiste = ( element[list(element.keys())[0]])
            if columnName in columnsCount:
                if Isexiste == 1:
                    columnsCount[columnName] = 1 + columnsCount[columnName]
            else:
                columnsCount[columnName] = 1 if Isexiste == 1 else 0

    for key in (columnsCount):

        if columnsCount[key] == 0:

            for key1 in query_matrix:
                #print(query_matrix[key1][query_matrix[key1].index({key:0})])
                query_matrix[key1].remove( {key:0} )
    return query_matrix

"""
calculer la distance DQM
:parameter: list de requets sql
return dictionaire de dictionaire de DQM
"""

def remove_val(x):
    for item in range(len(x)):
        if np.isnan(x[item]):
            x[item]=0.0
    return x

def destince_matrix(sql_queryList):
    dictionary = extract_matrix(sql_queryList)

    keys_list = list(dictionary.keys())

    distance = dict()
    matrixDistance = list()

    for i in range(len(keys_list)):
        distanceDict = dict()
        for j in range(i, len(keys_list)):

            not_shared_elemnt = 0
            shared_elemnt = 0
            for dict1, dict2 in zip(dictionary[keys_list[j]], dictionary[keys_list[i]]):
                for key1 in dict1:
                    if dict1[key1] == 1 and  dict2[key1] == 1:
                        shared_elemnt += 1
                    else:
                        not_shared_elemnt += 1
            calcDistance = shared_elemnt / (len(keys_list) - not_shared_elemnt) if keys_list[j] != keys_list[i] else 0.0

            distanceDict[keys_list[j]] = calcDistance

        distance[keys_list[i]] = distanceDict
    DQM = pd.DataFrame(distance)
    return DQM.apply( lambda x:remove_val(x), axis=1 )


print(destince_matrix(sql_queryList))


dlist=destince_matrix(sql_queryList)


initial_centers = kmeans_plusplus_initializer(dlist,3).initialize()
kmeans_instance=kmeans(dlist,initial_centers)

(ticks,result)= timedcall(kmeans_instance.process);
print("execution time : ", ticks, "\n")

clusters = kmeans_instance.get_clusters()
final_centers = kmeans_instance.get_centers()
print("centers : " , kmeans_instance.get_centers())
print(" clusters : ", clusters )








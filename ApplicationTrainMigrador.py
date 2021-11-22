import pandas as pd
import pyodbc

def applicationTrainMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\application_test.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO cliente.application_train (SK_ID_CURR, TARGET, NAME_CONTRACT_TYPE, CODE_GENDER, FLAG_OWN_CAR, FLAG_OWN_REALTY, CNT_CHILDREN, AMT_INCOME_TOTAL)
                    VALUES (?,?,?,?,?,?,?,?)
                    ''',
                    row.SK_ID_CURR,
                    row.TARGET,
                    row.NAME_CONTRACT_TYPE,
                    row.CODE_GENDER,
                    row.FLAG_OWN_CAR,
                    row.FLAG_OWN_REALTY,
                    row.CNT_CHILDREN,
                    row.AMT_INCOME_TOTAL
                    )
    conn.commit()



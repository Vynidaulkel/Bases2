import pandas as pd
import pyodbc

def previousApplicationsMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\previous_application.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO finanza.previous_application (SK_ID_PREV, SK_ID_CURR, NAME_CONTRACT_TYPE, AMT_ANNUITY, AMT_APPLICATION)
                    VALUES (?,?,?,?,?)
                    ''',
                    row.SK_ID_PREV,
                    row.SK_ID_CURR,
                    row.NAME_CONTRACT_TYPE,
                    row.AMT_ANNUITY,
                    row.AMT_APPLICATION
                    )
    conn.commit()



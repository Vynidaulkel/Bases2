import pandas as pd
import pyodbc

def bureauMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\bureau.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO cliente.bureau (SK_ID_CURR, SK_ID_BUREAU , CREDIT_ACTIVE, CREDIT_CURRENCY, DAYS_CREDIT)
                    VALUES (?,?,?,?,?)
                    ''',
                    row.SK_ID_CURR,
                    row.SK_ID_BUREAU,
                    row.CREDIT_ACTIVE,
                    row.CREDIT_CURRENCY,
                    row.DAYS_CREDIT,
                    )
    conn.commit()



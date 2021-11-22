import pandas as pd
import pyodbc

def bureauBalanceMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\bureau_balance.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO test (SK_ID_BUREAU, MONTHS_BALANCE, STATUS)
                    VALUES (?,?,?)
                    ''',
                    row.SK_ID_BUREAU,
                    row.MONTHS_BALANCE,
                    row.STATUS
                    )
    conn.commit()



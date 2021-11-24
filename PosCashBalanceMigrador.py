import pandas as pd
import pyodbc

def posCashBalanceMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\POS_CASH_balance.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO test_POS_CASH_balance (SK_ID_PREV, SK_ID_CURR, MONTHS_BALANCE, CNT_INSTALMENT, CNT_INSTALMENT_FUTURE)
                    VALUES (?,?,?,?,?)
                    ''',
                    row.SK_ID_PREV,
                    row.SK_ID_CURR,
                    row.MONTHS_BALANCE,
                    row.CNT_INSTALMENT,
                    row.CNT_INSTALMENT_FUTURE
                    )
    conn.commit()



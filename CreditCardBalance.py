import pandas as pd
import pyodbc

def creditCardBalanceMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\credit_card_balance.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO test_credit_card_balance(SK_ID_PREV, SK_ID_CURR, MONTHS_BALANCE, AMT_BALANCE, AMT_CREDIT_LIMIT_ACTUAL,
                    AMT_DRAWINGS_ATM_CURRENT, AMT_DRAWINGS_CURRENT)
                    VALUES (?,?,?,?,?,?,?)
                    ''',
                    row.SK_ID_PREV,
                    row.SK_ID_CURR,
                    row.MONTHS_BALANCE,
                    row.AMT_BALANCE,
                    row.AMT_CREDIT_LIMIT_ACTUAL,
                    row.AMT_DRAWINGS_ATM_CURRENT,
                    row.AMT_DRAWINGS_CURRENT,
                    )
    conn.commit()



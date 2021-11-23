import pandas as pd
import pyodbc

def creditCardBalanceMigrador():
    data = pd.read_csv (r'C:\Users\kenny\Desktop\csv\credit_card_balance.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-VKOPIQ8;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO finanza.credit_card_balance (SK_ID_PREV, SK_ID_CURR, MONTHS_BALANCE,)
                    VALUES (?,?,?,?,?)
                    ''',
                    row.SK_ID_PREV,
                    row.SK_ID_CURR,
                    row.MONTHS_BALANCE,
                    row.CREDIT_CURRENCY,
                    row.DAYS_CREDIT,
                    )
    conn.commit()



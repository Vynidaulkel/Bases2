import pandas as pd
import pyodbc

def installmentsPaymentsMigrador():
    data = pd.read_csv (r'C:\Users\Extreme PC\Documents\Semestre 2-2021\bases de datos 2\proyecto\installments_payments.csv')   
    df = pd.DataFrame(data)




    conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=DESKTOP-8FRKRQA;'
                        'Database=Proyecto2;'
                        'Trusted_Connection=yes;')
    cursor = conn.cursor()

    for row in df.itertuples():
        cursor.execute('''
                    INSERT INTO test_installments (SK_ID_PREV, SK_ID_CURR, NUM_INSTALMENT_VERSION,
                    NUM_INSTALMENT_NUMBER, DAYS_INSTALMENT,
                    DAYS_ENTRY_PAYMENT, AMT_INSTALMENT, AMT_PAYMENT)
                    VALUES (?,?,?,?,?,?,?,?)
                    ''',
                    row.SK_ID_PREV,
                    row.SK_ID_CURR,
                    row.NUM_INSTALMENT_VERSION,
                    row.NUM_INSTALMENT_NUMBER,
                    row.DAYS_INSTALMENT,
                    row.DAYS_ENTRY_PAYMENT,
                    row.AMT_INSTALMENT,
                    row.AMT_PAYMENT
                    )
    conn.commit()



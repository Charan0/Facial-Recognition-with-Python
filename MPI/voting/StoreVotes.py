import sqlite3


def update_data(var):

    connection2 = sqlite3.connect('results.db')

    cursor2 = connection2.cursor()

    cursor2.execute('CREATE TABLE IF NOT EXISTS POLLS(BJP integer, JSP integer, TDP integer, YCP integer, INC integer, CPM integer)')
    connection2.commit()
    if var == 1:
        cursor2.execute('INSERT INTO POLLS VALUES(1, 0, 0, 0, 0, 0)')
    elif var == 2:
        cursor2.execute('INSERT INTO POLLS VALUES(0, 1, 0, 0, 0, 0)')
    elif var == 3:
        cursor2.execute('INSERT INTO POLLS VALUES(0, 0, 1, 0, 0, 0)')
    elif var == 4:
        cursor2.execute('INSERT INTO POLLS VALUES(0, 0, 0, 1, 0, 0)')
    elif var == 5:
        cursor2.execute('INSERT INTO POLLS VALUES(0, 0, 0, 0, 1, 0)')
    elif var == 6:
        cursor2.execute('INSERT INTO POLLS VALUES(0, 0, 0, 0, 0, 1)')
    connection2.commit()
    connection2.close()
    
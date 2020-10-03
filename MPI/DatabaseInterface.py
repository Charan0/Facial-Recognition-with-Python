import sqlite3
import login.AddVoters as av


def create_table():
    connection = sqlite3.connect('voters.db')

    cursor = connection.cursor()

    cursor.execute('CREATE TABLE IF NOT EXISTS VOTERS_LIST(name text, voter_id integer primary key, dob text, '
                   'password text)')
    connection.commit()

    connection.close()

    av.add_voters()


#def choice_select():
    #choice = input('''To add the details of a new voter, press "a".
    #To quit this process, press "q".                  ''')

    #while choice != 'q':
        #if choice == 'a':
           # av.add_voters()
       # else:
           # print('Sorry! Incorrect Choice! Try Again!')

       # choice = input('''To add the details of a new voter, press "a".
            #                  To quit this process, press "q".                  ''')

create_table()
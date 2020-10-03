import sqlite3
import tkinter as tk
from tkinter import *
from tkinter import messagebox
import voting.StoreVotes as sv
#from tkinter.ttk import *

#var = 1

def store_vote():
    print(voter_det)
    print(var.get())
    if var.get() != 0:
        v = var.get()
        print('Problem Solved')
        fw03.destroy()
        connection = sqlite3.connect('voters.db')

        cursor = connection.cursor()

        cursor.execute('UPDATE VOTERS_LIST SET status = 1 WHERE voter_id=?', (voter_det,))
        connection.commit()

        connection.close()

        sv.update_data(v)
    else:
        messagebox.showinfo("!Sorry!", "You have not cast your vote yet.. Try Again!")
        fw03.destroy()
        cast_vote(voter_det)


def cast_vote(voter):
    global fw03, var, voter_det
    voter_det = voter
    fw03 = tk.Tk()
    fw03.title('Cast Your Vote')
    tk.Label(fw03).grid(row=0)
    tk.Label(fw03).grid(row=1)
    var = IntVar(fw03, 0)
    #var.set(1)
    r1 = Radiobutton(fw03, text="BJP", variable=var, value=1)
    r1.grid(row=2, column=2)
    r2 = Radiobutton(fw03, text="JSP", variable=var, value=2)#, command=store_vote)
    tk.Label(fw03).grid(row=3)
    r2.grid(row=4, column=2)
    r3 = Radiobutton(fw03, text="TDP", variable=var, value=3)#, command=store_vote)
    tk.Label(fw03).grid(row=5)
    r3.grid(row=6, column=2)
    r4 = Radiobutton(fw03, text="YCP", variable=var, value=4)#, command=store_vote)
    tk.Label(fw03).grid(row=7)
    r4.grid(row=8, column=2)
    r5 = Radiobutton(fw03, text="INC", variable=var, value=5)#, command=store_vote)
    tk.Label(fw03).grid(row=9)
    r5.grid(row=10, column=2)
    r6 = Radiobutton(fw03, text="CPM", variable=var, value=6)#, command=store_vote)
    tk.Label(fw03).grid(row=11)
    r6.grid(row=12, column=2)
    tk.Label(fw03).grid(row=13)
    print(var.get())
    face = tk.Button(fw03, text='Next', width=20, command=store_vote, activebackground='blue',
                     activeforeground='black').grid(row=14, column=2)
    #fw03.mainloop()

import sqlite3
import tkinter as tk
from tkinter import *
import image.CaptureImage as ci

def fill_data(fw00, name, voter_id, dob, password):
    name1 = name.get()
    voter_id1 = voter_id.get()
    dob1 = dob.get()
    password1 = password.get()
    ci.store_image(voter_id1)
    fw00.destroy()
    connection = sqlite3.connect('voters.db')

    cursor = connection.cursor()

    cursor.execute('INSERT INTO VOTERS_LIST VALUES(?, ?, ?, ?)', [name1, int(voter_id1), dob1, password1])
    connection.commit()

    connection.close()
    add_voters()


def add_voters():

    fw00 = tk.Tk()
    fw00.title(f'Add New Voter')
    Label(fw00).grid(row=0)
    Label(fw00).grid(row=1)
    Label(fw00, text='Name').grid(row=1)
    Label(fw00).grid(row=2)
    Label(fw00).grid(row=3)
    Label(fw00, text='Voter ID').grid(row=4)
    Label(fw00).grid(row=5)
    Label(fw00).grid(row=6)
    Label(fw00, text='DateOfBirth').grid(row=7)
    Label(fw00).grid(row=8)
    Label(fw00).grid(row=9)
    Label(fw00, text='Password').grid(row=10)
    name = Entry(fw00)
    voter_id = Entry(fw00)
    dob = Entry(fw00)
    password = Entry(fw00)
    name.grid(row=1, column=1)
    voter_id.grid(row=4, column=1)
    dob.grid(row=7, column=1)
    password.grid(row=10, column=1)
    login = tk.Button(fw00, text='Submit', width=25, command=lambda: fill_data(fw00, name, voter_id, dob, password), activebackground='blue')
    login.grid(row=13, column=1)
    fw00.mainloop()
    ##name = input("Voter's Name: ")
    #voter_id = input("Voter ID: ")
    #dob = input("Date of Birth: ")
    #password = input("Password: ")
    #fill_data(name, voter_id, dob, password)

import tkinter as tk
from tkinter import *
import login.CheckLogin as cl
#from tkinter import messagebox


#global e1, e2, fw02


def take_values():

    u_name = e1.get()
    p_word = e2.get()
    fw02.destroy()
    print(f'{u_name} {p_word}')

    cl.check_values(u_name, p_word)



def login_window():
    global e1, e2, fw02
    fw02 = tk.Tk()
    fw02.title(f'Manual Login')
    #normal = tk.Button(fw02, text='oh yeah', width=25, command=fw02.destroy, activebackground='blue', activeforeground='yellow')

    #normal.pack()
    #normal.place(x=10, y=90)
    Label(fw02).grid(row=0)
    Label(fw02).grid(row=1)
    Label(fw02, text='UserName').grid(row=1)
    Label(fw02).grid(row=3)
    Label(fw02, text='Password').grid(row=4)
    Label(fw02).grid(row=5)
    Label(fw02).grid(row=6)
    e1 = Entry(fw02)
    e2 = Entry(fw02)
    e1.grid(row=1, column=1)
    e2.grid(row=4, column=1)
    login = tk.Button(fw02, text='Done', width=25, command=take_values, activebackground='blue')
    login.grid(row=6, column=1)

    #fw02.mainloop()

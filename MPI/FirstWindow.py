import tkinter as tk
from tkinter import messagebox
import login.LoginWindow as lw
import image.FaceTrain as ft


#year = input('Enter the year of elections: ')


def not_done_yet():
    messagebox.showinfo("!Sorry!", "The current feature is under construction. Try later.")
    ft.train_faces()


def next_login():
    fw01.destroy()
    lw.login_window()


fw01 = tk.Tk()
fw01.title(f'Voting')
face = tk.Button(fw01, text='Facial Recognition', width=25, command=not_done_yet, activebackground='green', activeforeground='red')
normal = tk.Button(fw01, text='Normal Login', width=25, command=next_login, activebackground='blue', activeforeground='yellow')
face.pack()
normal.pack()
normal.place(x=10, y=40)
face.place(x=10, y=80)
fw01.mainloop()

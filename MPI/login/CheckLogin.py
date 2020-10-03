import sqlite3
import tkinter as tk
from tkinter import *
from tkinter import messagebox
import login.LoginWindow as lw
import voting.VoteOptions as vo


def check_values(u_name, p_word):
    connection = sqlite3.connect('voters.db')

    cursor = connection.cursor()

    cursor.execute('SELECT * FROM VOTERS_LIST WHERE voter_id=?', (u_name,))
    voter = cursor.fetchone()

    connection.close()

    if voter[3] == p_word:
        messagebox.showinfo("Success!", "Your Login is successful! Make your vote count!")
        vo.cast_vote(u_name)
    else:
        messagebox.showinfo("!Sorry!", "Your login has failed! Please try again")
        lw.login_window()

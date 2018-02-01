from tkinter import *

window = None
canvas = None

window = Tk()
window.title("그림판 비슷한거")
canvas = Canvas(window, height = 300, width = 300)
canvas.pack()
window.mainloop()

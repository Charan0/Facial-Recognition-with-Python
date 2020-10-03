import cv2
import numpy as np
import os

def store_image(voterId):
    face_cascade = cv2.CascadeClassifier('cascades/data/haarcascade_frontalface_alt2.xml')
    cam = cv2.VideoCapture(0)

    id = voterId
    parent_dir = r"C:\Users\vivek\pp\images"
    path = os.path.join(parent_dir, id)
    os.mkdir(path)
    SampleNum = 0
    while(1):
        ret, img = cam.read()
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray,  minNeighbors=5)

        for (x,y,w,h) in faces:
            SampleNum = SampleNum+1
            cv2.imwrite("images/" + str(id) + "/" + str(id) + '.'+str(SampleNum) + ".jpg", gray[y:y+h, x:x+h])
            cv2.rectangle(img, (x, y), (x+y, y+h), (255, 0, 0), 1)
            cv2.waitKey(100)
        cv2.imshow("Face", img)
        cv2.waitKey(1)
        if SampleNum > 25: break

        cv2.imshow('img', img)
        if cv2.waitKey(1) & 0xFF == ord('q'): break

    cam.release()
    cv2.destroyAllWindows()

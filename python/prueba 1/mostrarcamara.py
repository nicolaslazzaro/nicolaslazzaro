import cv2 as cv 

capturarVideos = cv.VideoCapture(1)
if not capturarVideos.isOpened():
    print ("No se encontro camara")
    exit()
while True:
    _,camara = capturarVideos.read()
    grises = cv.cvtColor(camara, cv.COLOR_BGR2GRAY)
    
    
    cv.imshow("En vivo", grises)
    if cv.waitKey(1)==ord("q"):
        break
capturarVideos.release()
cv.destroyAllWindows()
from cv2 import cv2
import numpy as np

valorGauss = 5
valorKernel = 30
original = cv2.imread('monedassoles.jpg')
gris = cv2.cvtColor(original, cv2.COLOR_BGR2GRAY)
gauss= cv2.GaussianBlur(gris, (valorGauss,valorGauss), 0)
canny = cv2.Canny(gauss, 60,100)

kernel = np.ones((valorKernel,valorKernel),np.uint8)
cierre = cv2.morphologyEx(canny,cv2.MORPH_CLOSE, kernel)
contorno,jerarquia = cv2.findContours(cierre.copy(),cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

print("Monedas encontradas : {}".format(len(contorno)))
cv2.drawContours(original,contorno,-1,(0,0,255),2)


#Mostrar resultados

##cv2.imshow("Grises",gris)
#cv2.imshow("Gauss",gauss)
#cv2.imshow("canny",canny)
#cv2.imshow("Cierre",cierre)
cv2.imshow("Resultado",original)
cv2.waitKey(0)
from cv2 import blur, cv2 
import numpy as np

def ordenarpuntos(puntos):
    n_puntos = np.concatenate([puntos[0],puntos[1],puntos[2],puntos[3]]).tolist()
    y_order = sorted(n_puntos,key=lambda n_puntos: n_puntos[1])
    x1_order = y_order[:2]
    x1_order = sorted(x1_order,key=lambda x1_order: x1_order[0])
    x2_order = y_order[2:4]
    x1_order = sorted(x2_order,key=lambda x2_order: x2_order[0])
    return x1_order[0],x1_order[1], x2_order[0], x2_order[1]
def alineamiento(imagen,alto,ancho):
    imagen_alineada = None 
    grises = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)
    tipoumbral1, umbral = cv2.threshold(grises,100,255,cv2.THRESH_BINARY)
    cv2.imshow("Umbral",umbral)
    contorno = cv2.findContours(umbral,cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[0]
    contorno = sorted(contorno,key=cv2.contourArea, reverse=True)[:1] 
    for c in contorno:
        epsilon = 0.01*cv2.arcLength(c, True)
        approx = cv2.approxPolyDP(c, epsilon,True)
        if len(approx)==4:
            punto = ordenarpuntos(approx)
            punto1 = np.float32(punto)
            puntos2=np.float32([[0,0],[ancho,0],[0,alto],[ancho,alto]])
            M = cv2.getPerspectiveTransform(punto1,puntos2)
            imagen_alineada = cv2.warpPerspective(imagen,M,(ancho,alto))
    return imagen_alineada

capturarVideos = cv2.VideoCapture(0)
while True:
    tipocamara,camara = capturarVideos.read() 
    if tipocamara == False:
        print("FALSE")
        break
    imagen_A6=alineamiento(camara,ancho=480,alto=640)
    if imagen_A6 is not None:
        puntos = []
        imagen_gris = cv2.cvtColor(camara, cv2.COLOR_BGR2GRAY)
        blur = cv2.GaussianBlur(imagen_gris,(5,5),1)
        _,umbral2 = cv2.threshold(blur, 0,255,cv2.THRESH_OTSU+cv2.THRESH_BINARY_INV)
        cv2.imshow("Umbral",umbral2)
        contorno2 = cv2.findContours(umbral2,cv2.RETR_EXTERNAL,  cv2.CHAIN_APPROX_SIMPLE)[0]
        cv2.drawContours(imagen_A6,contorno2,-1,(255,0,0),2)
        suma1 = 0.0
        suma2 = 0.0
        for c2 in contorno2:
            area = cv2.contourArea(c2)
            momentos = cv2.moments(c2)
            if(momentos["m00"]==0):
                momentos["m00"]=1.0
            x = int(momentos["m10"]/momentos["m00"])
            y = int(momentos["m01"]/momentos["m00"])
            
            if area < 6000 and area > 2000 :
                font = cv2.FONT_HERSHEY_SIMPLEX
                cv2.putText(imagen_A6,"s/. 0.10",(x,y),font, 0.75, (0,255,0), 2 )
                suma1 = suma1 + 0.10
            if area < 12000 and area > 8000 :
                font = cv2.FONT_HERSHEY_SIMPLEX
                cv2.putText(imagen_A6,"s/. 0.50",(x,y),font, 0.75, (0,255,0), 2 )
                suma1 = suma1 + 0.50  
        total = suma1 + suma2
        print ("Sumatoria Total en Centimos:", round(total,2))
        cv2.imshow("Imagen a6",imagen_A6)
        cv2.imshow("Camara", camara)
    if cv2.waitKey(1) == ord('s'):
        break
capturarVideos.release()

        
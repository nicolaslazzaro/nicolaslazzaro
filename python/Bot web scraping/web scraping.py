from bs4 import BeautifulSoup
import requests
import time
import webbrowser

#precioDeseado = int(input("¿Cual es su precio deseado?: "))
#print("Accediendo a la web..")
#time.sleep(2)
#print("Verificando el precio..")
#time.sleep(2)
#print("Aguarde por favor...")
#time.sleep(1)

precioDeseado = 10

url = requests.get("https://www.digitalsport.com.ar/search/?search=nike%20air%20jordan%201")
soup = BeautifulSoup(url.content, "html.parser")
resultado = soup.find_all('a', {'class':'product'})
print(resultado)
''' precioaActual_text = resultado.text
precioaActual = float (precioaActual_text)


#precioDeseado = precioDeseado

if precioaActual < precioDeseado:
    print(f" ¡ATENCION! Hay oferta, bajo el precio! Esta en:  {'$'+str(precioaActual)} ")
    #print(" ")
    #i = input('¿Quieres accerder a la web?: ')
    #if i == 'y':
        #pag = 'https://computacion.mercadolibre.com.ar/computacion/procesador'
        #webbrowser.open_new_tab(pag)
else:
    print("El precio sigue demasiado alto") '''
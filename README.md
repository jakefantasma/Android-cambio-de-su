link del busybox
https://play.google.com/store/apps/details?id=stericson.busybox&hl=es_419

una ves instaldo solo lo abrimos y le daremos en Install esperamos a que se instale despues descargamos el Terminal Emulator

link del Terminal Emulator
https://play.google.com/store/apps/details?id=jackpal.androidterm&hl=es_419

verificamos que se instalo bien el busybox para eso tecleamos

"busybox"

y nos tendria que mostrar los comandos que nos instalo si nos da este error

busybox: not found

es por que no se nos instalo bien el busybox, el explorador de archivos lo necesitamos para saver en que ruta vamos a ejecutar el archivo cambio-su.sh y para modificar una linea del script, con todo ya instaldo y funcionando descargan el archivo superusuarios.zip en ese archivo inclui 2 verciones de super usuarios una es el superSU y el otro es el superuser tambien los subi aparte cada uno por si ustedes solo desean uno :sisi1:

superSu
https://www.dropbox.com/sh/lpg16e4cps6l1ks/AAAL1sr_aTkqTZ1Kmj9bHG25a?dl=0

superusuario
https://www.dropbox.com/sh/eog9hrpnlg5b6ul/AABpw57x6u9aBFPsFo84ur5na?dl=0

los dos en un zip
https://www.dropbox.com/s/dmra4ttv55tener/superusuarios.zip?dl=0

bueno si deciden descargar solo uno cabe decir que tienen que descargar los 3 archivos de la carpeta ya que los 3 archivos se requieren

y por ultimo y mas importante es el script
https://www.dropbox.com/s/j0footsiux34tfo/cambio-su.sh?dl=0

ya teniendo todo procedemos a editar el script con nuestra ruta sd donde tendremos todo, con el explorador miraremos en que ruta estamos si usan root xplorer es mas facil ya que en la parte de superior izquierda te dice en que ruta estas, una ves savemos en que ruta estamos movemos el script a la raiz de la memoria y por si no les quedo muy claro lo de la ruta pueden dejar precionado el dedo sobre el script y le daran en propiedades o detalles hay les dira la ruta en el root explorer es la linea que dice ubicaccion en el caso de mi tablet seria

mnt/sdcard/

una ves sabiendo esto abrimos el script como texto si usan el root xplorer tienen que dejar precionado y seleccionar abrir como y seleccionan editor de texto
editamos la segunda linea con nuestra ruta
ejemplo

original sd=" "
modificado sd="mnt/sdcard/"

que no se les olvide el / al final :D ya editado guardamos y creamos una carpeta en la misma ruta donde tenemos el script y la carpeta se llamara cambio ya creada abriremos el Terminal emulator y escribiriamos, sin comillas dobles

"su"
nos pide permisos de super usuario y se los damos

despues

"sh ruta/cambio-su.sh"

donde puse ruta es "su ruta" por que cada dispositivo monta la memoria de manera diferente como ya di el ejemplo de mi tablet y mi Huawei si fuera el caso de mi tablet seria

"sh mnt/sdcard/cambio-su.sh"
una ves echo esto se nos tendira que mostrar un menu con una serie de opciones si nos da el siguiente error es por que la carpeta no esta en la misma ruta que el script

la carpeta no se a encontrado :(

si nos sale el menu salimos del terminal emulator apretando home para no cerrarlo y que podamos mover los 3 archivos a la carpeta cambio, si descargaron el zip con las dos verciones de super usuario solo descomprimen y eligen el que desean usar y copian los 3 archivos a la carpeta cambio ya realizado esto solo regresamos al terminal y seleccionamos la opcion 1 cambiar super usuario, yo les sugiero que antes de cambiar el super usuario realizen una copia por si algo no les gusta, espero actualizar el script añadiendo algunas otras opciones bueno a sido todo de mi parte y cualquier duda estoy para ayudar :D

carloscaballeros321@gmail.com by:jf;

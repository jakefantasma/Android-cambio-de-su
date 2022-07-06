#!/system/bin/sh
sd=""
#Creative Commons Reconocimiento-NoComercial-CompartirIgual 4.0 Internacional License
#creado por Caballeros Valle Carlos Sebastian
version="2.0"
clear
e="==============================================="
er="###############################################"
ba="$sd"cambio/copia/""
r="sh $sd"cambio-su.sh""
mount -o remount,rw system/ system/
#funciones
function ar(){
    echo $er
    echo "su"
    echo "gestor-su.apk"
    echo "xbin o bin"
    echo $er
}
#funcion de retorno al menu
function retorno(){
    clear
    echo $e
    echo "regresando al menu de inicio"
    echo $e
    sleep 2
    $r
}
#funcion error de opcion invalida
function op_in(){
    clear
    echo $er
    echo "#        eliga una opcion valida         #"
    echo $er
    sleep 2
    $r
}
#crea la carpeta temporal
function c_t(){
    clear
    echo  $e
    echo "creando carpeta temporal"
    sleep 1
    if [ -d system/tmp ]; then
        echo "la ruta temporal ya existia"
        sleep 1
        echo "se limpiara la ruta"
        sleep 1
        rm -r system/tmp
        echo "la ruta se limpio"
        mkdir system/tmp/
    else
        sleep 1
        echo "la ruta no existia"
        sleep 1
        echo "la ruta se creara"
        sleep 1
        mkdir system/tmp/
        echo "la ruta se creo"
    fi
    echo $e
    sleep 2
}
#esta funcion verifica los archivos para hacer el cambio
function verificacion_para_cambio(){
    clear
    echo $e
    echo "*               menu de cambio                *";
    echo $e
    sleep 2
    clear
    echo $e
    echo "*       se esta verificando los archivos      *"
    echo $e
    if [ -d $sd"cambio" ]; then
        echo "la carpeta cambio exise  :D "
        echo "revisando contenido"
        sleep 3
        if [ -e $sd"cambio/su" ] && [ -e $sd"cambio/gestor-su.apk" ]; then
            echo "lo archivos su y gestor-su.apk estan :D"
            echo "revisando si esta el archivo de ruta"
            sleep 3
            if [ -e $sd"cambio/xbin" ] || [ -e $sd"cambio/bin" ]; then
                echo "hay una ruta para la instalacion :D";
                echo $e
                echo "*precione enter para cambiar de super usuario *"
                echo $e
                read enterkey
                cambiar
 
            else
                echo "no hay una ruta para la instalacion"
                echo "falta la ruta revise que la carpeta"
                echo "cambio contenga los 3 archivos:"
                ar
            fi
        else
                echo "faltan archivos en la carpeta :("
                echo "revise que contenga los 3 archivos:"
                ar
        fi
    else
        echo "la carpeta no existe"
    fi
}
#esta funcion realiza el cambio si la verificaccion de los archivos es correcta
function cambiar(){
    c_t
    br_su_a
    echo "copiando archivo su a ruta tmp"
    sleep 1
    cp $sd"cambio/su" system/tmp
    echo "copiado a ruta tmp "
    sleep 1
    chmod 6755 system/tmp/*
    echo "permisos cambiados a su"
    sleep 1
    echo "revisando ruta de instalacion"
    sleep 1
    if [ -e $sd"cambio/xbin" ]; then
        sleep 1
        echo "moviendo a system/xbin"
        mv system/tmp/su system/xbin
    fi
    if [ -e $sd"cambio/bin" ]; then
        sleep 1
        echo "moviendo a system/bin"
        mv system/tmp/su system/bin
    fi
    echo $e
    echo "su instaldo :D"
    echo $e
    sleep 3
    echo "instalado gestor-su.apk"
    echo $e
    sleep 1
    echo "copiando gestor-su.apk a system/tmp"
    cp $sd"cambio/gestor-su.apk" system/tmp
    sleep 1
    echo "copiando :D"
    sleep 1
    echo "cambiando permisos"
    chmod 664 system/tmp/*
    sleep 1
    echo "permisos cambiados"
    sleep 1
    echo "revisando si ya existia gestor-su.apk"
    echo "en la ruta system/app"
    sleep 1
    if [ -e system/app/gestor-su.apk ]; then
        echo $e
        echo "ya existia un gestor-su se borrara"
        sleep 1
        rm system/app/gestor-su.apk
        echo "el archivo gestor-su.apk anterior se borro"
        echo $e
    else
        echo $e
        echo "no se encontro una version anterior de "
        echo "gestor-su"
        echo $e
    fi
    sleep 1
    echo "moviendo a system/app"
    mv system/tmp/gestor-su.apk system/app/
    sleep 1
    echo "se movio el archivo gestor-su.apk a system/app"
    echo $e
    echo "archivos su y gestor-su.apk se intalaron"
    echo "si no se notan los cambios reinicie su dispositivo"
    echo $e
    sleep 2
    retorno
}
#funcion borrar su anterior
function br_su_a(){
    echo "se esta revisando si hay otra version del archivo su"
    if [ -e system/bin/su ]; then
        echo "se encontro una version de su en la ruta"
        echo "system/bin"
        sleep 2
        echo "se borrara"
        sleep 2
        rm system/bin/su
        sleep 2
        echo "se borro la version anterior"
    fi
    if [ -e system/xbin/su ]; then
        echo "se encontro una version de su en la ruta"
        echo "system/xbin"
        sleep 2
        echo "se borrara"
        sleep 2
        rm system/xbin/su
        echo "se borro la version anterior"
    fi 
}
#funcion menu "" de copia 
function m_copia(){
    clear
    echo "esta funcion solo realiza la copia del archivo su no del el gestor que uste tiene, a menos que este en system/app y que tenga el nombre de gestor-su.apk"
    echo "realizar copia saviendo esto ...?"
    echo "s/n"
    read m
    case $m in
        s)
        clear; copia;   ;;
        n)
        clear; echo "no se realizo la copia del archivo su"; retorno;  ;;
        *)
        op_in ;;
    esac
}
#verifica si hay una copia y si no la hay la realiza y si hay una copia verifica el contenido y dice si es valida o no y pregunta si la desea borrar
function copia(){
    clear
    echo $e
    echo "se realizara la copia en la ruta $ba "
    sleep 1
    if [ -d $ba ]; then
        echo "la carpeta ya existe se esta revisando su contenido"
        sleep 1
        if [ -e $ba"su" ]; then
            echo "la carpeta contiene un archivo su "
            sleep 1
            echo "se revisara si contien una ruta valida"
            sleep 1
            if [ -e $ba"xbin" ] || [ -e $ba"bin" ]; then
                echo "hay una ruta"
                sleep 1
                echo "la copia es valida"
                echo $e
                sleep 1
            else
                echo $er
                echo "no hay una ruta :("
                echo "la ruta no es valida :("
                echo $er
                sleep 1
            fi
        else
            echo "no hay un archivo su :( la copia no es valida"
        fi
        sleep 1
        echo "desea remplazar esta copia ...?"
        echo "s/n"
        read b_c
        case $b_c in
                    s)
                    br_cop  ;;
                    n)
                    clear; echo "no se modifico la copia"; sleep 2; retorno ;;
                    *)
                    op_in   ;;
                esac        
    else
        echo "la ruta para la copia no existia"
        echo "la ruta se creara"
        mkdir $ba
        echo "la ruta se creo "
        cpia_r
    fi
}
#esta funcion borra la copia
function br_cop(){
    sleep 1
    echo "se borrara la copia"
    rm -r $ba
    mkdir $ba
    sleep 1
    echo "la ruta se limpio"
    echo $e
    cpia_r
}
#esta funcion realiza la copia no se usa de porsi solo se le llama par que la realize una ves este limpio el directiorio
function cpia_r(){ 
    echo "se esta realizando la copia"
    sleep 1
    if [ -e system/bin/su ]; then
        echo "se encontro el su en "
        sleep 1
        echo "system/bin"
        sleep 1
        cp system/bin/su $ba
        echo "la copia del archivo su se realizo"
        sleep 1
        echo "añadiendo ruta"
        sleep 1
        touch $ba"bin"
    fi
    if [ -e system/xbin/su ]; then
        echo "se encontro el su en "
        sleep 1
        echo "system/xbin"
        sleep 1
        cp system/xbin/su $ba
        echo "la copia del archivo su se realizo"
        sleep 1
        echo "añadiendo ruta"
        sleep 1
        touch $ba"xbin"
    fi
    echo "se esta revisando si existe un gestor-su.apk"
    sleep 1
    if [ -e system/app/gestor-su.apk ]; then
        echo "hay un gestor-su"
        sleep 1
        echo "copiando a $ba"
        sleep 1
        cp system/app/gestor-su.apk $ba
    else
        echo "no se encontro un gestor-su.apk :("
            sleep 1
    fi
    echo $e
    echo "la copia se realizo :D "
    echo $e
    sleep 3
    retorno 
}
#funcion de menu para restarurar
function m_res(){
    echo "se esta revisando si existe una copia"
    if [ -d $ba ];then
        echo "la carpeta existe verificando archivos"
        if [ -e $ba"su" ];then
            echo "existe una copia del archo su"
            echo "revisando si hay ruta para la instalacion"
            if [ -e $ba"xbin" ] || [ -e $ba"bin" ]; then
                echo "hay una ruta de instalacion"
                echo "se revisara si hay una version de gestor-su.apk"
                if [ -e $ba"gestor-su.apk"]; then
                    echo "hay una copia del gestor-su.apk"
                    res_o
                else
                    echo "no hay una copia del gestor-su.apk"
                    res_o
                fi
            else
                echo "no hay una ruta de instalacion :( "
                retorno
            fi
        else
            sleep 2
            echo "no hay una copia :( "
            retorno
        fi
    else
        sleep 2
        echo "no hay una copia :("
        retorno
    fi
}
#esta funcion hace la restauracion del su
function res_o(){
    echo $e
    echo "restaurando"
    echo $e
    c_t
    br_su_a
    sleep 1
    cp $ba"su" system/tmp
    chmod 6755 system/tmp/*
    if [ -e $ba"bin" ]; then
        echo "se movera a system/bin"
        sleep 1
        mv system/tmp/su system/bin
    fi
    if [ -e $ba"xbin" ]; then
        echo "se movera a system/xbin"
        sleep 1
        mv system/tmp/su system/xbin
    fi
 
    echo "se instalo el su :D"
    echo $e
    sleep 1
    echo "revisando si hay gestor para instalar"
    sleep 1
    if [ -e $ba"gestor-su.apk" ]; then
        echo "revisando si hay una version anterior del gestor-su.apk"
        sleep 1
        if [ -e system/app/gestor-su.apk ]; then
            echo $e
            echo "ya existia un gestor-su se borrara"
            sleep 1
            rm system/app/gestor-su.apk
            echo "el archivo gestor-su.apk anterior se borro"
            echo $e
        else
            echo $e
            echo "no se encontro una version anterior de "
            echo "gestor-su"
            echo $e
        fi
        echo "copiando a ruta temporal "
        cp $ba"gestor-su.apk" system/tmp
        echo "copia a ruta temporal"
        echo "cambiando premisos"
        chmod 664 system/tmp/*
        echo "permisos cambiados"
        echo "moviendo a system/app"
        mv system/tmp/gestor-su.apk system/app/
        echo "movido a system/app"
 
    else
        echo "no hay un gestor-su para instalar "
    fi
    echo "restauracion completa :D "
 
}
if [ -d $sd"cambio" ]; then
echo $e
echo "*                   by:jf                     *"
echo $e
echo "*    menu de para cambiar el super usuario    *"
echo $e;
echo "1. cambiar super usuario"
echo "2. copia de seguridad"
echo "3. restaurar copia"
echo "0. salir"
read op
case $op in
    1)
    verificacion_para_cambio;   ;;
    2) 
    m_copia;    ;;
    3)
    m_res ;;
    0)
    exit; ;;
    r)
    source a.sh ;;
    *)
    op_in; ;;
esac
else
    echo $er
    echo "la carpeta no se a encontrado :("
    echo $er
fi

#!/bin/bash
while true; do
echo Seleccione una opcion
echo "1) Listar contenido de un fichero"
echo "2) Crear archivo de texto"
echo "3) Comparar 2 archivos"
echo "4) Comando awk"
echo "5) Comando grep"
echo "6) Salir"


read opc

	case $opc in
		1) read -p "Esbriba la ruta absoluta del archivo:" ruta
			if [ -d "$ruta" ]; then
				ls -l $ruta
			else
				echo La $ruta no existe
			fi
			read
			clear
			;;
		2) read -p "Escribe la cadena de texto a ingresar:" cadena
			if [ "$cadena" ]; then
				echo $cadena > Archivo.txt
				echo Archivo creado y cadena escrita en el archivo
			else
				echo La cadena esta vacia
			fi
			read
			clear
			;;
		3)read -p "Ingresa la ruta del archivo uno:" rutaUno
			read -p "Ingresa la ruta del archivo dos:" rutaDos
			if [ -e "$rutaUno" ] && [ -e "$rutaDos" ]; then
				diff -u $rutaUno $rutaDos
			else
				echo Algunas de las rutas no existe
			fi
			read
			clear
			;;
		4) read -p "Ingresa la ruta del archivo a buscar el patron:" archivo
			if [ -e "$archivo"  ]; then
				awk {'print $1'} "$archivo"
			else
				echo "El archivo no existe"
			fi
			read
			clear
			;;
		5) read -p "Ingresa la ruta del archivo a buscar el patron" ruta
			read -p "Ingresa el patron a buscar" patron
			if [ -e "$ruta" ]; then
			       echo "Buscando patron: $patron en el archivo:"
			       grep "$patron" "$ruta"
			else
				echo "El archivo no existe"
			fi
			read
			clear
			;;
		6) exit;;

	esac
done

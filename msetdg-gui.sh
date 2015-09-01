#!/bin/bash
if [ ! -f "/usr/bin/zenity" ]
then
	echo "Please install Zenity in order to run this script."
	exit 1
elif [ ! -f "/usr/bin/espeak" ]
then
	zenity --warning --title="MSET Zenity" --text="eSpeak is not installed. Text-to-speech disabled."
fi

function download {
	espeak "$downloading $1" -v "$voice" &
	wget "$2" -O $1 | zenity --progress --title="MSET Zenity" --text="$downloading $1..." --no-cancel --pulsate
}

lang=$(zenity --list --title "ˈɛmsˈɛtdʒ zˈɛnɪti" --text 🗪 --column "" --height 220 English Español Français Italiano Português)
if [ $lang == English ]
then
	whattodownload="What would you like to download?"
	encrypted="encrypted"
	decrypted="decrypted"
	downloading="Downloading"
	which="Which version?"
	unavailable="File unavailable."
	region="Which is your region?"
	voice="english_rp"
elif [ $lang == Español ]
then
	whattodownload="¿Qué quiere descargar?"
	encrypted="criptografado"
	decrypted="descriptografado"
	downloading="Estoy descargando"
	which="¿Cuál versión?"
	unavailable="Archivo no disponible."
	region="¿Cuál es su región?"
	voice="spanish"
elif [ $lang == Français ]
then

	whattodownload="Que voulez-vous télécharger ?"
	encrypted="crypté"
	decrypted="décrypté"
	downloading="Téléchargement"
	which="Quelle version ?"
	unavailable="Fichier indisponible."
	region="Quelle est votre région ?"
	voice="french"
elif [ $lang == Italiano ]
then
	whattodownload="Cosa scaricare?"
	encrypted="criptato"
	decrypted="decriptato"
	downloading="Download in corso di"
	which="Quale versione?"
	unavailable="File non disponibile."
	unav_prn="Fail non disponibile."
	region="Quale regione?"
	voice="italian"
elif [ $lang == Português ]
then
	whattodownload="O que deseja baixar você?"
	encrypted="encrypted"
	decrypted="decrypted"
	downloading="Estou baixando"
	which="Qual versão?"
	unavailable="Arquivo não disponível."
	region="Qual é a sua região?"
	voice="portugal"
else
	exit 1
fi
espeak "$lang" -v "$voice"

espeak "$whattodownload" -v "$voice" &
a_whattodownload=$(zenity --list --title "MSET Zenity" --text "$whattodownload" --column "" --height 221 --width 300 MSET "FIRM (N3DS)" "FIRM (O3DS)" "NATIVE_FIRM (N3DS, $encrypted)" "NATIVE_FIRM (N3DS, $decrypted)")
espeak "$a_whattodownload" -v "$voice"

if [ "$a_whattodownload" == "MSET" ]
then
	espeak "$region" -v "$voice" &
	a_region=$(zenity --list --title "MSET Zenity" --text "$region" --column "" --height 242 CHN EUR JPN KOR TWN USA)
	if [ -z $a_region ]; then
		exit 1
	fi
	espeak "$a_region" -v "$voice"

	espeak "$which" -v "$voice" &
	a_which=$(zenity --list --title "MSET Zenity" --text "$which" --column "" --height 221 --width 160 "MSET 4.X $a_region" "MSET 6.X $a_region")
	espeak "$a_which" -v "$voice"
	if [ -z "$a_which" ]
	then
		exit 1
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "CHN" ]
	then
		download="https://dl.dropbox.com/s/mslumpknhs157cc/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "CHN" ]
	then
		download="unavailable"
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "EUR" ]
	then
		download="https://dl.dropbox.com/s/1ab4x3citqylty0/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "EUR" ]
	then
		download="https://dl.dropbox.com/s/yxqpdvfr6rfncjb/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "JPN" ]
	then
		download="https://dl.dropbox.com/s/8o86h3mnl643zc0/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "JPN" ]
	then
		download="https://dl.dropbox.com/s/tvytnoqzrpvxwdc/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "KOR" ]
	then
		download="https://dl.dropbox.com/s/uqpyjdjk9ia25ve/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "KOR" ]
	then
		download="https://dl.dropbox.com/s/rqzm5s33tvg8huw/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "TWN" ]
	then
		download="https://dl.dropbox.com/s/rf2nrguo74aie5o/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "TWN" ]
	then
		download="unavailable"
	elif [ "$a_which" == "MSET 4.X $a_region" -a "$a_region" == "USA" ]
	then
		download="https://dl.dropbox.com/s/0vrhdfvxpb5voh9/msetdg.bin?dl=0"
	elif [ "$a_which" == "MSET 6.X $a_region" -a "$a_region" == "USA" ]
	then
		download="https://dl.dropbox.com/s/gazwh6o5a6dwlw2/msetdg.bin?dl=0"
	fi

	if [ "$download" == "unavailable" ]
	then
		if [ -z "$unav_prn" ]; then
			espeak "$unavailable" -v "$voice" &
		else	espeak "$unav_prn" -v "$voice" &
		fi
		zenity --warning --title "MSET Zenity" --text "$unavailable"
		exit 1
	else
		download "msetdg.bin" "$download"
	fi
elif [ "$a_whattodownload" == "FIRM (N3DS)" ]
then
	download "firmware.bin" "https://dl.dropbox.com/s/xerkf653egaop6s/n3ds_firmware.bin?dl=0"
elif [ "$a_whattodownload" == "FIRM (O3DS)" ]
then
	download "firmware.bin" "https://dl.dropbox.com/s/fnouysgqrj4mg5o/o3dsfirmware.bin?dl=0"
elif [ "$a_whattodownload" == "NATIVE_FIRM (N3DS, $encrypted)" ]
then
	download "firmware.bin" "https://dl.dropbox.com/s/rphsi6bdg68nhcn/enc_NATIVE_FIRM_n3DS.bin?dl=0"
elif [ "$a_whattodownload" == "NATIVE_FIRM (N3DS, $decrypted)" ]
then
	download "firmware.bin" "https://dl.dropbox.com/s/8pmd0731w15kq5d/dec_nativefirm3ds_0004013820000002.bin?dl=0"
fi

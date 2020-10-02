#!/bin/bash
set -e
##################################################################################################################
# BSPWM-Install-ArchLinux
# Author	:	Moises Montaño


# Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Default
DefaultColor='\e[39m'   # Default foreground color

b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
spath="$( cd "$( dirname $0 )" && pwd )"


showlogo(){
  clear
echo ""
sleep 0.1
echo -e $Cyan   "    +${Yellow}------------------------------------------------------------------------------------------------${Cyan}+"
sleep 0.1
echo -e $Yellow   "    |                                                                                               $Yellow |"
sleep 0.1
echo -e "     |$Red                                   MPD & NCMPCPP INSTALLER                                     $Yellow |" 
sleep 0.1
echo -e "     |$Red                                                                                               $Yellow |"  
sleep 0.1
echo -e "     |$Red              \e[1;37m  Created By Moises Montaño @MoisesMP: github.com/MoisesMP                       $Yellow |"
sleep 0.1
echo -e $Cyan   "    +${Yellow}------------------------------------------------------------------------------------------------${Cyan}+${Yellow}"            
}


installmpd-en(){
    echo
    echo -e " Currently Installing ${b}MPD${enda}"
    echo -e " mpd is the music player daemon
              it will scan for music and server music to its clients"
    echo -e "  Read more about it here: ${b}https://wiki.archlinux.org/index.php/Music_Player_Daemon/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

      #mpd is the music player daemon
        #it will scan for music and server music to its clients
        #https://wiki.archlinux.org/index.php/Music_Player_Daemon

        sudo pacman -S mpd --noconfirm --needed
        sudo pacman -S mpc --noconfirm --needed

        # no double config allowed in here and in ~/.config
        sudo rm -f /etc/mpd.conf

        mkdir -p ~/.config/mpd

        cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf

        sed -i 's/#music_directory/music_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/music/~\/Music/g' ~/.config/mpd/mpd.conf

        sed -i 's/#playlist_directory/playlist_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/playlists/~\/.config\/mpd\/playlists/g' ~/.config/mpd/mpd.conf


        sed -i 's/#db_file/db_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/database/~\/.config\/mpd\/database/g' ~/.config/mpd/mpd.conf

        sed -i 's/#log_file/log_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/log/~\/.config\/mpd\/log/g' ~/.config/mpd/mpd.conf

        sed -i 's/#pid_file/pid_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/pid/~\/.config\/mpd\/pid/g' ~/.config/mpd/mpd.conf

        sed -i 's/#state_file/state_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/state/~\/.config\/mpd\/state/g' ~/.config/mpd/mpd.conf

        sed -i 's/#sticker_file/sticker_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/sticker/~\/.config\/mpd\/sticker/g' ~/.config/mpd/mpd.conf

        sed -i 's/#bind_to_address/bind_to_address/g' ~/.config/mpd/mpd.conf

        sed -i 's/#port/port/g' ~/.config/mpd/mpd.conf

        sed -i 's/#auto_update/auto_update/g' ~/.config/mpd/mpd.conf

        sed -i 's/#follow_inside_symlinks/follow_inside_symlinks/g' ~/.config/mpd/mpd.conf

        sed -i 's/~\/.mpd\/socket/~\/.config\/mpd\/socket/g' ~/.config/mpd/mpd.conf

        sed -i 's/#filesystem_charset/filesystem_charset/g' ~/.config/mpd/mpd.conf

        echo 'audio_output {
              type  "alsa"
              name  "mpd-alsa"
              mixer_type "software"
        }
        audio_output {
        type               "fifo"
        name               "toggle_visualizer"
        path               "/tmp/mpd.fifo"
        format             "44100:16:2"
        }' >> ~/.config/mpd/mpd.conf


        mkdir ~/.config/mpd/playlists

        systemctl --user enable mpd.service
        systemctl --user start mpd.service

        # more info @ https://wiki.archlinux.org/index.php/ncmpcpp

        sudo pacman -S ncmpcpp --noconfirm --needed

        mkdir ~/.ncmpcpp
        cp /usr/share/doc/ncmpcpp/config ~/.ncmpcpp/config

        sed -i 's/#mpd_host/mpd_host/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_port/mpd_port/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_music_dir = ~\/music/mpd_music_dir = ~\/Music/g' ~/.ncmpcpp/config


        cp /usr/share/doc/ncmpcpp/bindings ~/.ncmpcpp/bindings

    echo -e " ${b}MPD${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input

}

installmpd-es(){
    echo
    echo -e " Currently Installing ${b}MPD${enda}"
    echo -e " mpd is the music player daemon
              it will scan for music and server music to its clients"
    echo -e "  Read more about it here: ${b}https://wiki.archlinux.org/index.php/Music_Player_Daemon_(Español)/${endc}"
    echo && echo -en " ${y}Press Enter To Continue${endc}"
    read input

    #mpd is the music player daemon
        #it will scan for music and server music to its clients
        #https://wiki.archlinux.org/index.php/Music_Player_Daemon

        sudo pacman -S mpd --noconfirm --needed
        sudo pacman -S mpc --noconfirm --needed

        # no double config allowed in here and in ~/.config
        sudo rm -f /etc/mpd.conf

        mkdir -p ~/.config/mpd

        cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf

        sed -i 's/#music_directory/music_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/music/~\/Música/g' ~/.config/mpd/mpd.conf

        sed -i 's/#playlist_directory/playlist_directory/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/playlists/~\/.config\/mpd\/playlists/g' ~/.config/mpd/mpd.conf


        sed -i 's/#db_file/db_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/database/~\/.config\/mpd\/database/g' ~/.config/mpd/mpd.conf

        sed -i 's/#log_file/log_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/log/~\/.config\/mpd\/log/g' ~/.config/mpd/mpd.conf

        sed -i 's/#pid_file/pid_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/pid/~\/.config\/mpd\/pid/g' ~/.config/mpd/mpd.conf

        sed -i 's/#state_file/state_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/state/~\/.config\/mpd\/state/g' ~/.config/mpd/mpd.conf

        sed -i 's/#sticker_file/sticker_file/g' ~/.config/mpd/mpd.conf
        sed -i 's/~\/.mpd\/sticker/~\/.config\/mpd\/sticker/g' ~/.config/mpd/mpd.conf

        sed -i 's/#bind_to_address/bind_to_address/g' ~/.config/mpd/mpd.conf

        sed -i 's/#port/port/g' ~/.config/mpd/mpd.conf

        sed -i 's/#auto_update/auto_update/g' ~/.config/mpd/mpd.conf

        sed -i 's/#follow_inside_symlinks/follow_inside_symlinks/g' ~/.config/mpd/mpd.conf

        sed -i 's/~\/.mpd\/socket/~\/.config\/mpd\/socket/g' ~/.config/mpd/mpd.conf

        sed -i 's/#filesystem_charset/filesystem_charset/g' ~/.config/mpd/mpd.conf

        echo 'audio_output {
              type  "alsa"
              name  "mpd-alsa"
              mixer_type "software"
        }
        audio_output {
        type               "fifo"
        name               "toggle_visualizer"
        path               "/tmp/mpd.fifo"
        format             "44100:16:2"
        }' >> ~/.config/mpd/mpd.conf


        mkdir ~/.config/mpd/playlists

        systemctl --user enable mpd.service
        systemctl --user start mpd.service

        # more info @ https://wiki.archlinux.org/index.php/ncmpcpp

        sudo pacman -S ncmpcpp --noconfirm --needed

        mkdir ~/.ncmpcpp
        cp /usr/share/doc/ncmpcpp/config ~/.ncmpcpp/config

        sed -i 's/#mpd_host/mpd_host/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_port/mpd_port/g' ~/.ncmpcpp/config
        sed -i 's/#mpd_music_dir = ~\/music/mpd_music_dir = ~\/Música/g' ~/.ncmpcpp/config


        cp /usr/share/doc/ncmpcpp/bindings ~/.ncmpcpp/bindings

    echo -e " ${b}MPD${enda} Was Successfully Installed"
    echo -en " ${y}Press Enter To Return To Menu${endc}"
    echo
    read input

}

exitScript(){
  showlogo && echo -e "                           Thank You For Using ${b} MPD & NCMPCPP INSTALLER Script ${enda}"
  echo
  sleep 1
  exit
}

showmpd(){
    showlogo
    echo -e " ${b}            [MPD & NCMPCPP]${enda}"
    echo -e "
            1) MPD For English Systems
            2) MPD For Spanish Systems

            q)    Exit Script"

    echo
    echo -en " Choose An Option: "
    read option
    case $option in
        1) installmpd-en;;
        2) installmpd-es;;
        q) exitScript;;
        *) echo " \"$option\" Is Not A Valid Option"; sleep 1; showmpd ;;
  esac
}

showmpd
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

var=$(cat /home/josh/.fehbg)

PS1="%F{403434}%------------------------------------------------------------
%F{087DC0}%~ %F{847BE4}» "

if [[ $var = *"macOS-Sierra-Wallpaper-Macbook-Wallpaper.jpg"* ]]; then
	neofetch --source /home/josh/Downloads/arch-violet.png
elif [[ $var = *"tmp.jpg"* ]]; then
	neofetch --source /home/josh/Downloads/arch-tmp.png	
elif [[ $var = *"seconds.png"* ]]; then
	neofetch --source /home/josh/Downloads/arch-pink.png	
elif [[ $var = *"tfo6Z0.jpg"* ]]; then
	neofetch --source /home/josh/Downloads/arch-yellow.png	
elif [[ $var = *"wallhaven-61574.jpg"* ]]; then
	neofetch --source /home/josh/Downloads/arch-blue.png	
elif [[ $var = *"6Pca5oR.png"* ]]; then
	neofetch --source /home/josh/Downloads/arch-purple.png	
elif [[ $var = *"solar.png"* ]]; then
	neofetch --source /home/josh/Downloads/arch-orange.png	
else
	neofetch
fi 	

export EDITOR='vim'

transfer() { 
    if [ $# -eq 0 ]; 
    then 
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
    tmpfile=$( mktemp -t transferXXX )
    file=$1
    if tty -s; 
    then 
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g') 
        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        if [ -d $file ];
        then
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else 
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi
    cat $tmpfile
    rm -f $tmpfile
}
alias ...='cd /'
alias update='pacaur -Syu --noconfirm; sudo pacman -Rns $(sudo pacman -Qttdq) --noconfirm; pacaur -Sc --noconfirm; rm -rf /home/josh/.cache/*'
alias moreupdate='pacaur -Syu --noconfirm; sudo pacman -Rns $(sudo pacman -Qttdq) --noconfirm; pacaur -Scc; rm -rf /home/josh/.cache/*'
alias pacman='sudo pacman'
alias pacaur -Rns='sudo pacman -Rns'

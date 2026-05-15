function proxy_on(){
	export http_proxy="http://127.0.0.1:7897"
	export https_proxy=$http_proxy
	export HTTP_PROXY="http://127.0.0.1:7897"
	export HTTPS_PROXY=$HTTP_PROXY
	git config --global http.proxy "http://127.0.0.1:7897"
    git config --global https.proxy "http://127.0.0.1:7897"
	echo "Proxy enabled"
}

function 2027(){
   echo -e "\n  🌅 2026  \n\n  心有所悦、业有所成，\n  万事皆可期！\n" \
   | cowsay -n -f tux \
   | while IFS= read -r line; do echo "$line" ; sleep 0.1; done \
   | lolcat -F 0.05 -S 12 -t
}

function 2026(){
   echo -e "\n 🚀 System Reboot... \n [OK] Happiness Loaded \n [OK] Health Loaded \n [OK] Wealth Loaded \n\n Happy New Year 2026! \n" \
   | cowsay -n -f tux \
   | while IFS= read -r line; do echo "$line" ; sleep 0.1; done \
   | lolcat -F 0.05 -S 12 -t
}
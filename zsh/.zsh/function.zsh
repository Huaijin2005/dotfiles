export PROXY="http://127.0.0.1:7897"
function proxy_on(){
	export http_proxy="$PROXY"
	export https_proxy="$PROXY"
   export all_proxy="$PROXY"
   export HTTP_PROXY="$http_proxy"
	export HTTPS_PROXY="$https_proxy"
   export ALL_PROXY="$all_proxy"
	echo "Proxy enabled: $PROXY!"
}

function proxy_off() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
    unset all_proxy ALL_PROXY
    echo "Proxy disabled!"
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

function codex-a() {
  CODEX_HOME="$HOME/.codex-a" codex "$@"
}

function codex-b() {
  CODEX_HOME="$HOME/.codex-b" codex "$@"
}
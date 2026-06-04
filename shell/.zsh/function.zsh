export PROXY="http://127.0.0.1:7897"
function proxy_on(){
	export http_proxy="$PROXY"
	export https_proxy="$PROXY"
   export all_proxy="$PROXY"
   export HTTP_PROXY="$http_proxy"
	export HTTPS_PROXY="$https_proxy"
   export ALL_PROXY="$all_proxy"
	echo "Proxy enabled: $PROXY."
}

function proxy_off() {
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
    unset all_proxy ALL_PROXY
    echo "Proxy disabled."
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



function check_private() {
   local private_file="${HOME}/.zsh/private.zsh"
   local list_file="${HOME}/.zsh/private_env_list"
   local missing=() extra=() private_vars=()

   if [ ! -f "$private_file" ]; then
      echo "Error: $private_file not found." >&2
      return 1
   fi

   if [ -f "${HOME}/.zsh/private_env_list" ]; then
      PRIVATE_ENV_LIST=(${(f)"$(sed 's/[[:space:]]*#.*//; /^[[:space:]]*$/d' "${HOME}/.zsh/private_env_list")"})
   else
      PRIVATE_ENV_LIST=()
   fi

   if command -v rg >/dev/null 2>&1; then
      private_vars=($(rg '^[[:space:]]*export[[:space:]]+([A-Za-z_][A-Za-z0-9_]*)' -o -r '$1' "$private_file"))
   elif echo test | grep -oP 'test' >/dev/null 2>&1; then
      private_vars=($(grep -oP '^[[:space:]]*export[[:space:]]+\K[A-Za-z_]\w*' "$private_file"))
   else
      private_vars=($(sed -n 's/^[[:space:]]*export[[:space:]]\{1,\}\([A-Za-z_][A-Za-z0-9_]*\).*/\1/p' "$private_file"))
   fi

   for var in "${PRIVATE_ENV_LIST[@]}"; do
      if [[ ! -v "$var" ]]; then
         missing+=("$var")
      fi
   done

   for var in "${private_vars[@]}"; do
      if [ -z "${PRIVATE_ENV_LIST[(r)$var]}" ]; then
         extra+=("$var")
      fi
   done

   if [ ${#missing} -eq 0 ] && [ ${#extra} -eq 0 ]; then
      echo "private.zsh matches PRIVATE_ENV_LIST."
      return 0
   fi

   [ ${#missing} -gt 0 ] && echo "Missing: ${missing[*]}"
   if [ ${#extra} -gt 0 ]; then
      echo "Extra: ${extra[*]}"
      echo -n "Add to $list_file? [y/N] "
      read -r answer
      case "$answer" in
         [yY]|[yY][eE][sS])
               for var in "${extra[@]}"; do
                  echo "$var" >> "$list_file"
               done
               echo "Added: ${extra[*]}"
               return 0
               ;;
      esac
   fi
   return 1
}


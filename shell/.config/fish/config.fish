source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

set -gx PROXY http://127.0.0.1:7897

function proxy_on
	set -gx http_proxy $PROXY
	set -gx https_proxy $PROXY
	set -gx all_proxy $PROXY
	set -gx HTTP_PROXY $PROXY
	set -gx HTTPS_PROXY $PROXY
	set -gx ALL_PROXY $PROXY

	echo "Proxy enabled: $PROXY"
end

function proxy_off
	set -e http_proxy
	set -e https_proxy
	set -e all_proxy
	set -e HTTP_PROXY
	set -e HTTPS_PROXY
	set -e ALL_PROXY

	echo "Proxy disabled"
end

starship init fish | source

proxy_on

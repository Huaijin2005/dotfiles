#!/bin/bash
for p in /sys/class/drm/card*-*/status; do
    name=$(basename "$(dirname "$p")")
    status=$(cat "$p")

    [ "$status" = "connected" ] || continue

    card="${name%%-*}"
    conn="${name#"$card"-}"
    pci=$(basename "$(readlink -f /sys/class/drm/$card/device)" 2>/dev/null)

    echo "=============================="
    echo "DRM connector : $conn"
    echo "DRM path      : /sys/class/drm/$name"
    echo "DRM card      : $card"
    echo "PCI device    : $pci"
    lspci -nnk -s "$pci" 2>/dev/null | sed 's/^/  /'
done
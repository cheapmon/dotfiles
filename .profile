# .:.
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/git/architecture/bin/ia:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export COMPOSE_HTTP_TIMEOUT=86400

# Setup variables based on machine
export MACHINE_ID=$(cat /etc/machine-id)

case $MACHINE_ID in
  4ab0815ef27f484ebae33a3f0f9b7a56) # t14s
    export MONITOR=eDP
    export MONITOR_LEFT=HDMI-A-0
    export MONITOR_RIGHT=DisplayPort-2

    export NETWORK_INTERFACE=enp2s0f0
    ;;
  22569a7abbb04344bf9f8b443d404cc4) # omen
    export MONITOR=
    export MONITOR_LEFT=DP-0
    export MONITOR_RIGHT=HDMI-0

    export NETWORK_INTERFACE=enp34s0
    ;;
esac

# Make variables available to i3
echo "*monitor: $MONITOR
*monitor_left: $MONITOR_LEFT
*monitor_right: $MONITOR_RIGHT" > $HOME/.Xresources

# .:.
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/seims/bin:$HOME/git/architecture/bin/ia:$HOME/.local/share/gem/ruby/3.0.0/bin
export COMPOSE_HTTP_TIMEOUT=86400

# Setup variables based on machine
export MACHINE_ID=$(cat /etc/machine-id)

case $MACHINE_ID in
  5938cd00e7304a739aaae2286797acb6) # t480s
    export MONITOR=eDP-1
    export MONITOR_LEFT=
    export MONITOR_RIGHT=
    export AUTORANDR_PROFILE=t480s

    export WORK=
    export TOUCHPAD="Elan Touchpad"

    export NETWORK_INTERFACE=wlp61s0
    export BACKLIGHT_CARD=intel_backlight

    export VIM_COLORSCHEME=catppuccin-mocha
    export TMUX_COLORSCHEME=mocha
    export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ;;
  4ab0815ef27f484ebae33a3f0f9b7a56) # t14s
    export MONITOR=eDP
    export MONITOR_LEFT=HDMI-A-0
    export MONITOR_RIGHT=DisplayPort-2
    export AUTORANDR_PROFILE=work

    export WORK=yes
    export TOUCHPAD="ETPS/2 Elantech Touchpad"

    export NETWORK_INTERFACE=enp2s0f0
    export BACKLIGHT_CARD=amdgpu_bl0

    export VIM_COLORSCHEME=catppuccin-mocha
    export TMUX_COLORSCHEME=mocha
    export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ;;
  32a2e774d50449fb9f9b936bba932d09) # t14s
    export MONITOR=eDP
    export MONITOR_LEFT=HDMI-A-0
    export MONITOR_RIGHT=DisplayPort-6
    export AUTORANDR_PROFILE=work

    export WORK=yes
    export TOUCHPAD="ELAN0676:00 04F3:3195 Touchpad"

    export NETWORK_INTERFACE=enp197s0f4u1u1
    export BACKLIGHT_CARD=amdgpu_bl0

    export VIM_COLORSCHEME=catppuccin-mocha
    export TMUX_COLORSCHEME=mocha
    export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ;;
  22569a7abbb04344bf9f8b443d404cc4) # omen
    export MONITOR=
    export MONITOR_LEFT=DP-0
    export MONITOR_RIGHT=HDMI-0
    export AUTORANDR_PROFILE=home

    export WORK=yes
    export TOUCHPAD=

    export NETWORK_INTERFACE=enp34s0
    export BACKLIGHT_CARD=amdgpu_bl0

    export VIM_COLORSCHEME=catppuccin-latte
    export TMUX_COLORSCHEME=latte
    export FZF_DEFAULT_OPTS=" \
--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"
    ;;
  *)
    export MONITOR=$(xrandr | grep -w connected | head -n1 | cut -d' ' -f1)
    export MONITOR_LEFT=
    export MONITOR_RIGHT=
    export AUTORANDR_PROFILE=

    export WORK=
    export TOUCHPAD=

    export NETWORK_INTERFACE=$(nmcli | grep -w connected | cut -d' ' -f1 | sed 's/://')
    export BACKLIGHT_CARD=

    export VIM_COLORSCHEME=catppuccin-mocha
    export TMUX_COLORSCHEME=mocha
    export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
esac

# Make variables available to i3
echo "*monitor: $MONITOR
*monitor_left: $MONITOR_LEFT
*monitor_right: $MONITOR_RIGHT
*touchpad: $TOUCHPAD" > $HOME/.Xresources

# Adjust monitors
autorandr $AUTORANDR_PROFILE

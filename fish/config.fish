if status is-login; and test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    exec mango
end

if status is-interactive
    fastfetch
end

alias clock="tty-clock -c -C 1 -t"
alias matrix="cmatrix -C red -b"
alias lava="lavat -c red"

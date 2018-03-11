RDIR=$(dirname $0)

xrgc() {
case $1 in 
    fg)
        xrdb -query | egrep -m1 "^\*\.?foreground:" | awk '{print $NF}' 
    ;;
    bg)
        xrdb -query | egrep -m1 "^\*\.?background:" | awk '{print $NF}' 
    ;;
    *) 
        xrdb -query | egrep -m1 "^\*\.?color$1:" | awk '{print $NF}'
    ;;
esac
}

cp $RDIR/themerc $RDIR/themerc.bak
cat > $RDIR/themerc <<EOF
# Theme name : teringatmantan 
# Generate from obtgen

# Section: menu
menu.border.width:                      15
menu.border.color:                      $(xrgc fg)
menu.separator.color:                   $(xrgc fg)
menu.*.bg:                              flat
menu.*.bg.color:                        $(xrgc fg)
menu.*.text.color:                      $(xrgc bg)
menu.*.text.justify:                    center 
menu.*.disabled.text.color:             $(xrgc fg)
menu.*.active.text.color:               $(xrgc fg)
menu.*.active.bg.color:                 $(xrgc bg)

# Section: osd
osd.border.width:                       0
osd.border.color:                       $(xrgc fg)
osd.bg:                                 flat
osd.bg.color:                           $(xrgc fg)
osd.label.bg:                           flat solid
osd.label.bg.color:                     $(xrgc fg)
osd.label.text.color:                   $(xrgc bg)
osd.highlight.bg:                       flat solid
osd.highlight.bg.color:                 $(xrgc fg)
osd.unhighlight.bg:                     flat
osd.unhighlight.bg.color:               $(xrgc fg)
osd.button.unpressed.bg:                flat
osd.button.unpressed.bg.color:          $(xrgc fg)
osd.button.unpressed.*.border.color:    $(xrgc fg)
osd.button.pressed.bg:                  flat
osd.button.pressed.bg.color:            $(xrgc fg)
osd.button.pressed.*.border.color:      $(xrgc fg)
osd.button.focused.bg:                  flat  
osd.button.focused.bg.color:            $(xrgc fg)
osd.button.focused.*.border.color:      $(xrgc fg)
osd.button.focused.box.color:           $(xrgc fg)

# Section: window
window.*.bg:                            flat parentrelative
window.*.*.bg:                          flat parentrelative
window.*.*.*.bg:                        flat parentrelative
window.*.text.justify:                  left

window.*.button.*.image.color:           $(xrgc bg)
window.*.label.text.color:               $(xrgc bg)
window.*.title.bg.color:                 $(xrgc fg)
window.*.title.separator.color:          $(xrgc fg)
window.*.border.color:                   $(xrgc fg)
window.*.handle.bg.color:                $(xrgc fg)

# Section: fonts
window.active.label.text.font:          shadow=n
window.inactive.label.text.font:        shadow=n
menu.items.font:                        shadow=n
menu.title.text.font:                   shadow=n

# Section: misc
border.width:                           0
padding.width:                          10
padding.height:                         10
window.client.padding.height:           0
window.client.padding.width:            0
window.label.text.justify:              left
EOF

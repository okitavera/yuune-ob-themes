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
# Theme name : sendiki-obtgen 
# Generate from obtgen

# Section: menu
menu.border.width:                      10
menu.border.color:                      $(xrgc bg)
menu.separator.color:                   $(xrgc bg)
menu.*.bg:                              flat
menu.*.bg.color:                        $(xrgc bg)
menu.*.text.color:                      $(xrgc fg)
menu.*.text.justify:                    center 
menu.*.disabled.text.color:             $(xrgc bg)
menu.*.active.text.color:               $(xrgc bg)
menu.*.active.bg.color:                 $(xrgc fg)

# Section: osd
osd.border.width:                       0
osd.border.color:                       $(xrgc bg)
osd.bg:                                 flat
osd.bg.color:                           $(xrgc bg)
osd.label.bg:                           flat solid
osd.label.bg.color:                     $(xrgc bg)
osd.label.text.color:                   $(xrgc fg)
osd.hilight.bg:                         flat solid
osd.hilight.bg.color:                   $(xrgc 4)
osd.unhilight.bg:                       flat
osd.unhilight.bg.color:                 $(xrgc 8)
osd.button.unpressed.bg:                flat
osd.button.unpressed.bg.color:          $(xrgc 8)
osd.button.unpressed.*.border.color:    $(xrgc bg)
osd.button.pressed.bg:                  flat
osd.button.pressed.bg.color:            $(xrgc 8)
osd.button.pressed.*.border.color:      $(xrgc bg)
osd.button.focused.bg:                  flat  
osd.button.focused.bg.color:            $(xrgc bg)
osd.button.focused.*.border.color:      $(xrgc bg)
osd.button.focused.box.color:           $(xrgc 4)

# Section: window
window.*.bg:                            flat parentrelative
window.*.*.bg:                          flat parentrelative
window.*.*.*.bg:                        flat parentrelative
window.*.text.justify:                  center
window.active.button.*.*.image.color:   $(xrgc bg)
window.active.label.text.color:         $(xrgc bg)
window.active.title.bg.color:           $(xrgc 5)
window.active.title.separator.color:    $(xrgc 5)
window.active.border.color:             $(xrgc 5)
window.inactive.button.*.*.image.color: $(xrgc bg)
window.inactive.label.text.color:       $(xrgc bg)
window.inactive.title.bg.color:         $(xrgc 4)
window.inactive.title.separator.color:  $(xrgc 4)
window.inactive.border.color:           $(xrgc 5)

# Section: fonts
window.active.label.text.font:          shadow=n
window.inactive.label.text.font:        shadow=n
menu.items.font:                        shadow=n
menu.title.text.font:                   shadow=n

# Section: misc
border.width:                           0
padding.width:                          10
padding.height:                         10
window.handle.width:                    0
window.client.padding.width:            0
window.label.text.justify:              center
EOF

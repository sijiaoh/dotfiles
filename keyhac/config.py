from keyhac import *

def configure(keymap):
    keymap_global = keymap.defineWindowKeymap()

    keymap_global[ "Ctrl-M" ] = "Return"
    keymap_global[ "Ctrl-Shift-M" ] = "Shift-Return"
    keymap_global[ "Ctrl-H" ] = "Back"
    keymap_global[ "Alt-H" ] = "Alt-Back"
    keymap_global[ "Ctrl-D" ] = "Delete"
    keymap_global[ "Alt-D" ] = "Alt-Delete"
    keymap_global[ "Ctrl-I" ] = "Tab"
    keymap_global[ "Ctrl-Shift-I" ] = "Shift-Tab"
    keymap_global[ "Ctrl-P" ] = "Up"
    keymap_global[ "Ctrl-N" ] = "Down"
    keymap_global[ "Ctrl-B" ] = "Left"
    keymap_global[ "Ctrl-F" ] = "Right"
    keymap_global[ "Alt-F" ] = "Alt-Right"
    keymap_global[ "Alt-B" ] = "Alt-Left"
    keymap_global[ "Ctrl-G" ] = "Esc"
    keymap_global[ "Ctrl-OpenBracket" ] = "Esc"
    # 左 Command 単独押しで英数
    keymap_global["O-LAlt"] = "102"
    # 右 Command 単独押しでかな
    keymap_global["O-RAlt"] = "104"

    keymap_local = {}
    for app in ["com.github.atom"]:
        keymap_local[app] = keymap.defineWindowKeymap(app_name=app)

        keymap_local[app]['Alt-D'] = 'Alt-D'
        keymap_local[app][ "Ctrl-I" ] = "Ctrl-I"

        keymap_local[app][ "Ctrl-P" ] = "Ctrl-P"
        keymap_local[app][ "Ctrl-N" ] = "Ctrl-N"
        keymap_local[app][ "Ctrl-B" ] = "Ctrl-B"
        keymap_local[app][ "Ctrl-F" ] = "Ctrl-F"

    for app in ["com.jetbrains.rubymine"]:
        keymap_local[app] = keymap.defineWindowKeymap(app_name=app)

        keymap_local[app]['Ctrl-H'] = 'Back'

        keymap_local[app][ "Ctrl-P" ] = "Ctrl-P"
        keymap_local[app][ "Ctrl-N" ] = "Ctrl-N"
        keymap_local[app][ "Ctrl-B" ] = "Ctrl-B"
        keymap_local[app][ "Ctrl-F" ] = "Ctrl-F"

    for app in ["com.googlecode.iterm2", "org.gnu.Emacs"]:
        keymap_local[app] = keymap.defineWindowKeymap(app_name=app)

        keymap_local[app][ "Ctrl-H" ] = "Ctrl-H"
        keymap_local[app][ "Alt-H" ] = "Alt-H"
        keymap_local[app][ "Ctrl-D" ] = "Ctrl-D"
        keymap_local[app][ "Alt-D" ] = "Alt-D"
        keymap_local[app][ "Ctrl-G" ] = "Ctrl-G"

        keymap_local[app][ "Ctrl-P" ] = "Ctrl-P"
        keymap_local[app][ "Ctrl-N" ] = "Ctrl-N"
        keymap_local[app][ "Ctrl-B" ] = "Ctrl-B"
        keymap_local[app][ "Ctrl-F" ] = "Ctrl-F"

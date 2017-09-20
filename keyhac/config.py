from keyhac import *

def configure(keymap):
    keymap_global = keymap.defineWindowKeymap()

    keymap_global[ "Ctrl-M" ] = "Return"
    # keymap_global[ "Ctrl-H" ] = "Back"
    keymap_global[ "Cmd-H" ] = "Alt-Back"
    # keymap_global[ "Ctrl-D" ] = "Delete"
    keymap_global[ "Cmd-D" ] = "Alt-Delete"
    keymap_global[ "Ctrl-I" ] = "Tab"
    # keymap_global[ "Ctrl-P" ] = "Up"
    # keymap_global[ "Ctrl-N" ] = "Down"
    # keymap_global[ "Ctrl-F" ] = "Right"
    # keymap_global[ "Ctrl-B" ] = "Left"
    # keymap_global[ "Cmd-F" ] = "Alt-Right"
    # keymap_global[ "Cmd-B" ] = "Alt-Left"
    # keymap_global[ "Ctrl-S" ] = "Cmd-F"
    keymap_global[ "Ctrl-G" ] = "Esc"
    keymap_global[ "Ctrl-OpenBracket" ] = "Esc"

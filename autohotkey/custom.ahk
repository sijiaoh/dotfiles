;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
;  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
;    Return 1
;  IfWinActive,ahk_class MEADOW ; Meadow
;    Return 1
;  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
;    Return 1
;  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
;    Return 1
;  ; Avoid VMwareUnity with AutoHotkey
;  IfWinActive,ahk_class VMwareUnityHostWndClass
;    Return 1
;  IfWinActive,ahk_class Vim ; GVIM
;    Return 1
;  IfWinActive,ahk_class PuTTY
;    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

delete_char()
{
  Send {Del}
  Return
}
delete_backward_char()
{
  Send {BS}
  Return
}
kill_line()
{
  Send {ShiftDown}{END}{SHIFTUP}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  Return
}
open_line()
{
  Send {END}{Enter}{Up}
  Return
}
quit()
{
  Send {ESC}
  Return
}
newline()
{
  Send {Enter}
  Return
}
shift_newline()
{
  Send +{Enter}
  Return
}
indent_for_tab_command()
{
  Send {Tab}
  Return
}
newline_and_indent()
{
  Send {Enter}{Tab}
  Return
}
select_all()
{
  Send ^a
  Return
}
isearch_forward()
{
  Send ^f
  Return
}
isearch_backward()
{
  Send ^f
  Return
}
kill_region()
{
  Send ^x
  Return
}
kill_ring_save()
{
  Send ^c
  Return
}
yank()
{
  Send ^v
  Return
}
undo()
{
  Send ^z
  Return
}
find_file()
{
  Send ^o
  Return
}
save_buffer()
{
  Send, ^s
  Return
}
kill_emacs()
{
  Send !{F4}
  Return
}

move_beginning_of_line()
{
  Send {HOME}
  Return
}
move_end_of_line()
{
  Send {END}
  Return
}
previous_line()
{
  Send {Up}
  Return
}
next_line()
{
  Send {Down}
  Return
}
forward_char()
{
  Send {Right}
  Return
}
backward_char()
{
  Send {Left}
  Return
}
scroll_up()
{
  Send {PgUp}
  Return
}
scroll_down()
{
  Send {PgDn}
  Return
}

^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
    forward_char()
  Return
^d::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_char()
  Return
^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    delete_backward_char()
  Return
^k::
  If is_target()
    Send %A_ThisHotkey%
  Else
    kill_line()
  Return
^[::
  If is_target()
    Send %A_ThisHotkey%
  Else
    quit()
  Return
^m::
  If is_target()
    Send %A_ThisHotkey%
  Else
    newline()
  Return
^+m::
  If is_target()
    Send %A_ThisHotkey%
  Else
    shift_newline()
  Return
^i::
  If is_target()
    Send %A_ThisHotkey%
  Else
    indent_for_tab_command()
  Return
^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_beginning_of_line()
  Return
^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    move_end_of_line()
  Return
^p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    previous_line()
  Return
^n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    next_line()
  Return
^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    backward_char()
  Return
^g::
  If is_target()
    Send %A_ThisHotkey%
  Else
    quit()
  Return

!a::Send ^a
+!a::Send +^a
!b::Send ^b
+!b::Send +^b
!c::Send ^c
+!c::Send +^c
!d::Send ^d
+!d::Send +^d
!e::Send ^e
+!e::Send +^e
!f::Send ^f
+!f::Send +^f
!g::Send ^g
+!g::Send +^g
!h::Send ^h
+!h::Send +^h
!i::Send ^i
+!i::Send +^i
!j::Send ^j
+!j::Send +^j
!k::Send ^k
+!k::Send +^k
!l::Send ^l
+!l::Send +^l
!m::Send ^m
+!m::Send +^m
!n::Send ^n
+!n::Send +^n
!o::Send ^o
+!o::Send +^o
!p::Send ^p
+!p::Send +^p
!q::Send ^q
+!q::Send +^q
!r::Send ^r
+!r::Send +^r
!s::Send ^s
+!s::Send +^s
!t::Send ^t
+!t::Send +^t
!u::Send ^u
+!u::Send +^u
!v::Send ^v
+!v::Send +^v
!w::Send ^w
+!w::Send +^w
!x::Send ^x
+!x::Send +^x
!y::Send ^y
+!y::Send +^y
!z::Send ^z
+!z::Send +^z

![::Send ^[
!]::Send ^]
!;::Send ^;
!'::Send ^'
!,::Send ^,
!.::Send ^.
!/::Send ^/

!Enter::Send ^{Enter}
^!m::Send ^{Enter}

; !sc029::EscだとAltEscが発動してしまう。
!sc029::Send {Esc}

#Include IME.ahk

; 上部メニューがアクティブになるのを抑制
*~LAlt::Send {Blind}{vkFF}
*~RAlt::Send {Blind}{vkFF}

; 左 Alt 空打ちで IME を OFF
LAlt up::
    if (A_PriorHotkey == "*~LAlt")
    {
        IME_SET(0)
    }
    Return

; 右 Alt 空打ちで IME を ON
RAlt up::
    if (A_PriorHotkey == "*~RAlt")
    {
        IME_SET(1)
    }
    Return

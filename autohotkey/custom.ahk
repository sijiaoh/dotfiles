#InstallKeybdHook
#UseHook

; Disables Alt key press behaviour.
; *~Alt::Send {Blind}{vkFF}
; For Alt IME.
*~LAlt::Send {Blind}{vkFF}
*~RAlt::Send {Blind}{vkFF}

; Enter.
^m::Send {Enter}
^+m::Send +{Enter}
^!m::Send ^{Enter}
!Enter::Send ^{Enter}

; Movements.
^p::Send {Up}
^n::Send {Down}
^b::Send {Left}
^f::Send {Right}

^a::Send {Home}
^e::Send {End}

; Others.
^d::Send {Del}
^h::Send {Bs}
^i::Send {Tab}
^[::Send {Esc}
^g::Send {Esc}

^k::
  Send {ShiftDown}{End}{ShiftUp}
  Sleep 50 ; [ms] this value depends on your environment.
  Send ^x

; Map Alt+` to Esc (for HHKB).
; vk19 is hankaku/zenkaku.
vk19::Send {Esc}
!vk19::Send {Esc}

; Mapping Alt+{key} to Ctrl+{key}.
; Do not map Alt to Ctrl directly. Because Alt+Tab is not reproducible. Do it redundantly.
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
+![::Send +^[
!]::Send ^]
+!]::Send +^]
!;::Send ^;
+!;::Send +^;
!'::Send ^'
+!'::Send +^'
!,::Send ^,
+!,::Send +^,
!.::Send ^.
+!.::Send +^.
!/::Send ^/
+!/::Send +^/

; IME controls.

#Include IME.ahk

; Pressing the left Alt key without pressing any other keys turns on IME.
LAlt up::
  if (A_PriorHotkey == "*~LAlt") {
    IME_SET(0)
  }

; Pressing the right Alt key without pressing any other keys turns on IME.
RAlt up::
  if (A_PriorHotkey == "*~RAlt") {
    IME_SET(1)
  }

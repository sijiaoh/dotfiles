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

; Movements.
^p::Send {Up}
^n::Send {Down}
^b::Send {Left}
+^b::Send +{Left}
^f::Send {Right}
+^f::Send +{Right}

^a::Send {Home}
+^a::Send +{Home}
^e::Send {End}
+^e::Send +{End}

; Others.
^d::Send {Del}
+^d::Send ^{Del}
^h::Send {Bs}
+^h::Send ^{Bs}
^i::Send {Tab}
^[::Send {Esc}
^g::Send {Esc}

^k::
  Send {ShiftDown}{End}{ShiftUp}
  Sleep 50 ; [ms] this value depends on your environment.
  Send ^x
  Return

; Map Alt+` to Esc (for HHKB).
; vk19 is hankaku/zenkaku.
vk19::Send {Esc}
!vk19::Send {Esc}

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

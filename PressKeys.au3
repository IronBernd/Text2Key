#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>


Func TypeText($text)
				Send("!{TAB}")
				Sleep(1000) ; delay for window to get the focus
				$n=StringLen($text)
				For $i = 1 To $n
					$s=StringMid($text,$i,1)
					Switch $s
						Case "!"
							$s="{!}"
						Case "+"
							$s = "{+}"
					EndSwitch
					$r= Random(12,120)
					Sleep($r)
					Send($s)
				Next

EndFunc

$hGui=GUICreate("Text2Input",400,80)
$hInp=GUICtrlCreateInput("",10,10,300,60,4 + 0x80 + 0x40 ) ; $ES_MULTILINE $ES_AUTOHSCROLL
$hENTER=GUICtrlCreateButton("ENTER",320,10)
$hType=GUICtrlCreateButton("TYPE",320,40)

GUISetState(@SW_SHOW, $hGUI)


  While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
			Case $hENTER
				$text=GUICtrlRead($hInp)
				TypeText($text)
				Send("{ENTER}")
			Case $hType
				$text=GUICtrlRead($hInp)
				TypeText($text)
        EndSwitch
    WEnd

    ; Delete the previous GUI and all controls.
    GUIDelete($hGUI)

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBosConstants.au3>


#Region ### START Koda GUI section ### Form=c:\users\bailey\desktop\school\ccdc\form1.kxf
$Form1_1 = GUICreate("CCDC QuickTasks", 615, 437, 256, 256)
GUISetBkColor(0xD7E4F2)
$cmd = GUICtrlCreateButton("netstat ESTABLSHED", 32, 40, 123, 25)
$ProcessExplorer = GUICtrlCreateButton("ProcessExplorer", 328, 40, 115, 25)
$HostFile = GUICtrlCreateButton("HostFile", 240, 40, 91, 25)
$exit = GUICtrlCreateButton("exit", 32, 80, 75, 25)
$Netview = GUICtrlCreateButton("NetView Users", 152, 40, 91, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $HostFile
			HostFile()
		Case $ProcessExplorer
			StartPe()
		Case $cmd
			Est()
		Case $

		Case $exit
			Exit

	EndSwitch
WEnd

//Idea is to automate tasks that require searching for the others in one simple GUI, the code is ugly

StartPe()
Func StartPe()
	Run ("c:\procexp64.exe", "c:\", @SW_SHOW)
EndFunc ;==>StartPe

Est()

Func Est()
	Run("C:\WINDOWS\system32\cmd.exe")
	WinWaitActive("C:\WINDOWS\system32\cmd.exe")
	send('netstat -ano -t 5 | findstr "ESTABLISHED" ' & "{ENTER}")
EndFunc ;==>Est


HostFile()

Func HostFile()
	Run("C:\WINDOWS\system32\cmd.exe")
	WinWaitActive("C:\WINDOWS\system32\cmd.exe")
	send('type c:\WINDOWS\system32\drivers\etc\hosts' & "{ENTER}")
	sleep(5000)
	send('exit' & "{ENTER}")
EndFunc ;==>HostFile

BlockPort() //Creating a pop up that prompts for port to block and then executes users input to netsh.  It executes fine without errors but isnt saving to netsh firewall rules

BlockPort()

Func BlockPort()
	$Port = InputBox("Firewall", "Port number to block", "")
	$RuleName = InputBox("Firewall", "Rule Name", "")
	$Proto = InputBox("Firewall", "Protocol type?", "")
	$ActBlock = "action=block"
	Run(@ComSpec & "/c" & "netsh advfirewall firewall dir=in" & ($ActBlock) & "/c" & "protocol=" & ($Proto) & "c/" & "remoteport=" & ($Port) & "c/"  )
EndFunc ;==>BlockPort

Func

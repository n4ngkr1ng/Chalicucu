; #FUNCTION# ====================================================================================================================
; Name ..........: MinRemainTrainAcc() - Check which account has shortest remain train time
; Description ...: This file contens the Sequence that runs all MBR Bot
; Author ........: DEMEN (made for the Switch CoC Account mod of Chalicucu)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================


Global $nTotalCOCAcc 		; Total number of COC Accounts ($nTotalCOCAcc <= 8)

Global $nActiveCoCAcc = 1
   ; Number of active CoC accounts that you set for Botting.
   ; This number is <= $nTotalCOCAcc (<=8). For examble, if you want to bot Acc No. 2, 4 & 6 among the total 8 accounts, then $nActiveCoCAcc = 3
   ; This number can be set following the Input of Acc Order.

Global $aActiveCoCAcc
   ; List of active CoC accounts.
   ; For examble Acc No. 2, 4, 6 are active among the total 8 accounts, then $aActiveCoCAcc = [2,4,6].

Global $aTimerStart[1] 				; Timer counter start as soon as the Bot read Remain Train Time of an account.
Global $aTimerEnd[1]				; To count the elapse time from the Timer starts
Global $aInitialRemainTrainTime[1]	; The remain train time of each account read at Army Overview Window
Global $aUpdateRemainTrainTime[1]	; Update the remain train time of all accounts
   ; These arrays shall be ReDim following the value of $nTotalCOCAcc

Global $aRemainTrainTime[1]			; Remain train time of Active Accounts only. This Array shall be ReDim following the value of $nActiveCoCAcc

Global $nNextCoCAcc					; The Account Number has shortest remain train time (among the active accounts)
Global $nMinRemainTrain				; The minimum remain train time in minutes


Func ResetTrainTimer() ; Run this function first and once to set the remain train timer of all Accounts. All set to 0

   $aActiveCoCAcc = StringSplit(IniRead($Profile,"switchcocacc", "order", "1"), "", $STR_NOCOUNT)
   $nActiveCoCAcc = UBound($aActiveCoCAcc)

   ReDim $aTimerStart[$nTotalCOCAcc]
   ReDim $aTimerEnd[$nTotalCOCAcc]
   ReDim $aInitialRemainTrainTime[$nTotalCOCAcc]
   ReDim $aUpdateRemainTrainTime[$nTotalCOCAcc]
   ReDim $aRemainTrainTime[$nActiveCoCAcc]

   For $i = 0 to $nTotalCOCAcc - 1
	  $aTimerStart[$i] = 0
	  $aTimerEnd[$i] = 0
	  $aInitialRemainTrainTime[$i] = 0
	  $aUpdateRemainTrainTime[$i] = 0
   Next

EndFunc



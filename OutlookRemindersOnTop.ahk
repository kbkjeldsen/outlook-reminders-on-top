; ========================================================================
; Brings Outlook reminders on top of other windows
; ------------------------------------------------------------------------
; Version:  1.0.0
; Author:   Kenneth Bernhard Kjeldsen
; Homepage: https://github.com/kbkjeldsen/outlook-reminders-on-top
; 
; Original source of the script: https://stackoverflow.com/a/35154133
; ========================================================================
; Display an info message stating that the script is active and looking for Outlook reminders
TrayTip AutoHotKey Script, Started looking for Outlook reminder windows to put on top, , 16
; Define match mode for the title in the WinWait function
SetTitleMatchMode 2 ; Match any occurence of the title pattern in the window title
; Begin an infinite loop looking for any Outlook reminder windows taht may occur
loop {
  ; Wait for a reminder window to occur
  WinWait, Reminder(s)
  ; Bring the reminder window on top
  WinSet, AlwaysOnTop, on, Reminder(s)
  ; Restore default size of the reinder window (if minimized or maximized)
  WinRestore, Reminder(s)
  ; Display a message
  TrayTip Outlook Reminder, You have an active outlook reminder, , 16
  ; Wait for the reminder window to be closed or 30 seconds before the next iteration of the loop
  WinWaitClose, Reminder(s), ,30
}
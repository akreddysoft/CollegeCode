Attribute VB_Name = "Module1"
Option Explicit

 Declare Function messagebeep Lib "user32.dll" (ByVal wtype As Long) As Long
'Declare Function messagebeep Lib "user32" (ByVal wtype As Long) As Long
Declare Function getwindowsdirectory Lib "kernel32" Alias "getwindowsdirectorya" (ByVal lpbuffer As String, ByVal nsize As Long) As Long






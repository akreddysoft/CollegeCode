VERSION 5.00
Begin VB.Form frmole 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6300
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4695
   ScaleWidth      =   6300
   StartUpPosition =   3  'Windows Default
   Begin VB.OLE OLE1 
      Class           =   "Paint.Picture"
      Height          =   3135
      Left            =   1800
      OleObjectBlob   =   "ole.frx":0000
      TabIndex        =   0
      Top             =   840
      Width           =   4095
   End
End
Attribute VB_Name = "frmole"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


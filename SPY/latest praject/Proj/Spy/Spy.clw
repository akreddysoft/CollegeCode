; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CLDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Spy.h"
LastPage=0

ClassCount=10
Class1=CSpyApp
Class2=CSpyDoc
Class3=CSpyView
Class4=CMainFrame

ResourceCount=5
Class5=CAboutDlg
Class6=Static
Class7=MySpy
Class8=MyListBox
Resource1=IDD_DIALOG2
Class9=SpyHelp
Resource2=IDD_ABOUTBOX
Resource3=IDR_MAINFRAME
Resource4=IDD_L_DIALOG
Class10=CLDlg
Resource5=IDD_DIALOG1

[CLS:CSpyApp]
Type=0
HeaderFile=Spy.h
ImplementationFile=Spy.cpp
Filter=N

[CLS:CSpyDoc]
Type=0
HeaderFile=SpyDoc.h
ImplementationFile=SpyDoc.cpp
Filter=N
LastObject=CSpyDoc

[CLS:CSpyView]
Type=0
HeaderFile=SpyView.h
ImplementationFile=SpyView.cpp
Filter=C
LastObject=CSpyView
BaseClass=CView
VirtualFilter=VWC


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=CMainFrame




[CLS:CAboutDlg]
Type=0
HeaderFile=Spy.cpp
ImplementationFile=Spy.cpp
Filter=D

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
Command9=ID_BUTTON32771
CommandCount=9

[MNU:IDR_MAINFRAME]
Type=1
Class=?
CommandCount=0

[CLS:Static]
Type=0
HeaderFile=Static.h
ImplementationFile=Static.cpp
BaseClass=CStatic
Filter=W
LastObject=ID_APP_ABOUT

[CLS:MySpy]
Type=0
HeaderFile=MySpy.h
ImplementationFile=MySpy.cpp
BaseClass=CView
Filter=C
VirtualFilter=VWC
LastObject=ID_APP_ABOUT

[CLS:MyListBox]
Type=0
HeaderFile=MyListBox.h
ImplementationFile=MyListBox.cpp
BaseClass=CListBox
Filter=W
LastObject=ID_APP_ABOUT

[DLG:IDD_DIALOG1]
Type=1
Class=SpyHelp
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDC_STATIC,static,1342177294
Control3=IDC_STATIC,static,1342177294
Control4=IDC_STATIC,static,1342177287

[CLS:SpyHelp]
Type=0
HeaderFile=SpyHelp.h
ImplementationFile=SpyHelp.cpp
BaseClass=CDialog
Filter=D
LastObject=ID_APP_ABOUT

[DLG:IDD_DIALOG2]
Type=1
Class=?
ControlCount=2
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816

[DLG:IDD_ABOUTBOX]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_L_DIALOG]
Type=1
Class=CLDlg
ControlCount=11
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC1,button,1342177287
Control4=IDC_EDIT1,edit,1082196096
Control5=IDC_BUTTON1,button,1342242816
Control6=IDC_EDIT2,edit,1082196096
Control7=IDC_BUTTON3,button,1342242816
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308865
Control10=IDC_STATIC2,static,1342308352
Control11=IDC_STATIC3,static,1342308865

[CLS:CLDlg]
Type=0
HeaderFile=LDlg1.h
ImplementationFile=LDlg1.cpp
BaseClass=CDialog
Filter=D
LastObject=CLDlg


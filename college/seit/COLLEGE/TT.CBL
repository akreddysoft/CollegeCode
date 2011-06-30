       IDENTIFICATION DIVISION.
        
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT EMP ASSIGN TO DISK
       ORGANIZATION IS LINE SEQUENTIAL.
   
       DATA DIVISION.
       FILE SECTION.

       FD EMP
       LABEL RECORD IS STANDARD
       VALUE OF FILE-ID IS "EMP.DAT".

       01  STD.
           02 NAMES PIC  X(20).
           02 FILLER PIC X(4).
           02 ID1 PIC 9(4).
           02 FILLER  PIC X(4).
           02 ACC PIC 9(4).
           
            
       WORKING-STORAGE SECTION.
       77 C PIC X.
       77 ID2 PIC 9(4).
       77 AMT PIC 9(4).
       77 CC PIC 9(4).

       PROCEDURE DIVISION.
       MENU.
           OPEN EXTEND EMP.
           DISPLAY "ENTER THE EMPLOYEE ID".
           ACCEPT ID1.
           DISPLAY "ENTER THE EMPLOYEE NAME".
           ACCEPT NAMES.
           DISPLAY "ENTER EMP BALANCE".
           ACCEPT ACC.
           DISPLAY "AMOUNT TO BE WITHRAWN".
           ACCEPT AMT.
           SUBTRACT AMT FROM ACC GIVING CC.
           WRITE STD.
           CLOSE EMP.
       LOOP.
           DISPLAY "DO U WANYT TO ENTER MORE".
           ACCEPT C.
           IF C = 'Y' OR 'y' GO TO  MENU.

       LOOP1.
           DISPLAY "ENTER THE EMP ID".
           ACCEPT ID2.
       LOOP2.
           OPEN I-O EMP.
           OPEN-FILE.
           READ EMP.
           IF ID1 = ID2 GO TO LOOP4.
       LOOP3.
           GO TO OPEN-FILE.
       LOOP4.
           DISPLAY "NAME OF EMP IS".
           DISPLAY NAMES.
           DISPLAY "BAL OF EMP IS ".
           DISPLAY CC.
           CLOSE EMP.
           STOP RUN.
       

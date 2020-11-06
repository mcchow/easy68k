*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
* get a number
    LEA     MESSAGE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #2,D0
    TRAP    #15
    
    MOVE.B  D1,D7
    MOVE.B  #0,D6
NEXTDIGI    MOVE.B    (A1),D2
            CMP     #$40,D2
            BGT     TEN
            BRA     NOTTEN
TEN         ADD.W   #1,D6          
            BRA     SHIFT
NOTTEN      MOVE    D2,D1
            MOVE    #6,D0
            TRAP    #15
SHIFT       ADD     D2,D3
            SUB.B   #1,D7
            BEQ     SAVE
            ASL     #4,D3
            ADD     #1,A1
            BRA     NEXTDIGI
SAVE        LEA     MESSAGE2,A1
            MOVE.B  #14,D0
            TRAP    #15
            MOVE.B  D6,D1
            MOVE    #3,D0
            TRAP    #15

    SIMHALT             ; halt simulator

* Put variables and constants here
CR      EQU     $0D
LF      EQU     $0A
ADDSUM  DC.W    $0000
MESSAGE DC.B    'Please input:',0
MESSAGE2 DC.B    CR,LF,'SUM:',0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

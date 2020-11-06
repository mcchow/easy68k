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
    
NEXTDIGI    MOVE.B    (A1),D2
            CMP     #$40,D2
            BGT     TEN
            BRA     NOTTEN
TEN         SUB     #$37,D2           
            BRA     SHIFT
NOTTEN      SUB     #$30,D2
SHIFT       ADD     D2,D3
            SUB.B   #1,D1
            BEQ     SAVE
            ASL     #4,D3
            ADD     #1,A1
            BRA     NEXTDIGI

*save to A000
SAVE    MOVE.B  D3,$A000
        MOVE.B  D3,D1
        MOVE.L  #$A000,A1
        MOVE.L  #$6000,A2
        MOVE.L  #$8000,A3

*find the pattern
LOOP    CMP.B   (A2),D1
        BEQ     FIND
        ADD.W   #1,A2
        CMPA.L  A2,A3
        BEQ     NOTFIND
        BRA     LOOP
        
*SET CARRY IF NEED, USE IN BELOW
SETCAR  MOVE.W  #1,CARRYBIT
        BRA ENDCAR

*result
NOTFIND MOVE.L  #$6000,A2
FIND    MOVE.L  A2,A3
        MOVE.L  A2,Addr1
        ADD     #512,A3
        
SUM     MOVE.B  (A2)+,D1
        ADD.W   D1,ADDSUM
ENDCAR  BCS     SETCAR
        CMPA    A2,A3
        BNE     SUM
        
*PRINT ADDR1
        LEA     MESSAGEA,A1
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.L  Addr1,D1
        MOVE.B  #15,D0
        MOVE    #16,D2
        TRAP    #15
        
        LEA     MESSAGEAS,A1
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.W  ADDSUM,D1
        MOVE.B  #15,D0
        MOVE    #16,D2
        TRAP    #15
        
        LEA     MESSAGEC,A1
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.W  CARRYBIT,D1
        MOVE    #3,D0
        TRAP    #15
        


    SIMHALT             ; halt simulator

* Put variables and constants here
CR      EQU     $0D
LF      EQU     $0A
MESSAGE DC.B    'Please input a number',0
MESSAGEA DC.B    CR,LF,'Addr1:',0
MESSAGEC DC.B    CR,LF,'CARRYBIT:',0
MESSAGEAS DC.B    CR,LF,'ADDSUM:',0
ADDSUM  DC.W    $0000
CARRYBIT    DC.B    $00
Addr1   DC.L    $00000000
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

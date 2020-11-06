*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
START:                  ; first instruction of program

* Put program code here
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
SHIFT       ADD.L   D2,D3
            SUB.B   #1,D1
            BEQ     SAVE
            ASL.L   #4,D3
            ADD     #1,A1
            BRA     NEXTDIGI

*save to INPUT
SAVE    MOVE.L  D3,INPUT
        MOVE.L  INPUT,D2
        ANDI.L  #$80000000,D2
        BNE     NEG
        LEA     MESSAGEP,A1
        MOVE.B  #14,D0
        TRAP    #15
        BRA     EXP
NEG     LEA     MESSAGEN,A1
        MOVE.B  #14,D0
        TRAP    #15
EXP     MOVE.L  INPUT,D2
        ASL.L   #1,D2
        LSR.L   #8,D2
        LSR.L   #8,D2
        LSR.L   #8,D2
        MOVE    D2,D1
        LEA     MESSAGWEX,A1
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.B  #3,D0
        TRAP    #15
*FIND MANT
        MOVE.L  INPUT,D2
        ANDI.L  #$7FFFFFF,D2
*0 Case
        CMP.L   #0,D2
        BNE     MANT
        BRA     ANS
*NON 0 CASE         
MANT    MOVE.L  D2,D3
        ANDI    #1,D3
        BNE     ANS
        LSR.L   #1,D2
        BRA     MANT        
ANS     MOVE.L  D2,D1
        LEA     MESSAGEMA,A1
        MOVE.B  #14,D0
        TRAP    #15
        MOVE.B  #3,D0
        TRAP    #15

    SIMHALT             ; halt simulator

* Put variables and constants here
CR      EQU     $0D
LF      EQU     $0A
MESSAGE DC.B    'Please enter IEEE 32-bit floating point number in hexadecimal',0
MESSAGEN DC.B    'Sign bit: -',CR,LF,0
MESSAGEP DC.B    'Sign bit: +',CR,LF,0
MESSAGWEX   DC.B    'Exponent:',0
MESSAGEMA   DC.B    CR,LF,'Mantissa:',0
INPUT   DC.W    $0000

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

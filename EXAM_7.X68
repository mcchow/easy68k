*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    MOVE.W  #$0A,D4
    MOVE.L   #0,D5
    MOVE    #0,D1

LOOP    BTST     D1,D4
        BNE     ADDONE
        BRA     NOTADD
ADDONE    ADD   #1,D5
NOTADD    ADD   #1,D1
    CMP #32,D1
    BNE LOOP
    SIMHALT             ; halt simulator


* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

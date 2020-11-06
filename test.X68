*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

CR  EQU $0D
LF  EQU $0A
NUMA  EQU  $FF9A
NUMB  EQU  $FFA9
    ORG    $1000
      
START:                  ; first instruction of program
    LEA     MESSAGE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,d0
    TRAP    #15
    
    MOVE.W  D1,D2
    
    LEA     MESSAGE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #4,D0
    TRAP    #15
    
    MOVE.W  D1,D3
    
    ADD.W   D2,D3
    
    BVS     WRONG 
    
    MOVE.W  D3,$6000
    
    MOVE.W  $6000,D1
    
    MOVE.B  #3,D0
    TRAP    #15
     
DONE    MOVE.B #9,D0
        TRAP   #15
     
WRONG   LEA ERROR,A1
        MOVE.B  #14,D0
        TRAP    #15
        BRA DONE
    
* Put program code here

    SIMHALT             ; halt simulator
    

* Put variables and constants here


R   DS.W    1   int R;

MESSAGE DC.B    'Please input a number',0
ERROR   DC.B    'Overflow',0

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

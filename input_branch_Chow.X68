*-----------------------------------------------------------
* Title      :Hello World 2
* Written by :Martin Chow
* Date       :14/10/2020
* Description:Sample Program 1 for Quickstart Guide
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

CR      EQU     $0D
LF      EQU     $0A

* ------Code for output------ 
LOOP    LEA     MESSAGE,A1

        MOVE.B  #14,D0
        TRAP    #15

* ------Code for input------  
        MOVE.B  #4,D0
        TRAP    #15
        CMP.L   #1911237,D1
        BEQ     DONE
        
        CMP.B   #20,D1
        BLT     INVALID
        CMP.B   #25,D1
        BGT     INVALID
        
        CMP.B   #21,D1
        BNE     TWO
        LEA     DISPONE,A1
        MOVE.B  #14,D0
        TRAP    #15
        
        BRA     LOOP
        
TWO     CMP.B   #22,D1
        BNE     THREE
        LEA     DISPTWO,A1
        MOVE.B  #14,D0
        TRAP    #15
        BRA     LOOP
        
THREE   CMP.B   #23,D1           Compares D1 and 23
        BNE     FOUR            BEQ branches if D1 and 23 are not equal
        LEA     DISPTHR,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP
        
FOUR    CMP.B   #24,D1           Compares D1 and 24
        BNE     FIVE
        LEA     DISPFOU,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

FIVE    CMP.B   #25,D1           Compares D1 and 25
        BNE     ZERO        BEQ branches if D1 and 25 are not equal
        LEA     DISPFIV,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

ZERO    LEA     DISPZER,A1
        MOVE.B  #14,D0
        TRAP    #15
        BRA     LOOP
       
INVALID LEA     INV,A1
        MOVE.B  #14,D0
        TRAP    #15
        BRA     LOOP
    
DONE    MOVE.B  #9,D0
        TRAP    #15

MESSAGE DC.B    'Enter a number, Enter 1911237 to exit: ',0
INV     DC.B    'That is not between 20 and 25.',CR,LF,0
DISPONE DC.B    'vault 21 is a Vault-Tec vault that was once hidden under Las Vegas, Nevada.',CR,LF,0
DISPTWO DC.B    'I got a fortune II on my pickaxe',CR,LF,0
DISPTHR DC.B    '360 spin is the fanciest Juking in Dead by Daylight',CR,LF,0
DISPFOU DC.B    'Four means dead in my country',CR,LF,0
DISPFIV DC.B    'I love watching youtube?',CR,LF,0
DISPZER DC.B    'Dont you think I will tell you I forgot my student number when I write this program?',CR,LF,0


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

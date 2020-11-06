*-----------------------------------------------------------
* Title      :Hello World
* Written by :Martin Chow
* Date       :14/10/2020
* Description:Sample Program 1 for Quickstart Guide
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* ------Code for output------ 
    LEA     MESSAGE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.B  #9,D0
    TRAP    #15
    
CR      EQU     $0D
LF      EQU     $0A
MESSAGE DC.B    'Hello, My name is Martin.',CR,LF Place ASCII string in memory at MESSAGE
        DC.B    'This program took 1 minutes to finish, and I enjoy the 68K programming.',CR,LF
        DC.B    CR,LF
        DC.B    'Thank you for listening.',CR,LF,CR,LF,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

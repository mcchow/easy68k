*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    LEA $9000, A7
    LEA $6000, A1    
    MOVE.W #%1000000000000001, (A1)+ 
    MOVE.W #%1100000000000011, (A1)+   
    MOVE.W #%1110000000000111, (A1)+   
    MOVE.W #%1111000000001111, (A1)+   
    MOVE.W #%1111100000011111, (A1)    
    LEA $6000, A1
    MOVE.B #0, D0   
LOOP1   MOVE.W (A1)+, D1      
    AND.W #$00FF, D1        
    LSR #1, D1             
    MOVE.W D1, -(SP)   
    ADDQ.B #1,D0                    
    CMP.B #5, D0          
    BLT LOOP1      
    LEA $6000, A1    
    MOVE.B #0, D0  
LOOP2   MOVE.W (SP)+, (A1)+    
    ADDQ.B #1,D0      
    CMP.B #5, D0     
    BLT LOOP2     
    SIMHALT             ; halt simulator



    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

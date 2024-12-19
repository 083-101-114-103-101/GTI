MAIN       MOV     R10, #21 ; value to search e.g. 21
           ADR     R11, SEARCHDATA

LOOP       LDR     R0, [R11], #4 ; Load value at Address stored in R11 in R0 and increment Address in R11 by 4 
           SUB     R1, R0, R10 ; subract value in R10 from Value in R0 and store it in R1
           CMP     R1, #0 ; set flags on comparison of register 1 to value 0
           BEQ     ENDING ; if register 1 is equal to 0, jump to end
           CMP     R11, #0x228 ; if memory search is higher than last stored value
           BGE     NOHIT ; Branch to no hit to prevent infinite loop
           B       LOOP ;jump (unconditionally) to start of the loop

ENDING     SUB     R12, R11, #4 ;subract value in R10 from Value in R0 and store it in R1
           B       FINISH

NOHIT      MOV     R12, #0xFFFFFFFF
           B       FINISH

FINISH     END     ;halt the program

           ;Store  values for search in memory: 10, 15, 20, 22, 44, 65, 34, 33, 33, 21
SEARCHDATA DCD     10, 15, 20, 22, 44, 65, 34, 33, 33, 21
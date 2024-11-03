        MOV     R0, #10 ;set initial count down value to count down from
        MOV     R12, #0x60000000 ;set start address from where on results will be saved in memory
COMPARE 
        STR     R0, [R12] ;store value in register 1 to memory at address of value in register 12
        CMP     R0, #0 ;set flags on comparison of register 0 to value 0
        BGT     LOOP ;if register 0 isgreater than 0, jump to loop
        END     ;halt the programm

LOOP    
        SUB     R0, R0 , #1 ;subract 1 from reister1 and store in register 0
        ADD     R12, R12, #4 ;add 4 (next Word) to the value in register 12
        B       COMPARE ;jump (unconditionally) to compare

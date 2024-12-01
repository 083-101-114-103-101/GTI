       MOV     R10, #21 ; value to search e.g. 21

       ;Store  values for search in memory: 10, 15, 20, 22, 44, 65, 34, 33, 33, 21
       MOV     R12, #0x60000000 ; set memory start address
       MOV     R11, R12 ; copy the start address to keep track and for later use

       MOV     R0, #10 ; set the number 10 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #15 ; set the number 15 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #20 ; set the number 20 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #22 ; set the number 22 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #44 ; set the number 44 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #65 ; set the number 65 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #34 ; set the number 34 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #33 ; set the number 33 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #33 ; set the number 33 to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

       MOV     R0, #21 ;set the number to store
       STR     R0, [R12], #4 ; store the number in the memory and increment the address

LOOP   
       LDR     R0, [R11], #4
       SUB     R1, R0, R10 ; subract value in R10 from Value in R0 and store it in R1
       CMP     R1, #0 ; set flags on comparison of register 1 to value 0
       BEQ     ENDING ; if register 1 is equal to 0, jump to end
       CMP     R11, R12 ; if memory search if higher than last stored value
       BGE     NOHIT ; Branch to no hot to prevent infinite loop
       B       LOOP ;jump (unconditionally) to start of the loop

ENDING 
       SUB     R12, R11, #4 ;subract value in R10 from Value in R0 and store it in R1
       END     ;halt the program

NOHIT  MOV     R12, #0xFFFFFFFF
       END     ;halt the program
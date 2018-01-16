;Author: Peter Adamson
;This function counts the length of a message and returns the length in R0

STRLEN
	STMDB	sp!,{R1,R3,LR}  	;stores the link register in the stack
LOOP1	
	LDRB	R3,[R1],#1	;load the ith byte of the string into R3, then increment R1
	CMP	R3,#0
	BEQ	DONE2 		;if the byte loaded into R3 is 0, we have reached the end of the string.  Do nothing
	ADD	R0,R0,#1    	;if we are not at the end of the string, add 1 to the counter in R0
	B	LOOP1      	;loop back to check the next byte
DONE2
	LDMIA	sp!,{R1,R3,PC}       	;loads the link register into the program counter
	BX	R14

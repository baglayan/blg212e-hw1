;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		Meriç Bağlayan
;		150190056
;		BLG 212E Microprocessor Systems
;		Homework 1
;		ARM Cortex M0+ assembly code that
;			takes the complement
;			of a number.
;		Submitted on 2023-11-11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		THUMB							;instruct the assembler to interpret following code as thumb instructions
		AREA complement, CODE, READONLY ;declare new area
		
		ALIGN							;align code within appropriate boundaries
		ENTRY							;declare as entry point
num		EQU	0x12345678					;give symbolic name "num" to numeric constant
		
		EXPORT __main					;declare __main symbol to be used by linker
__main	FUNCTION						;mark the start of a function
		
		LDR R0, =num					;move the value of num into R1
		MVNS R1, R0						;move the negated contents of R0 into R1
		B	.							;infinite loop to signify program end
		
		ENDFUNC							;declare the end of function
	
										;expected values of registers after execution:
										;R0 = 0x12345678
										;R1 = 0xEDCBA987
		
		END								;declare the end of code
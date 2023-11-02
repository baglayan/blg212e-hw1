		THUMB							;instruct the assembler to interpret following code as thumb instructions
		AREA complement, CODE, READONLY ;declare new area
		ENTRY							;declare as entry point
		ALIGN							;align code within appropriate boundaries		
		
__main	FUNCTION						;mark the start of a function
		EXPORT __main					;declare __main symbol to be used by linker
		
		MOVS R0, num					;move the value of num into R1
		MVNS R1, R0						;move the negated contents of R0 into R1
		
num		EQU	0x00000008					;give symbolic name "num" to numeric constant
		
		ENDFUNC							;declare the end of function
		END								;declare the end of code
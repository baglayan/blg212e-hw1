		THUMB							;instruct the assembler to interpret following code as thumb instructions
		AREA raise_area, CODE, READONLY ;declare new area
		
		
		ALIGN							;align code within appropriate boundaries		
		ENTRY							;declare as entry point
		EXPORT __main					;declare __main symbol to be used by linker
		
__main 	FUNCTION						;declare function start
		LDR R0, =base 					;R0 holds interim (and final) result
		LDR R1, =base					;R1 holds base for the power operation
		LDR R2, =power					;R2 holds the initial and remaining power 
						
		BL raise						;linked branch to raise subroutine
		NOP								;no operation to signify program end
		ENDFUNC							;declare function end
		
raise	FUNCTION						;declare function start
		CMP R2, #0						;check if remaining power is 0
		BEQ case0						;branch to necessary subroutne if so
		
		CMP R2, #1						;check if remaining power is 1
		BEQ case1						;branch to necessary subroutine if so
		
		SUBS R2, R2, #1					;substract 1 from remaining power
		MULS R0, R1, R0					;multiply the current result with base and store it as the new current result
		B	raise						;branch to raise subroutine
		
		BX LR							;return from subroutine
		
case0	MOVS R0, #1						;set result as 1
		BX LR							;return from subroutine

case1	BX LR							;return from subroutine

		
base	EQU	0x00000002					;give symbolic name "base" to numeric constant
power	EQU	0x0000000a					;ditto, name "power"

		ENDFUNC							;declare function end
		END								;declare the end of code
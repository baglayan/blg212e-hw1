		THUMB							;instruct the assembler to interpret following code as thumb instructions
		AREA raise_area, CODE, READONLY ;declare new area
		
		
		ALIGN							;align code within appropriate boundaries		
		ENTRY							;declare as entry point
		EXPORT __main					;declare __main symbol to be used by linker

										;this code is not actually recursive. how do i make it recursive while utilizing stack?
__main 	FUNCTION						;declare function start
		PUSH {LR}						;push link register into the stack
		LDR R0, =base 					;R0 holds interim (and final) result
		LDR R1, =power					;R1 holds the initial and remaining power 
						
		BL raise						;linked branch to raise subroutine
		B	.							;infinite loop to signify program end
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;after execution:
		;expected value of R0=0x00000400 (2^10 in hex)
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		ENDFUNC							;declare function end
		
raise	FUNCTION						;declare function start
		PUSH {LR}						;push link register into stack
		CMP R1, #0						;check if remaining power is 0
		BEQ case0						;branch to necessary subroutine if so
		SUBS R1, R1, #1					;substract 1 from remaining power
		PUSH {R0}						;push 
		
		BL	raise						;branch to raise subroutine
		
		POP {R2}						;pop the stack (currently holding the base number) into R2 for multiplication
		MULS R0, R2, R0					;multiply the current result with base and store it as the new current result
		POP {PC}						;pop previously saved LR into PC
		
case0	MOVS R0, #1						;set result as 1
		POP {PC}						;pop previously saved LR into PC

		
base	EQU	0x00000002					;give symbolic name "base" to numeric constant
power	EQU	0x0000000a					;ditto, name "power"

		ENDFUNC							;declare function end
		END								;declare the end of code
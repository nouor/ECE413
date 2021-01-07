mov A, 20
mov B, 33


COLUMN0:
        SETB P1.6		// Make the last column as output pin
        CLR P1.4		// Make column 1 as output
		MOV R0,#0D		// Store niohn number
		MOV R5,#1D		// Llojmn with the next column number
	    SJMP ROWS 		// Scan the key

COLUMN2:
		SETB P1.5
        CLR P1.6
		MOV R0,#2D
		MOV R5,#0D
	    SJMP ROWS 	

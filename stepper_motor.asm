mov A, 20
mov B, 33

/*******************************************************************************************
*			INTERFACING KEYPAD
********************************************************************************************/	
// Function to get the key from 3*4 keypad
INTERFACING_KEYPAD:
/* each time only one of the column pins will be output
   and the rest will be input pins include the row pins */
   
MOV P1,#11111111B // loads P1 with all 1's
COLUMN0:
        SETB P1.6		// Make the last column as input pin
        CLR P1.4		// Make column 1 as output
		MOV R0,#0D		// Store column number
		MOV R5,#1D		// Load R5 with the next column number
	    SJMP ROWS 		// Scan the rows to get the key

COLUMN1:
		SETB P1.4
        CLR P1.5 
		MOV R0,#1D
		MOV R5,#2D
	    SJMP ROWS 
		
COLUMN2:
		SETB P1.5
        CLR P1.6
		MOV R0,#2D
		MOV R5,#0D
	    SJMP ROWS 		

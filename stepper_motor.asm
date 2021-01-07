
mov B, 33



READ_PORT0: //READP0
	JB P0.0,HALF_STEP //IF BIT =1 GO HALF STEP
/*******************************************************************************************
*					SWITCHES
********************************************************************************************/

FS_SWITCH:		// If FS_SWITCH is pressed (Full step sequence)//FS_SWITCH
	CJNE R7,#00H,AGAIN		// Check the control flag value
	// While the control flag is zero:
	ACALL DELAY
	
	MOV R1,#03H
	MOV P2,R1
	ACALL DELAY

	MOV R1,#09H
	MOV P2,R1
	ACALL DELAY
GET_FROM_KEY:		// If FS_SWITCH is not pressed:
	RRC A		// Checking the value of Port 0 to know if switch 3 is pressed or not
	JC READ_PORT0 		// Jumping to READ_PORT0 to check status of switch 1 again (as switch 3 is not pressed) NEGATIVE LOGIC
			 
	 
KEYPAD: 
	MOV R1,#0D		// Initializing the least significant byte of the angle with zero
	
	ACALL INTERFACING_KEYPAD	
			
/*******************************************************************************************
*			INTERFACING KEYPAD
********************************************************************************************/	
// Function to get the key from 3*4 keypad
INTERFACING_KEYPAD:
/* each time only one of the column pins will be output
   and the rest will be input pins include the row pins */
   
MOV P1,#11111111B               // loads P1 with all 1's
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
ROWS:
	 ROW0:
		 JB P1.0,ROW1		    // Checks whether ROW 0 is LOW (If key is pressed) and if not(P1.0 is 1) jump to ROW 1
		 MOV R2,#0D		   // Store ROW number
		 SJMP CAPTURE		  // Jump to CAPTURE to get the key value

	 ROW1:
		 JB P1.1,ROW2
		 MOV R2,#1D
		 SJMP CAPTURE

	 ROW2:
		 JB P1.2,ROW3
		 MOV R2,#2D
		 SJMP CAPTURE

	 ROW3:
		 JB P1.3,NEXT		// If ROW 3 is HIGH (If key is not pressed) Jumb to NEXT to get the next column
		 MOV R2,#3D
		 SJMP CAPTURE
	 
NEXT:		                       // Continuing to the next column (last column number is stored in R5)
	 CLM0:
		 CJNE R5,#0D,CLM1     // Jumb to Column 0 if the last column was column 2
		 SJMP COLUMN0
         CLM1:
		 CJNE R5,#1D,CLM2
		 SJMP COLUMN1
	 CLM2:
		 SJMP COLUMN2

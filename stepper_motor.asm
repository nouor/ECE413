



READ_PORT0:                              //READP0
	JB P0.0,HALF_STEP                //IF BIT =1 GO HALF STEP
/*******************************************************************************************
*					SWITCHES
********************************************************************************************/

FS_SWITCH:		                 // If FS_SWITCH is pressed (Full step sequence)//FS_SWITCH
	CJNE R7,#00H,AGAIN		 // Check the control flag value
	                                 // While the control flag is zero:
	ACALL DELAY
	
	MOV R1,#03H
	MOV P2,R1
	ACALL DELAY

	MOV R1,#09H
	MOV P2,R1
	ACALL DELAY
	
	MOV R1,#0CH
	MOV P2,R1
	ACALL DELAY
	
	MOV R1,#06H
	MOV R1,#06H
	SJMP FS_SWITCH
	
	
GET_FROM_KEY:	                 // If FS_SWITCH is not pressed
	JB P0.2,READ_PORT0		 
	 
KEYPAD:		// Rotate the stepper motor with a given angle from the keypad
	MOV R1,#0D		          // Initializing the least significant byte of the angle with zero
	MOV R2,#0D		         // Initializing the most significant byte of the angle with zero
	ACALL INTERFACING_KEYPAD	// Getting the key from keypad	
/*******************************************************************************************
*				To work on keypad
********************************************************************************************/
CHECK:
	CJNE A,#10D,FORMNUM		  // If the key value is (10 --> '*') rotate to the given angle, if not form the angle value
	
	
ANGLE0:	
	CJNE R1,#0D,ANGLE45		// if (R1 == 0 && R2 == 0) rotate to angle 0, else jumb to ANGLE45
	CJNE R2,#0H,ANGLE45
	MOV P2,#06H
	SJMP READ_PORT0
ANGLE45:
    CJNE R1,#45D,ANGLE90		// if (R1 == 45 && R2 == 0) rotate to angle 45, else jumb to ANGLE90
	CJNE R2,#0H,ANGLE90
	MOV P2,#02H
	AJMP READ_PORT0	
ANGLE90:
    CJNE R1,#90D,ANGLE135		// if (R1 == 90 && R2 == 0) rotate to angle 90, else jumb to ANGLE135
	CJNE R2,#0H,ANGLE135
	MOV P2,#03H
	AJMP READ_PORT0
			
			
			
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





/*******************************************************************************************
                                        OTHER FUNCTIONS
*******************************************************************************************/



/*
Assume the processor is clocked by a 12MHz crystal.
That means, the timer clock input will be 12MHz/12 = 1MHz
That means, the time taken for the timer to make one increment = 1/1MHz = 1uS 
2^16 = 65536 is the maximim number of counts possible for a 16 bit timer.
Let TH be the value value that has to be loaded to TH registed and TL be the value that has to be loaded to TL register.
Then, THTL =  Hexadecimal equivalent of (65536-X) where (65536-X) is considered in decimal.
*********

Let the required delay be 50000uS (ie; 50mS).
That means X = 50000
65536 – X =  65536 – 50000 = 15536.
64536 is considered in decimal and converting it t0 hexadecimal gives 3CB0
That means THTL = 3C
Therefore TH=FC and TL=B0
Program for generating 50mS delay using 8051 timer.

*/

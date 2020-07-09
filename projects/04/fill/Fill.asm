// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(KEYCHECK)
  @KBD 		
  D=M
  @BLACK
  D;JNE 		// JMP to BLACK if keyboard was pressed
  @WHITE
  D;JEQ 		// JMP to WHITE if no key was pressed

(WHITE)
  @R0
  D=A     
  @bw
  M=D   // Assign bw to 0
  @TOGGLE
  0;JMP

(BLACK)
  @R0
  D=!A    	
  @bw
  M=D   // Assign bw to -1	
  @TOGGLE
  0;JMP

(TOGGLE) 		
  @8191
  D=A     // Total pixels of memory map 
  @i 			// Toggle counter
  M=D

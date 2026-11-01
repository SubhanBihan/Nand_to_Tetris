// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Set starting position on screen
(STARTOVER)
  @SCREEN
  D=A
  @i
  M=D

(LOOP)
  // Load keyboard value into D
  @KBD
  D=M
  
  // If no key pressed, jump to relevant code section
  @NOTPRESSED
  D;JEQ

  // If here, a key has been pressed
  @i
  A=M
  M=-1
  // Jump to continuation point
  @CONT
  0;JMP

(NOTPRESSED)
  // If here, a key has not been pressed
  @i
  A=M
  M=0

(CONT)
  // Increment screen pointer
  @i
  MD=M+1

  // Finally, check if we've reached end of screen - if so, start over (outer loop).
  @KBD
  D=A-D

  @STARTOVER
  D;JEQ

  // Else continue inner loop
  @LOOP
  0;JMP
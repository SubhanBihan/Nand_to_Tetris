// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// First find min and max between R0 and R1 (to reduce addition iterations)
  // D = R1 - R0
  @R0
  D=M
  @R1
  D=M-D

  // If (D > 0), min is R0 so goto MINR0
  @MINR0
  D;JGT

  // Else min is R1
  @R1
  D=M
  // Store the min
  @min
  M=D
  // Also store the other number in max
  @R0
  D=M
  @max
  M=D
  // Jump to program continuation point
  @CONT
  0;JMP

  // Executed if min is R0
(MINR0)
  @R0
  D=M
  // Store the min
  @min
  M=D
  // Also store the other number in max
  @R1
  D=M
  @max
  M=D

  // Main multiplication procedure starts here. 
(CONT)
  // Initially set R2 to 0
  @R2
  M=0

  // If min is 0, jump to end of program
  @min
  D=M
  @END
  D;JEQ

  // Total number of loop iterations = min
(LOOP)
  // Single addition
  @max
  D=M
  @R2
  M=D+M

  // Reduce min (= no. of iterations left) by 1
  @min
  MD=M-1

  // If min isn't 0 yet, continue looping
  @LOOP
  D;JGT

(END)
  @END
  0;JMP
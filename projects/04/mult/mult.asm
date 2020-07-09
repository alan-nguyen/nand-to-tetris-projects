// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudo code
// Compute R2 += R0 for R1 times
// x = R0
// y = R1
// i = 1
// mult = R2
// IF R0 or R1 = 0
//  R2 = 0
// ELSE
//  LOOP
//   if i > y goto STOP
//   mult = mult + x
//   i = i + 1
//   goto LOOP
//  STOP:
//    R2 = mult

  @R1
  D=M
  @POSITIVE
  D; JEQ   // If R1 = 0 goto POSITIVE
  @y
  M=D   // y = R1
  @i
  M=1   // i = 1
  @R0
  D=M
  @POSITIVE
  D; JEQ   // If R0 = 0 goto POSITIVE
  @x
  M=D   // x = R0
  @mult
  M=0   // mult = 0
(LOOP)
  @i
  D=M
  @y
  D=D-M   // D[i] - D[y]
  @STOP
  D;JGT   // i > x goto STOP
  @x
  D=M
  @mult
  M=D+M   // mult = mult + x
  @i
  M=M+1   // i = i + 1
  @LOOP
  0;JMP
(POSITIVE)
  @R2
  M=0
(STOP)
  @mult
  D=M
  @R2
  M=D   // RAM[2] = mult
(END)
  @END
  0;JMP


// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Pseudo code
// Compute R2 = R0 + R0 for R1 times
// n = R1
// i = 1
// mul = R0
// IF R0 or R1 = 0
//  R2 = 0
// ELSE
//  LOOP
//   if i > n goto STOP
//   mul = mul + mul
//   i = i + 1
//   goto LOOP
//  STOP:
//    R2 = mul

  @R1
  D=M
  @POSITIVE
  D; JEQ   // If R1 = 0 goto POSITIVE
  @n
  M=D   // n = R1
  @i
  M=1   // i = 1
  @R0
  D=M
  @POSITIVE
  D; JEQ   // If R0 = 0 goto POSITIVE
  @mul
  M=D   // mul = R0
(LOOP)
  @i
  D=M
  @n
  D=D-M   // D[i] - D[n]
  @STOP
  D;JGT   // i > n goto STOP
  @mul
  D=M
  @mul
  M=D+M   // mul = mul + mul
  @i
  M=M+1   // i = i + 1
  @LOOP
  0;JMP
(STOP)
  @mul
  D=M
  @R2
  M=D   // RAM[2] = mul
(END)
  @END
  0;JMP


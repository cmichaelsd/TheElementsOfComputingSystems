// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

    // Initalize R2 as 0
    @R2
    M=0

    // If R0 or R1 is 0 end
    @R0
    D=M
    @END
    D;JEQ
    @R1
    D=M
    @END
    D;JEQ

    // Save R0 as count
    @R0
    D=M
    @count
    M=D

    // Save R1 as R2
    @R1
    D=M
    @R2
    M=D

  (LOOP)
    // Minus count
    @count
    M=M-1
    D=M

    // If count is 0 end
    @END
    D;JEQ

    // Add R1 to R2
    @R1
    D=M
    @R2
    M=M+D

    // Loop
    @LOOP
    0;JMP

  (END)
    @END
    0;JMP
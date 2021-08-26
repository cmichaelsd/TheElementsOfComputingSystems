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

  (BEGIN)
    // Save SCREEN address
    @SCREEN
    D=A
    // Save SCREEN address to pointer
    @pointer
    M=D
  (LOOP)
    // Save keyboard input
    @KBD
    D=M
    @WHITE
    D;JEQ
    @BLACK
    0;JMP
  (WHITE)
    // Direct to current SCREEN address
    @pointer
    A=M
    // Save current SCREEN address as 0
    M=0
    @INC
    0;JMP
  (BLACK)
    // Direct to current SCREEN address
    @pointer
    A=M
    // Save current SCREEN address as 0
    M=-1
    @INC
    0;JMP
  (INC)
    // Save current SCREEN address + 1
    @pointer
    D=M+1
    // Save current SCREEN address + 1 to pointer
    M=D
    // KBD's address = 24576
    // SCREENS initial address = 16384 (at this point +1)
    // KBD address - current SCREEN address (iterates 8191 times)
    @KBD
    D=A-D
    @BEGIN
    D;JEQ
    @LOOP
    0;JMP
    
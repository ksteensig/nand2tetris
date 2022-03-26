// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
    @0
    D=A
    @R2
    M=D

// Ensure R1 is the smallest, otherwise swap
// This will ensure fewer loops in the worst case
    @R0
    D=M
    @R1
    D=D-M

    @SWAP
    D;JLT
    @LOOP
    0;JMP

// Do the actual swapping
(SWAP)
    @R0
    D=M
    @R3
    M=D
    @R1
    D=M
    @R0
    M=D
    @R3
    D=M
    @R1
    M=D

(LOOP)
    @R1
    M=M-1
    D=M
    @END
    D;JLT

    @R0
    D=M
    @R2
    M=M+D
    @LOOP
    0;JMP
(END)
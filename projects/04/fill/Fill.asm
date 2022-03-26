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

// Width
    @512
    D=A
    @R0
    M=D
// Height
    @256
    D=A
    @R1
    M=D
  
    @5000
    D=A
    @R2
    M=D // pixels in total
    
    @R3
    M=0 // current pixel
//    @R4
//    M=0 // current row
//    @R5
//    M=0 // strides taken, with each stride being 32


(LOOP)
// calculate how many pixels left
    //@R2
    //D=M
    //@R3
    //D=M-D
// exit if all pixels have been drawn
    //@END
    //D;JEQ

    @col
    M=0

(BEGINCOL)
// iterate over columns in single memory unit
    @R3
    D=M
    @R2
    D=A-D

    @ENDCOL
    D;JEQ

    @col
    D=M

    @SCREEN
    A=A+D
    M=1

    @R3
    M=M+1

    @BEGINCOL
    0;JMP

(ENDCOL)

(END)
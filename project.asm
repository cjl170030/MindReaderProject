.data
	
	guess_int: .word 0
	
	shown_arr: .word 0, 0, 0, 0, 0, 0
	
	display_arr: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
	prompt1: .asciiz "Think of a number between 1 and 63. Six cards will be displayed. After the last one, your number will be revealed. Enter 1 to start, or 0 to exit: "
	
	prompt2: .asciiz "Is your number on this card? Enter 1 for yes, or 0 for no: "
	
	prompt3: .asciiz "The number you were thinking of was: "
	
	card1header: .asciiz "CARD ONE"
	
	card2header: .asciiz "CARD TWO"
	
	card3header: .asciiz "CARD THREE"
	
	card4header: .asciiz "CARD FOUR"
	
	card5header: .asciiz "CARD FIVE"
	
	card6header: .asciiz "CARD SIX"
	
	
	

.text
.globl MAIN

MAIN:

DISPLAY1:

DISPLAY2:

DISPLAY3:

DISPLAY4:

DISPLAY5:

DISPLAY6:

EXIT:




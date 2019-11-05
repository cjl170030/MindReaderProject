.data
	
	guess_int: .word 0
	
	card_int: .word 0
	
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

#Randomly select a card 'n' without displaying the same card twice, utilizing card_int and shown_arr
RANDOMIZE:

#Generate and store the values of card 'n' in the display_arr
GENERATE:

#Print display_arr
SHOW_CARD:

#Prompt the user to determine if their number is on card 'n'. Update guess value
UPDATE:


EXIT:






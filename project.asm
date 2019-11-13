.data
	
	guess_int: .word 0
	
	card_int: .word 2
	
	count_int: .word 0
	
	shown_index: .word 0
	
	display_index: .word 0
	
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
	lw $t0, count_int
	beq $t0, 64, CLEAR_GENERATE_DATA
	lw $t1, card_int
	and $t2, $t0, $t1
	add $a0, $t0, $zero
	bne $t2, $zero, UPDATE_DISPLAY_ARR
	addi $t0, $t0, 1
	sw $t0, count_int
	j GENERATE
	
UPDATE_DISPLAY_ARR:
	la $t0, display_arr
	lw $t1, display_index
	add $t0, $t0, $t1
	lw $t2, ($t0)
	bne $t2, 0, UPDATE_DISPLAY_INDEX
	sw $a0, ($t0)
	addi $a0, $a0, 1
	sw $a0, count_int
	j GENERATE

UPDATE_DISPLAY_INDEX:
	lw $t1, display_index
	addi $t1, $t1, 4
	sw $t1, display_index
	j UPDATE_DISPLAY_ARR

CLEAR_GENERATE_DATA:
	sw $zero, display_index
	sw $zero, count_int
	j SHOW_CARD

#Print display_arr
SHOW_CARD:

#Prompt the user to determine if their number is on card 'n'. Update guess value
UPDATE_GUESS:


EXIT:

li $a0, 10
syscall


.data
	
	guess_int: .word 0 #accumulator variable that stores the guess
	
	card_int: .word 1 #stores the card number
	
	generate_count_int: .word 0 #count variable to control generate loop
	
	shown_index: .word 0 #stores the current index of the shown array
	
	display_index: .word 0 #stores the current address offset(index) of the display array
	
	shown_arr: .word 0, 0, 0, 0, 0, 0 #stores the card numbers that have already been displayed
	
	display_arr: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #stores the values that exist on the card 'n'
	
	card_worth_arr: .word 1, 2, 4, 8, 16, 32 #stores the 'worth' of each card, 2^(card_int - 1)
	
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

#Generates the values of card 'n'
GENERATE:
	lw $t0, generate_count_int		#load generate_count_int for loop control
	beq $t0, 64, CLEAR_GENERATE_DATA	#if display_arr is filled, exit loop
	
	lw $t1, card_int			#load card_int
	sub $t1, $t1, 1				#card_int - 1
	mul $t1, $t1, 4				#address offset1
	la $t2, card_worth_arr			#load base address of card_worth_arr
	add $t2, $t1, $t2			#calculate address of 2^(card_int-1) value
	lw $t1, ($t2)				#load 2^(card_int-1) value
	
	and $t3, $t0, $t1			#generate_count_int AND 2^(card_int - 1) to determine if current value exists on current card
	add $a0, $t0, $zero			#pass generate_count_int to argument register $a0
	bne $t3, $zero, UPDATE_DISPLAY_ARR	#if result of AND operation is not zero, add generate_count_int to display_arr
	addi $t0, $t0, 1			#increment generate_count_int
	sw $t0, generate_count_int		#update generate_count_int in memory
	j GENERATE				#restart the loop

#Stores the values of card 'n' into display_arr
UPDATE_DISPLAY_ARR:
	la $t0, display_arr			#load base address of display_arr
	lw $t1, display_index			#load value of display_index
	add $t0, $t0, $t1			#add base address and address offset
	lw $t2, ($t0)				#load value at the calculated address
	bne $t2, 0, UPDATE_DISPLAY_INDEX	#if this value is not zero, increment the display index
	sw $a0, ($t0)				#store value of generate_count_int into display_arr
	addi $a0, $a0, 1			#increment generate_count_int
	sw $a0, generate_count_int		#update generate_count_int in memory
	j GENERATE				#return to GENERATE loop

#Increments display_index by 4
UPDATE_DISPLAY_INDEX:
	lw $t1, display_index			#load the current display_index
	addi $t1, $t1, 4			#increment display_index by 4
	sw $t1, display_index			#update display_index in memory
	j UPDATE_DISPLAY_ARR			#return to UPDATE_DISPLAY_ARR
	
#Sets display_index and count_int back to 0
CLEAR_GENERATE_DATA:
	sw $zero, display_index
	sw $zero, generate_count_int
	j SHOW_CARD

#Print display_arr
SHOW_CARD:

	
#Prompt the user to determine if their number is on card 'n'. Update guess value
UPDATE_GUESS:


EXIT:

li $v0, 10
syscall


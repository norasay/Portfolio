  # labwork.S
  # Written 2015-2017 by F Lundevall
  # Skeleton file for IS1200/IS1500 lab 1.
  # The macros PUSH and POP are in the public domain.
  # Please add your own code at the end of the file.

  #
  # Please keep the two macros PUSH and POP unchanged
  #

.globl delay
.globl time2string
.data
.text

.macro	PUSH reg
	addi	$sp,$sp,-4
	sw	\reg,0($sp)
.endm

.macro	POP reg
	lw	\reg,0($sp)
	addi	$sp,$sp,4
.endm
  #
  

  # Please add your own code below this line
  #
hexasc:

	andi	$a0,$a0,0xF	
	addi	$t0,$a0,0x30	

	ble	$a0,0x9,foo	# check if a0 <= 9 (decimal), if so, go to foo
	nop
	add	$t0,$a0,0x37	 

foo:
	move	$v0,$t0		
	jr	$ra		
	nop



delay:
	PUSH	$ra
 	li	$t0, 0		
 	li	$t1, 0x450000 	
 	move	$t2,$a0
 	
while:	slt	$t3,$0,$t2
	beq	$t3,$0,exit
	nop
	sub	$t2, $t2, 1		
	
for:	slt	$t4, $t0, $t1		
	beq	$t4, $0, while		
	nop
	addi	$t0, $t0, 1		
	
	j	for
	nop
	
exit:	
	POP	$ra
 	jr	$ra
 	nop


time2string:
	
	PUSH	$ra
	
	andi	$t0, $a1, 0xF000	
	srl	$t0, $t0, 12	
	
	move	$t6, $a0	
	move	$a0, $t0	
	
	jal	hexasc
	nop
	sb	$v0, 0($t6)
	
	andi	$t1, $a1, 0xF00		
	srl	$t1, $t1, 8	
	
	move	$a0, $t1	
	jal	hexasc
	nop
	sb	$v0, 1($t6)
	
	jal	hexasc
	nop
	li	$t2, 0x3a
	sb	$t2, 2($t6)
	
	andi	$t3, $a1, 0xF0		
	srl	$t3, $t3, 4	
	move	$a0, $t3	
	jal	hexasc
	nop
	sb	$v0, 3($t6)
	
	andi	$t4, $a1, 0xF		
	move	$a0, $t4	
	jal	hexasc
	nop
	sb	$v0, 4($t6)
	
	li	$t5, 0x00
	sb	$t5, 5($t6)
	
	POP	$ra
	
	jr	$ra
	nop



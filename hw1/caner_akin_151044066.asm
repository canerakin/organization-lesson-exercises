#Caner AKIN
#151044066
.data    
		# -1 is end of the arrays
	X:    .word   1, 2, 3, 4, 5, 6, 7, 8, 9, -1  	#space cluster
	No1:  .word   1, 2, -1						#set1
	No2:  .word   4, 5, -1						#set2
	No3:  .word   8, 9, -1							#set3	
	No4:  .word   4, 3, -1							#set4
	No5:  .word   7, 6, -1							#set5
	All:  .space 200								#for check taken		
	
	For_No1: .asciiz "No1 in \n"
	For_No2: .asciiz "No2 in \n"
	For_No3: .asciiz "No3 in \n"
	For_No4: .asciiz "No4 in \n"
	For_No5: .asciiz "No5 in \n"				
.text
	main:		
		li $t0,0	#X size	
		li $t1,0	#No1 size
		li $t2,0	#No2 size
		li $t3,0	#No3 size
		li $t4,0	#No4 size
		li $t5,0	#No5 size
		
		la $s0,X
		la $s1,No1
		la $s2,No2
		la $s3,No3
		la $s4,No4
		la $s5,No5
		
		
		#++++++++++FIND THE SÝZE OF ALL SET+++++++++++#
		li $t6,-1    #for check the end of arrays
		
		li $t8,0
		find_size_x:
			lw $t7 ,($s0)		
			beq $t7, $t6, next
			addi $s0, $s0, 4
			addi $t8,$t8,1
			j find_size_x
			
		next:
			addi $t0 , $t8 , 0
				
		li $t8,0
		find_size_No1:
			lw $t7 ,($s1)		
			beq $t7, $t6, next_No1
			addi $s1, $s1, 4
			addi $t8,$t8,1
			j find_size_No1
			
		next_No1:
			addi $t1 , $t8 , 0
			
		li $t8,0
		find_size_No2:
			lw $t7 ,($s2)		
			beq $t7, $t6, next_No2
			addi $s2, $s2, 4
			addi $t8,$t8,1
			j find_size_No2
			
		next_No2:
			addi $t2 , $t8 , 0
											
		li $t8,0
		find_size_No3:
			lw $t7 ,($s3)		
			beq $t7, $t6, next_No3
			addi $s3, $s3, 4
			addi $t8,$t8,1
			j find_size_No3
			
		next_No3:
			addi $t3 , $t8 , 0
			
			
		li $t8,0
		find_size_No4:
			lw $t7 ,($s4)		
			beq $t7, $t6, next_No4
			addi $s4, $s4, 4
			addi $t8,$t8,1
			j find_size_No4
			
		next_No4:
			addi $t4 , $t8 , 0							
																											
		li $t8,0
		find_size_No5:
			lw $t7 ,($s5)		
			beq $t7, $t6, next_No5
			addi $s5, $s5, 4
			addi $t8,$t8,1
			j find_size_No5
			
		next_No5:
			addi $t5 , $t8 , 0
			
		#---------FINISH THE SÝZE OF ALL SET------#	
		
							
		#+++++++++++++FIND THE BIG SET+++++++++++++#																
		j control1   #line 120
		
		big_No1:
			addi $t6 ,$t1 ,0
			j control2
		big_No2:
			addi $t6 ,$t2 ,0
			j control3
		big_No3:
			addi $t6 ,$t3 ,0
			j control4
		big_No4:
			addi $t6 ,$t4 ,0
			j control5
		big_No5:
			addi $t6 ,$t5 ,0
			j control			
		
		control1:				
		li $t6,0																													
		blt $t6,$t1,big_No1	
		control2:																									
		blt $t6,$t2,big_No2	
		control3:
		blt $t6,$t3,big_No3																																																																																				
		control4:
		blt $t6,$t4,big_No4	
		control5:
		blt $t6,$t5,big_No5	
		
		#find the big array and write the big array but check the which array
		
#*****************************check the which one is taken		
		control:	
			j which_array_No1
			
		which_No1:
			la $s7,No1
			li $t1 ,0
				li $v0, 4			
				la $a0, For_No1
				syscall			
			j which_array_Finish
		which_No2:
			la $s7,No2
			li $t2 ,0
				li $v0, 4			
				la $a0, For_No2
				syscall	
			j which_array_Finish
		which_No3:
			la $s7,No3
			li $t3 ,0
				li $v0, 4			
				la $a0, For_No3
				syscall	
			j which_array_Finish
		which_No4:
			la $s7,No4
			li $t4 ,0
				li $v0, 4			
				la $a0, For_No4
				syscall	
			j which_array_Finish
		which_No5:
			la $s7,No5
			li $t5 ,0	
				li $v0, 4			
				la $a0, For_No5
				syscall	
			j which_array_Finish			
					
				
		which_array_No1:
			beq $t6,$t1,which_No1	
		which_array_No2:																									
			beq $t6,$t2,which_No2	
		which_array_No3:
			beq $t6,$t3,which_No3																																																																																				
		which_array_No4:
			beq $t6,$t4,which_No4	
		which_array_No5:
			beq $t6,$t5,which_No5						
		which_array_Finish:		#write the big array in All 
			la $s6,All
			li $t9,0
		transfer:
			beq $t6,$t9,Is_exit
			lw $t8, ($s7)
			addi $t8, $t8 ,0
			sw	$t8, ($s6)
			addi $s6 ,$s6 ,4
			addi $s7 ,$s7 ,4
			addi $t9 ,$t9 ,1					
			j transfer	
									
		Is_exit:
			li $t8, -1
			sw	$t8, ($s6)
			beq $t6,$t0,end	#if only one set	
																																																																															
#-------------first array is find anl load---------------#																																																																																																		
	
		la $s1,No1
		la $s2,No2
		la $s3,No3
		la $s4,No4
		la $s5,No5			
		la $s6,All 			
#++++++++++++if have a second array now start++++++++++++#		
		
#firstly find same 
		j cont1   #line 					
#there have a nested loop				
		big2_No1:			
			li $t8 ,0	#be count							
				loo1_up:	#nested loop
					lw $t7, ($s1)
					addi $t7, $t7,0				
					beq $t7,-1,pluss1					
						li $t9 ,0					
						la $s6,All					
						loo1_down:	
								lw $t0, ($s6)
								addi $t0, $t0,0						
								beq $t0,-1,cost1					
								beq $t0,$t7,lets1
								addi $s6 ,$s6 ,4								
								j loo1_down
								
								lets1:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j loo1_down
					cost1:	
						beq $t9,0,plus1	       
						addi $s1 ,$s1 ,4										
						j loo1_up								          							
					
					plus1:
						addi $t8 ,$t8 ,1
						addi $s1 ,$s1 ,4											
						j loo1_up			
				pluss1:
					la $t1 ,($t8)
					j cont2
					
		big2_No2:		
			li $t8 ,0	#be count							
				loo2_up:	#nested loop
					lw $t7, ($s2)
					addi $t7, $t7,0				
						beq $t7,-1,pluss2					
						li $t9 ,0					
						la $s6,All					
						loo2_down:	
								lw $t0, ($s6)
								addi $t0, $t0,0						
								beq $t0,-1,cost2					
								beq $t0,$t7,lets2
								addi $s6 ,$s6 ,4								
								j loo2_down
								
								lets2:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j loo2_down
					cost2:	
						beq $t9,0,plus2		       
						addi $s2 ,$s2 ,4										
						j loo2_up								          							
					
					plus2:
						addi $t8 ,$t8 ,1
						addi $s2 ,$s2 ,4											
						j loo2_up			
				pluss2:
					la $t2 ,($t8)
                	j cont3
                	
		big2_No3:		
			li $t8 ,0	#be count							
				loo3_up:	#nested loop
					lw $t7, ($s3)
					addi $t7, $t7,0				
					beq $t7,-1,pluss3					
						li $t9 ,0					
						la $s6,All					
						loo3_down:	
								lw $t0, ($s6)
								addi $t0, $t0,0						
								beq $t0,-1,cost3					
								beq $t0,$t7,lets3
								addi $s6 ,$s6 ,4								
								j loo3_down
								
								lets3:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j loo3_down
					cost3:	
						beq $t9,0,plus3       
						addi $s3 ,$s3 ,4											
						j loo3_up								          							
					
					plus3:
						addi $t8 ,$t8 ,1
						addi $s3 ,$s3 ,4										
						j loo3_up			
				pluss3:
					la $t3 ,($t8)		
					j cont4
		big2_No4:			
			li $t8 ,0	#be count							
				loo4_up:	#nested loop
					lw $t7, ($s4)
					addi $t7, $t7,0				
					beq $t7,-1,pluss4					
						li $t9 ,0					
						la $s6,All					
						loo4_down:	
								lw $t0, ($s6)
								addi $t0, $t0,0						
								beq $t0,-1,cost4					
								beq $t0,$t7,lets4
								addi $s6 ,$s6 ,4								
								j loo4_down
								
								lets4:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j loo4_down
					cost4:	
						beq $t9,0,plus4	       
						addi $s4 ,$s4 ,4										
						j loo4_up								          							
					
					plus4:
						addi $t8 ,$t8 ,1
						addi $s4 ,$s4 ,4										
						j loo4_up			
				pluss4:
					la $t4 ,($t8)		
					j cont5
		big2_No5: 
			li $t8 ,0	#be count							
				loo5_up:	#nested loop
					lw $t7, ($s5)
					addi $t7, $t7,0				
					beq $t7,-1,pluss5					
						li $t9 ,0					
						la $s6,All					
						loo5_down:	
								lw $t0, ($s6)
								addi $t0, $t0,0						
								beq $t0,-1,cost5					
								beq $t0,$t7,lets5
								addi $s6 ,$s6 ,4								
								j loo5_down
								
								lets5:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j loo5_down
					cost5:	
						beq $t9,0,plus5       
						addi $s5 ,$s5 ,4										
						j loo5_up								          							
					
					plus5:
						addi $t8 ,$t8 ,1
						addi $s5 ,$s5 ,4										
						j loo5_up			
				pluss5:
					la $t5 ,($t8)								
					j cont_finish		
		 
		cont1:		
			li $t9 ,0
			bne $t9,$t1,big2_No1
		cont2:		
			li $t9 ,0
			bne $t9,$t2,big2_No2			
		cont3:
			li $t9 ,0
			bne $t9,$t3,big2_No3
		cont4:
			li $t9 ,0
			bne $t9,$t4,big2_No4			
		cont5:		
			li $t9 ,0
			bne $t9,$t5,big2_No5		
		
		cont_finish: 	#now must find the next set but firstly now full array size
							
		li $t0,0	#X size			
		la $s0,X		
		li $t8,0
		find_size_x_again:
			lw $t7 ,($s0)
			addi $t7, $t7,0		
			beq $t7, -1, nexttt
			addi $s0, $s0, 4
			addi $t8,$t8,1
			j find_size_x_again
			
		nexttt:
			addi $t0 , $t8 , 0	
			j control_second_1
    
		
		big_second_No1:
			addi $t7 ,$t1 ,0
			la $s1 ,No1
			j control_second_2
		big_second_No2:
			addi $t7 ,$t2 ,0
			la $s1 ,No2
			j control_second_3
		big_second_No3:
			addi $t7 ,$t3 ,0
			la $s1 ,No3
			j control_second_4
		big_second_No4:
			addi $t7 ,$t4 ,0
			la $s1 ,No4
			j control_second_5
		big_second_No5:
			addi $t7 ,$t5 ,0
			la $s1 ,No5
			j write_second			
		
		control_second_1:				
		li $t7,0																													
		blt $t7,$t1,big_second_No1	
		control_second_2:																									
		blt $t7,$t2,big_second_No2	    
		control_second_3:
		blt $t7,$t3,big_second_No3																																																																																				
		control_second_4:
		blt $t7,$t4,big_second_No4	
		control_second_5:
		blt $t7,$t5,big_second_No5
		
		j control_print2_1
		
#************************************************write which one is using
		second_No1:
				li $v0, 4			
				la $a0, For_No1
				syscall	
			j write_second	
		second_No2:
				li $v0, 4			
				la $a0, For_No2
				syscall	
			j write_second	
		second_No3:
				li $v0, 4			
				la $a0, For_No3
				syscall	
			j write_second	
		second_No4:
				li $v0, 4			
				la $a0, For_No4
				syscall	
			j write_second	
		second_No5:
				li $v0, 4			
				la $a0, For_No5
				syscall	
			j write_second		

		control_print2_1:																													
		beq $t7,$t1,second_No1	
		control_print2_2:																									
		beq $t7,$t2,second_No2	    
		control_print2_3:
		beq $t7,$t3,second_No3																																																																																				
		control_print2_4:
		beq $t7,$t4,second_No4	
		control_print2_5:
		beq $t7,$t5,second_No5


		write_second:
			li $t8 ,-1
			j fill_write_up
										
				fill_write_up:	#nested loop
					
					lw $t7, ($s1)
					addi $t7, $t7,0				
					beq $t7,-1,negatif
						li $t9 ,0					
						la $s6,All					
						fill_write_down:	
								lw $t2, ($s6)
								addi $t2, $t2,0						
								beq $t2,-1,costt					
								beq $t2,$t7,letss
								addi $s6 ,$s6 ,4								
								j fill_write_down
								
								letss:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j fill_write_down
					costt:	#do operation
						beq $t9,0,pluss	       
						addi $s1 ,$s1 ,4									
						j fill_write_up								          							
					
					pluss:
						sw	$t7, ($s6)
						addi $s6 ,$s6 ,4
						sw $t8 ,($s6)	
						addi $s1 ,$s1 ,4
						addi $t6 , $t6 ,1								
						j fill_write_up
									
				negatif:	#did											
                	beq $t6,$t0,end	  #if only two set		

#------------------------End of the second set--------------------#			
						
#++++++++++++++++++++++++ If have a thirt set ++++++++++++++++++++#
		
		Temp:
		
		
			find_thirt_set1:	
				la $s1,No1
				li $t8 ,0	#be count							
					loo1_up_3:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_3					
							li $t9 ,0					
							la $s6,All					
							loo1_down_3:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_3					
									beq $t0,$t7,lets1_3
									addi $s6 ,$s6 ,4								
									j loo1_down_3
									
									lets1_3:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_3
						cost1_3:	
							beq $t9,0,plus1_3       
							addi $s1 ,$s1 ,4										
							j loo1_up_3								          							
							
						plus1_3:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_3			
					pluss1_3:
						la $t1 ,($t8)
				
			find_thirt_set2:	
				la $s1,No2
				li $t8 ,0	#be count							
					loo1_up_32:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_32					
							li $t9 ,0					
							la $s6,All					
							loo1_down_32:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_32					
									beq $t0,$t7,lets1_32
									addi $s6 ,$s6 ,4								
									j loo1_down_32
									
									lets1_32:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_32
						cost1_32:	
							beq $t9,0,plus1_32       
							addi $s1 ,$s1 ,4										
							j loo1_up_32								          							
							
						plus1_32:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_32			
					pluss1_32:
						la $t2 ,($t8)				
				
			find_thirt_set3:	
				la $s1,No3
				li $t8 ,0	#be count							
					loo1_up_33:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_33					
							li $t9 ,0					
							la $s6,All					
							loo1_down_33:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_33					
									beq $t0,$t7,lets1_33
									addi $s6 ,$s6 ,4								
									j loo1_down_33
									
									lets1_33:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_33
						cost1_33:	
							beq $t9,0,plus1_33       
							addi $s1 ,$s1 ,4										
							j loo1_up_33								          							
							
						plus1_33:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_33			
					pluss1_33:
						la $t3 ,($t8)				
				
			find_thirt_set4:	
				la $s1,No4
				li $t8 ,0	#be count							
					loo1_up_34:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_34					
							li $t9 ,0					
							la $s6,All					
							loo1_down_34:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_34					
									beq $t0,$t7,lets1_34
									addi $s6 ,$s6 ,4								
									j loo1_down_34
									
									lets1_34:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_34
						cost1_34:	
							beq $t9,0,plus1_34       
							addi $s1 ,$s1 ,4										
							j loo1_up_34								          							
							
						plus1_34:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_34			
					pluss1_34:
						la $t4 ,($t8)				
				
			find_thirt_set5:	
				la $s1,No5
				li $t8 ,0	#be count							
					loo1_up_35:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_35					
							li $t9 ,0					
							la $s6,All					
							loo1_down_35:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_35					
									beq $t0,$t7,lets1_35
									addi $s6 ,$s6 ,4								
									j loo1_down_35
									
									lets1_35:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_35
						cost1_35:	
							beq $t9,0,plus1_35       
							addi $s1 ,$s1 ,4										
							j loo1_up_35								          							
							
						plus1_35:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_35			
					pluss1_35:
						la $t5 ,($t8)
						j control_second_11				
		
		
			big_second_No11:
				addi $t7 ,$t1 ,0
				la $s1 ,No1
				j control_second_22
			big_second_No22:
				addi $t7 ,$t2 ,0
				la $s1 ,No2
				j control_second_33
			big_second_No33:
				addi $t7 ,$t3 ,0
				la $s1 ,No3
				j control_second_44
			big_second_No44:
				addi $t7 ,$t4 ,0
				la $s1 ,No4
				j control_second_55
			big_second_No55:
				addi $t7 ,$t5 ,0
				la $s1 ,No5
				j write_second55			
			
			control_second_11:				
			li $t7,0																													
			blt $t7,$t1,big_second_No11	
			control_second_22:																									
			blt $t7,$t2,big_second_No22	    
			control_second_33:
			blt $t7,$t3,big_second_No33																																																																																				
			control_second_44:
			blt $t7,$t4,big_second_No44	
			control_second_55:
			blt $t7,$t5,big_second_No55				
	
								
			write_second55:	
				j control_print2_13
#************************************************write which one is	find and load		

		second_No13:
				li $v0, 4			
				la $a0, For_No1
				syscall	
			j write_second3	
		second_No23:
				li $v0, 4			
				la $a0, For_No2
				syscall	
			j write_second3	
		second_No33:
				li $v0, 4			
				la $a0, For_No3
				syscall	
			j write_second3	
		second_No43:
				li $v0, 4			
				la $a0, For_No4
				syscall	
			j write_second3	
		second_No53:
				li $v0, 4			
				la $a0, For_No5
				syscall	
			j write_second3		

		control_print2_13:																													
		beq $t7,$t1,second_No13	
		control_print2_23:																									
		beq $t7,$t2,second_No23	    
		control_print2_33:
		beq $t7,$t3,second_No33																																																																																			
		control_print2_43:
		beq $t7,$t4,second_No43	
		control_print2_53:
		beq $t7,$t5,second_No53

		write_second3:						
												
			li $t0,0	#X size			
			la $s0,X		
			li $t8,0
			find_size_x_again3:
				lw $t7 ,($s0)
				addi $t7, $t7,0		
				beq $t7, -1, nexttt3
				addi $s0, $s0, 4
				addi $t8,$t8,1
				j find_size_x_again3
				
			nexttt3:
				addi $t0 , $t8 , 0	
		
			li $t8 ,-1
			j fill_write_up3
										
				fill_write_up3:	#nested loop
					
					lw $t7, ($s1)
					addi $t7, $t7,0				
					beq $t7,-1,negatif3
						li $t9 ,0					
						la $s6,All					
						fill_write_down3:	
								lw $t2, ($s6)
								addi $t2, $t2,0						
								beq $t2,-1,costt3					
								beq $t2,$t7,letss3
								addi $s6 ,$s6 ,4								
								j fill_write_down3
								
								letss3:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j fill_write_down3
					costt3:	#do operation
						beq $t9,0,pluss33	       
						addi $s1 ,$s1 ,4									
						j fill_write_up3								          							
					
					pluss33:
						sw	$t7, ($s6)
						addi $s6 ,$s6 ,4
						sw $t8 ,($s6)	
						addi $s1 ,$s1 ,4
						addi $t6 , $t6 ,1								
						j fill_write_up3
									
				negatif3:	#did
                	beq $t6,$t0,end	#if only two set	
					j Iter				
						
		Iter:	
		
#------------------------End of the second set--------------------#			
						
#++++++++++++++++++++++++ If have a fourth set ++++++++++++++++++++#		
		
		
			find_thirt_set14:	
				la $s1,No1
				li $t8 ,0	#be count							
					loo1_up_344:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_3444					
							li $t9 ,0					
							la $s6,All					
							loo1_down_344:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_3444					
									beq $t0,$t7,lets1_344
									addi $s6 ,$s6 ,4								
									j loo1_down_344
									
									lets1_344:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_344
						cost1_3444:	
							beq $t9,0,plus1_344       
							addi $s1 ,$s1 ,4										
							j loo1_up_344								          							
							
						plus1_344:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_34			
					pluss1_3444:
						la $t1 ,($t8)
				
			find_thirt_set2444:	
				la $s1,No2
				li $t8 ,0	#be count							
					loo1_up_32444:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_32444					
							li $t9 ,0					
							la $s6,All					
							loo1_down_3244:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_3244					
									beq $t0,$t7,lets1_3244
									addi $s6 ,$s6 ,4								
									j loo1_down_3244
									
									lets1_3244:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_3244
						cost1_3244:	
							beq $t9,0,plus1_3244      
							addi $s1 ,$s1 ,4										
							j loo1_up_32444								          							
							
						plus1_3244:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_32444			
					pluss1_32444:
						la $t2 ,($t8)				
				
			find_thirt_set3444:	
				la $s1,No3
				li $t8 ,0	#be count							
					loo1_up_33444:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_33444					
							li $t9 ,0					
							la $s6,All					
							loo1_down_33444:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_33444					
									beq $t0,$t7,lets1_33444
									addi $s6 ,$s6 ,4								
									j loo1_down_33444
									
									lets1_33444:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_33444
						cost1_33444:	
							beq $t9,0,plus1_33444      
							addi $s1 ,$s1 ,4										
							j loo1_up_33444								          							
							
						plus1_33444:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_33444			
					pluss1_33444:
						la $t3 ,($t8)				
				
			find_thirt_set4444:	
				la $s1,No4
				li $t8 ,0	#be count							
					loo1_up_34444:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_34444					
							li $t9 ,0					
							la $s6,All					
							loo1_down_34444:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_34444					
									beq $t0,$t7,lets1_34444
									addi $s6 ,$s6 ,4								
									j loo1_down_34444
									
									lets1_34444:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_34444
						cost1_34444:	
							beq $t9,0,plus1_34444       
							addi $s1 ,$s1 ,4										
							j loo1_up_34444								          							
							
						plus1_34444:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_34444			
					pluss1_34444:
						la $t4 ,($t8)				
				
			find_thirt_set5444:	
				la $s1,No5
				li $t8 ,0	#be count							
					loo1_up_35444:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_35444					
							li $t9 ,0					
							la $s6,All					
							loo1_down_35444:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_35444					
									beq $t0,$t7,lets1_35444
									addi $s6 ,$s6 ,4								
									j loo1_down_35444
									
									lets1_35444:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_35444
						cost1_35444:	
							beq $t9,0,plus1_35444       
							addi $s1 ,$s1 ,4										
							j loo1_up_35444								          							
							
						plus1_35444:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_35444			
					pluss1_35444:
						la $t5 ,($t8)
						j control_second_11444				
		
		
			big_second_No11444:
				addi $t7 ,$t1 ,0
				la $s1 ,No1
				j control_second_22444
			big_second_No22444:
				addi $t7 ,$t2 ,0
				la $s1 ,No2
				j control_second_33444
			big_second_No33444:
				addi $t7 ,$t3 ,0
				la $s1 ,No3
				j control_second_44444
			big_second_No44444:
				addi $t7 ,$t4 ,0
				la $s1 ,No4
				j control_second_55444
			big_second_No55444:
				addi $t7 ,$t5 ,0
				la $s1 ,No5
				j write_second55444			
			
			control_second_11444:				
			li $t7,0																													
			blt $t7,$t1,big_second_No11444	
			control_second_22444:																									
			blt $t7,$t2,big_second_No22444	    
			control_second_33444:
			blt $t7,$t3,big_second_No33444																																																																																				
			control_second_44444:
			blt $t7,$t4,big_second_No44444
			control_second_55444:
			blt $t7,$t5,big_second_No55444				
	
								
			write_second55444:	
				j control_print2_13444
#************************************************write which one is finding		

		second_No13444:
				li $v0, 4			
				la $a0, For_No1
				syscall	
			j write_second3444	
		second_No23444:
				li $v0, 4			
				la $a0, For_No2
				syscall	
			j write_second3444	
		second_No33444:
				li $v0, 4			
				la $a0, For_No3
				syscall	
			j write_second3444	
		second_No43444:
				li $v0, 4			
				la $a0, For_No4
				syscall	
			j write_second3444	
		second_No53444:
				li $v0, 4			
				la $a0, For_No5
				syscall	
			j write_second3444		

		control_print2_13444:																													
		beq $t7,$t1,second_No13444	
		control_print2_23444:																									
		beq $t7,$t2,second_No23444	    
		control_print2_33444:
		beq $t7,$t3,second_No33444																																																																																			
		control_print2_43444:
		beq $t7,$t4,second_No43444	
		control_print2_53444:
		beq $t7,$t5,second_No53444

		write_second3444:			
												
			li $t0,0	#X size			
			la $s0,X		
			li $t8,0
			find_size_x_again3444:
				lw $t7 ,($s0)
				addi $t7, $t7,0		
				beq $t7, -1, nexttt3444
				addi $s0, $s0, 4
				addi $t8,$t8,1
				j find_size_x_again3444
				
			nexttt3444:
				addi $t0 , $t8 , 0	

				
		
			li $t8 ,-1
			j fill_write_up3444
										
				fill_write_up3444:	#nested loop
					
					lw $t7, ($s1)
					addi $t7, $t7,0				
					beq $t7,-1,negatif3444
						li $t9 ,0					
						la $s6,All					
						fill_write_down3444:	
								lw $t2, ($s6)
								addi $t2, $t2,0						
								beq $t2,-1,costt3444					
								beq $t2,$t7,letss3444
								addi $s6 ,$s6 ,4								
								j fill_write_down3444
								
								letss3444:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j fill_write_down3444
					costt3444:	#do operation
						beq $t9,0,pluss33444	       
						addi $s1 ,$s1 ,4									
						j fill_write_up3444								          							
					
					pluss33444:
						sw	$t7, ($s6)
						addi $s6 ,$s6 ,4
						sw $t8 ,($s6)	
						addi $s1 ,$s1 ,4
						addi $t6 , $t6 ,1								
						j fill_write_up3444
									
				negatif3444:	#did
                	beq $t6,$t0, end	#if only two set	
					j Son_4		
				
#------------------------End of the second set--------------------#			
						
#++++++++++++++++++++++++ If have a fifth set ++++++++++++++++++++#
		
		Son_4:
			
			find_thirt_set1_son:	
				la $s1,No1
				li $t8 ,0	#be count							
					loo1_up_3_son:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_3_son					
							li $t9 ,0					
							la $s6,All					
							loo1_down_3_son:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_3_son					
									beq $t0,$t7,lets1_3_son
									addi $s6 ,$s6 ,4								
									j loo1_down_3_son
									
									lets1_3_son:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_3_son
						cost1_3_son:	
							beq $t9,0,plus1_3_son       
							addi $s1 ,$s1 ,4										
							j loo1_up_3_son								          							
							
						plus1_3_son:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_3_son			
					pluss1_3_son:
						la $t1 ,($t8)
				
			find_thirt_set2_son:	
				la $s1,No2
				li $t8 ,0	#be count							
					loo1_up_32_son:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_32_son					
							li $t9 ,0					
							la $s6,All					
							loo1_down_32_son:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_32_son					
									beq $t0,$t7,lets1_32_son
									addi $s6 ,$s6 ,4								
									j loo1_down_32_son
									
									lets1_32_son:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_32_son
						cost1_32_son:	
							beq $t9,0,plus1_32_son       
							addi $s1 ,$s1 ,4										
							j loo1_up_32_son								          							
							
						plus1_32_son:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_32_son			
					pluss1_32_son:
						la $t2 ,($t8)				
				
			find_thirt_set3_son:	
				la $s1,No3
				li $t8 ,0	#be count							
					loo1_up_33_son:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_33_son					
							li $t9 ,0					
							la $s6,All					
							loo1_down_33_son:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_33_son					
									beq $t0,$t7,lets1_33_son
									addi $s6 ,$s6 ,4								
									j loo1_down_33_son
									
									lets1_33_son:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_33_son
						cost1_33_son:	
							beq $t9,0,plus1_33_son       
							addi $s1 ,$s1 ,4										
							j loo1_up_33_son								          							
							
						plus1_33_son:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_33_son			
					pluss1_33_son:
						la $t3 ,($t8)				
				
			find_thirt_set4_son:	
				la $s1,No4
				li $t8 ,0	#be count							
					loo1_up_34_son:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_34_son					
							li $t9 ,0					
							la $s6,All					
							loo1_down_34_son:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_34_son					
									beq $t0,$t7,lets1_34_son
									addi $s6 ,$s6 ,4								
									j loo1_down_34_son
									
									lets1_34_son:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_34_son
						cost1_34_son:	
							beq $t9,0,plus1_34_son       
							addi $s1 ,$s1 ,4										
							j loo1_up_34_son								          							
							
						plus1_34_son:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_34_son			
					pluss1_34_son:
						la $t4 ,($t8)				
				
			find_thirt_set5_son:	
				la $s1,No5
				li $t8 ,0	#be count							
					loo1_up_35_son:	#nested loop
						lw $t7, ($s1)
						addi $t7, $t7,0				
						beq $t7,-1,pluss1_35_son					
							li $t9 ,0					
							la $s6,All					
							loo1_down_35_son:	
									lw $t0, ($s6)
									addi $t0, $t0,0						
									beq $t0,-1,cost1_35_son					
									beq $t0,$t7,lets1_35_son
									addi $s6 ,$s6 ,4								
									j loo1_down_35_son
									
									lets1_35_son:
										addi $t9 , $t9 ,1
										addi $s6 ,$s6 ,4								
										j loo1_down_35_son
						cost1_35_son:	
							beq $t9,0,plus1_35_son       
							addi $s1 ,$s1 ,4										
							j loo1_up_35_son								          							
							
						plus1_35_son:
							addi $t8 ,$t8 ,1
							addi $s1 ,$s1 ,4											
							j loo1_up_35_son			
					pluss1_35_son:
						la $t5 ,($t8)
						j control_second_11_son				
		
		
			big_second_No11_son:
				addi $t7 ,$t1 ,0
				la $s1 ,No1
				j control_second_22_son
			big_second_No22_son:
				addi $t7 ,$t2 ,0
				la $s1 ,No2
				j control_second_33_son
			big_second_No33_son:
				addi $t7 ,$t3 ,0
				la $s1 ,No3
				j control_second_44_son
			big_second_No44_son:
				addi $t7 ,$t4 ,0
				la $s1 ,No4
				j control_second_55_son
			big_second_No55_son:
				addi $t7 ,$t5 ,0
				la $s1 ,No5
				j write_second55_son			
			
			control_second_11_son:				
			li $t7,0																													
			blt $t7,$t1,big_second_No11_son	
			control_second_22_son:																									
			blt $t7,$t2,big_second_No22_son	    
			control_second_33_son:
			blt $t7,$t3,big_second_No33_son																																																																																				
			control_second_44_son:
			blt $t7,$t4,big_second_No44_son	
			control_second_55_son:
			blt $t7,$t5,big_second_No55_son				
	
								
			write_second55_son:	
				j control_print2_13_son
#************************************************write which one is	

		second_No13_son:
				li $v0, 4			
				la $a0, For_No1
				syscall	
			j write_second3_son	
		second_No23_son:
				li $v0, 4			
				la $a0, For_No2
				syscall	
			j write_second3_son	
		second_No33_son:
				li $v0, 4			
				la $a0, For_No3
				syscall	
			j write_second3_son	
		second_No43_son:
				li $v0, 4			
				la $a0, For_No4
				syscall	
			j write_second3_son
		second_No53_son:
				li $v0, 4			
				la $a0, For_No5
				syscall	
			j write_second3_son		

		control_print2_13_son:																													
		beq $t7,$t1,second_No13_son	
		control_print2_23_son:																									
		beq $t7,$t2,second_No23_son	    
		control_print2_33_son:
		beq $t7,$t3,second_No33_son																																																																																			
		control_print2_43_son:
		beq $t7,$t4,second_No43_son	
		control_print2_53_son:
		beq $t7,$t5,second_No53_son

		write_second3_son:

												
			li $t0,0	#X size			
			la $s0,X		
			li $t8,0
			find_size_x_again3_son:
				lw $t7 ,($s0)
				addi $t7, $t7,0		
				beq $t7, -1, nexttt3_son
				addi $s0, $s0, 4
				addi $t8,$t8,1
				j find_size_x_again3_son
				
			nexttt3_son:
				addi $t0 , $t8 , 0	
		
			li $t8 ,-1
			j fill_write_up3_son
										
				fill_write_up3_son:	#nested loop
					
					lw $t7, ($s1)
					addi $t7, $t7,0				
					beq $t7,-1,negatif3_son
						li $t9 ,0					
						la $s6,All					
						fill_write_down3_son:	
								lw $t2, ($s6)
								addi $t2, $t2,0						
								beq $t2,-1,costt3_son					
								beq $t2,$t7,letss3_son
								addi $s6 ,$s6 ,4								
								j fill_write_down3_son
								
								letss3_son:
									addi $t9 , $t9 ,1
									addi $s6 ,$s6 ,4								
									j fill_write_down3_son
					costt3_son:	#do operation
						beq $t9,0,pluss33_son	       
						addi $s1 ,$s1 ,4									
						j fill_write_up3_son								          							
					
					pluss33_son:
						sw	$t7, ($s6)
						addi $s6 ,$s6 ,4
						sw $t8 ,($s6)	
						addi $s1 ,$s1 ,4
						addi $t6 , $t6 ,1								
						j fill_write_up3_son
									
				negatif3_son:	#did	
					j exit				
		
		end:		j exit
		exit:			
		
		
	    li $v0, 10                # $v0 (10=exit)
   	    syscall                   #End program													

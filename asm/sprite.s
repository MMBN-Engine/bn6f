.include "asm/sprite.inc"

// () -> void
	thumb_func_start sprite_loadAnimationData
sprite_loadAnimationData:
	push {r4,r5,lr}
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	ldr r4, off_80026C0 // =sub_3006730+1 
	mov lr, pc
	bx r4
	pop {r4,r5,pc}
	thumb_func_end sprite_loadAnimationData

	thumb_func_start sprite_80026B6
sprite_80026B6:
	push {r4,lr}
	ldr r4, off_80026C0 // =sub_3006730+1 
	mov lr, pc
	bx r4
	pop {r4,pc}
off_80026C0: .word sub_3006730+1
	thumb_func_end sprite_80026B6

	thumb_func_start sprite_update
sprite_update:
	push {r4,r5,lr}
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	ldr r4, off_80026E0 // =sub_3006792+1 
	mov lr, pc
	bx r4
	pop {r4,r5,pc}
	thumb_func_end sprite_update

	thumb_func_start sprite_chatbox_80026D6
sprite_chatbox_80026D6:
	push {r4,lr}
	ldr r4, off_80026E0 // =sub_3006792+1 
	mov lr, pc
	bx r4
	pop {r4,pc}
off_80026E0: .word sub_3006792+1
	thumb_func_end sprite_chatbox_80026D6

// (int a1, int a2, int a3) ->
	thumb_func_start sprite_load
sprite_load:
	push {r4,r5,lr}
	ldrb r3, [r5]
	mov r4, #8
	bic r3, r4
	strb r3, [r5]
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	push {r0-r2}
	lsl r0, r1, #8
	orr r0, r2
	bl sub_8002986
	pop {r1-r3}
	tst r0, r0
	beq loc_8002708
	b loc_8002716
loc_8002708:
	ldr r4, off_8002724 // =spritePointers_8031CC4 
	ldr r4, [r4,r2]
	lsl r3, r3, #2
	ldr r0, [r4,r3]
	cmp r0, #0
	bge loc_8002716
	ldr r0, off_8002728 // =spriteWhiteDot 
loc_8002716:
	push {r1}
	bl sprite_initialize // (void *a1) -> void
	pop {r1}
	strb r1, [r5,#3]
	pop {r4,r5,pc}
	.balign 4, 0x00
off_8002724: .word spritePointers_8031CC4
off_8002728: .word spriteWhiteDot
	thumb_func_end sprite_load

// (void *a1) -> void
	thumb_local_start
sprite_initialize:
	add r0, #4
	str r0, [r5,#0x18]
	mov r0, #0
	strb r0, [r5,#3]
	strb r0, [r5]
	str r0, [r5,#0x24]
	strb r0, [r5,#4]
	strh r0, [r5,#0xa]
	strh r0, [r5,#6]
	str r0, [r5,#0x2c]
	strh r0, [r5,#0x10]
	strh r0, [r5,#0x12]
	strb r0, [r5,#0x14]
	strb r0, [r5,#5]
	str r0, [r5,#0x30]
	str r0, [r5,#0x34]
	mvn r0, r0
	str r0, [r5,#0x28]
	mov r0, #8
	strb r0, [r5,#0x15]
	mov r0, #8
	strh r0, [r5,#0x16]
	mov pc, lr
	thumb_func_end sprite_initialize

// (int a1) -> void
	thumb_func_start spriteLoadMugshot_800275A
spriteLoadMugshot_800275A:
	push {lr}
	lsl r0, r0, #2
	ldr r1, off_800276C // =mugshots_8032598 
	ldr r0, [r0,r1]
	bl sprite_initialize // (void *a1) -> void
	mov r0, #0x80
	strh r0, [r5,#0x16]
	pop {pc}
off_800276C: .word mugshots_8032598
	thumb_func_end spriteLoadMugshot_800275A

// (int a1, int a2) -> void
	thumb_func_start sub_8002770
sub_8002770:
	mov r2, #0x80
	b loc_8002776
loc_8002774:
	mov r2, #0
loc_8002776:
	push {r4-r6,lr}
	mov r6, r2
	mov r4, r1
	add r5, #0x20 
	lsl r0, r0, #2
	ldr r1, off_8002798 // =guiSprites_803271C 
	ldr r0, [r0,r1]
	cmp r0, #0
	bge loc_800278A
	mov r0, r4
loc_800278A:
	bl sprite_initialize // (void *a1) -> void
	strb r6, [r5,#3]
	mov r0, #0x80
	strh r0, [r5,#0x16]
	pop {r4-r6,pc}
	.balign 4, 0x00
off_8002798: .word guiSprites_803271C
	thumb_func_end sub_8002770

	thumb_local_start
sub_800279C:
	push {r5,lr}
	add r5, #0x20 
	lsl r0, r0, #2
	ldr r1, off_80027B0 // =mugshots_8032598 
	ldr r0, [r0,r1]
	bl sprite_initialize // (void *a1) -> void
	mov r0, #0x80
	strh r0, [r5,#0x16]
	pop {r5,pc}
off_80027B0: .word mugshots_8032598
	thumb_func_end sub_800279C

	thumb_func_start sub_80027B4
sub_80027B4:
	ldr r0, off_80027BC // =dword_200F350 
	ldr r1, dword_80027C0 // =0x1 
	str r1, [r0]
	mov pc, lr
off_80027BC: .word dword_200F350
dword_80027C0: .word 0x1
	thumb_func_end sub_80027B4

	thumb_func_start sub_80027C4
sub_80027C4:
	ldr r1, off_8002804 // =byte_20098A8 
	mov r0, #0
	strb r0, [r1,#0x1] // (byte_20098A9 - 0x20098a8)
	mov r0, #0xc
	strb r0, [r1]
	ldr r0, dword_8002808 // =0x32f 
	strh r0, [r1,#0x2] // (word_20098AA - 0x20098a8)
	mov pc, lr
	thumb_func_end sub_80027C4

	thumb_func_start sub_80027D4
sub_80027D4:
	ldr r1, off_8002804 // =byte_20098A8 
	mov r0, #4
	strb r0, [r1,#0x1] // (byte_20098A9 - 0x20098a8)
	mov r0, #0xa
	strb r0, [r1]
	ldr r0, dword_800280C // =0x2ff 
	strh r0, [r1,#0x2] // (word_20098AA - 0x20098a8)
	mov pc, lr
	thumb_func_end sub_80027D4

	thumb_func_start sub_80027E4
sub_80027E4:
	ldr r1, off_8002804 // =byte_20098A8 
	mov r0, #4
	strb r0, [r1,#0x1] // (byte_20098A9 - 0x20098a8)
	mov r0, #8
	strb r0, [r1]
	ldr r0, dword_8002810 // =0x2ff 
	strh r0, [r1,#0x2] // (word_20098AA - 0x20098a8)
	mov pc, lr
	thumb_func_end sub_80027E4

	thumb_func_start sub_80027F4
sub_80027F4:
	ldr r1, off_8002804 // =byte_20098A8 
	mov r0, #0
	strb r0, [r1,#0x1] // (byte_20098A9 - 0x20098a8)
	mov r0, #0x10
	strb r0, [r1]
	ldr r0, dword_8002810 // =0x2ff 
	strh r0, [r1,#0x2] // (word_20098AA - 0x20098a8)
	mov pc, lr
off_8002804: .word byte_20098A8
dword_8002808: .word 0x32F
dword_800280C: .word 0x2FF
dword_8002810: .word 0x2FF
	.word 0x2FF
	thumb_func_end sub_80027F4

	thumb_func_start sub_8002818
sub_8002818:
	push {lr}
	ldr r0, [r5,#0x34]
	tst r0, r0
	bne loc_800282A
	ldr r0, [r5,#0x1c]
	ldr r0, [r0,#4]
	add r0, #4
	ldr r1, [r5,#0x18]
	add r0, r0, r1
loc_800282A:
	ldrb r1, [r5,#4]
	ldrb r2, [r5,#5]
	add r1, r1, r2
	lsl r1, r1, #5
	add r0, r0, r1
	ldrb r1, [r5,#0x15]
	lsr r1, r1, #4
	ldr r3, off_8002868 // =byte_3001550 
	lsl r1, r1, #5
	add r3, r3, r1
	mov r6, #0
loc_8002840:
	ldr r2, [r0,r6]
	str r2, [r3,r6]
	add r6, #4
	cmp r6, #0x20 
	blt loc_8002840
	ldrh r7, [r5,#6]
	tst r7, r7
	beq locret_8002862
	lsl r0, r7, #0x11
	lsr r0, r0, #0x11
	lsr r2, r7, #0xf
	lsl r2, r2, #2
	mov r6, #0x20 
	mov r7, r3
	ldr r1, off_8002864 // =sub_3005EF0+1 
	mov lr, pc
	bx r1
locret_8002862:
	pop {pc}
off_8002864: .word sub_3005EF0+1
off_8002868: .word byte_3001550
	thumb_func_end sub_8002818

	thumb_func_start sub_800286C
sub_800286C:
	ldr r0, off_80028CC // =dword_200F340 
	mov r1, #0
	str r1, [r0]
	mov pc, lr
	thumb_func_end sub_800286C

	thumb_func_start sub_8002874
sub_8002874:
	push {r5,lr}
	ldr r2, [r5,#0x24]
	ldr r0, [r5,#0x1c]
	ldr r0, [r0]
	ldr r1, [r5,#0x18]
	add r0, r0, r1
	cmp r0, r2
	beq locret_8002896
	str r0, [r5,#0x24]
	ldr r2, [r0]
	add r0, #4
	ldr r1, dword_8002898 // =0x6010000 
	ldrh r3, [r5,#8]
	lsl r3, r3, #5
	add r1, r1, r3
	bl loc_8000AC8
locret_8002896:
	pop {r5,pc}
dword_8002898: .word 0x6010000
	thumb_func_end sub_8002874

	thumb_func_start sprite_handleObjSprites_800289C
sprite_handleObjSprites_800289C:
	push {lr}
	ldr r1, off_80028B4 // =dword_20093A8 
	mov r0, #0
	str r0, [r1]
	ldr r0, off_80028B8 // =dword_200A890 
	ldr r1, off_80028BC // =0x388 
	mov r2, #0
	mvn r2, r2
	bl WordFill
	pop {pc}
	.balign 4, 0x00
off_80028B4: .word dword_20093A8
off_80028B8: .word dword_200A890
off_80028BC: .word 0x388
	thumb_func_end sprite_handleObjSprites_800289C

	thumb_func_start sub_80028C0
sub_80028C0:
	ldr r1, off_80028CC // =dword_200F340 
	ldr r1, [r1]
	ldr r2, dword_80028D0 // = 
	strb r1, [r2,r0]
	mov pc, lr
	.balign 4, 0x00
off_80028CC: .word dword_200F340
dword_80028D0: .word 0x200F389
	thumb_func_end sub_80028C0

	thumb_func_start sub_80028D4
sub_80028D4:
	push {r5,lr}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	push {r0}
	// memBlock
	mov r0, r5
	// size
	mov r1, #0x50 
	bl ZeroFillByWord // (void *memBlock, int size) -> void
	pop {r0}
	str r0, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	mov r0, r5
	add r0, #4
	mov r1, #0x18
	mov r2, #0x80
	lsl r2, r2, #0x18
	mvn r2, r2
	lsr r2, r2, #0x10
	bl HalfwordFill
	mov r0, r5
	// mem
	add r0, #0x1c
	// byteCount
	mov r1, #0x30 
	// byte
	mov r2, #0xff
	bl ByteFill // (u8 *mem, int byteCount, u8 byte) -> void
	pop {r5,pc}
	thumb_func_end sub_80028D4

	thumb_func_start sub_8002906
sub_8002906:
	push {r4-r7,lr}
	mov r1, r8
	mov r2, r9
	push {r1,r2}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	ldr r1, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	ldr r4, off_8002BC0 // =spritePointers_8031CC4 
	ldr r6, dword_8002BC4 // =0x2040000 
	mov r7, r0
loc_8002918:
	ldrb r0, [r7]
	cmp r0, #0xff
	beq loc_8002972
	ldrb r3, [r7,#1]
	lsl r3, r3, #2
	ldr r2, [r4,r0]
	ldr r2, [r2,r3]
	lsl r2, r2, #1
	lsr r2, r2, #1
	mov r8, r2
	ldr r2, [r2]
	lsl r0, r0, #8
	lsr r3, r3, #2
	orr r0, r3
	lsr r2, r2, #8
	add r3, r1, r2
	cmp r3, r6
	bge loc_800297C
	mov r9, r0
	ldrb r0, [r5]
	cmp r0, #0xc
	mov r0, r9
	bge loc_800297C
	push {r7}
	ldrb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	add r1, #4
	str r1, [r5,r7]
	// dest
	sub r1, #4
	add r3, #1
	strb r3, [r5]
	push {r1,r2,r4-r6}
	// src
	mov r0, r8
	bl SWI_LZ77UnCompReadNormalWrite8bit // (void *src, void *dest) -> void
	pop {r1,r2,r4-r6}
	add r1, r1, r2
	str r1, [r5,#0x4c]
	pop {r7}
	add r7, #2
	b loc_8002918
loc_8002972:
	mov r0, #1
	pop {r1,r2}
	mov r8, r1
	mov r9, r2
	pop {r4-r7,pc}
loc_800297C:
	mov r0, #0
	pop {r1,r2}
	mov r8, r1
	mov r9, r2
	pop {r4-r7,pc}
	thumb_func_end sub_8002906

	thumb_local_start
sub_8002986:
	push {r5,lr}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	mov r2, #0
loc_800298C:
	lsl r1, r2, #1
	add r1, #4
	ldrh r1, [r5,r1]
	cmp r0, r1
	bne loc_800299E
	lsl r1, r2, #2
	add r1, #0x1c
	ldr r0, [r5,r1]
	pop {r5,pc}
loc_800299E:
	add r2, #1
	cmp r2, #0xc
	blt loc_800298C
	mov r0, #0
	pop {r5,pc}
	thumb_func_end sub_8002986

	thumb_func_start sub_80029A8
sub_80029A8:
	push {r4-r7,lr}
	mov r1, r8
	mov r2, r9
	mov r3, r12
	push {r1-r3}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	ldr r1, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	ldr r4, off_8002BC0 // =spritePointers_8031CC4 
	ldr r6, off_8002BC8 // =dword_2033000 
	mov r7, r0
loc_80029BC:
	ldrb r0, [r7]
	mov r2, #0xf0
	and r0, r2
	cmp r0, #0xf0
	beq loc_8002A4C
	cmp r0, #0
	beq loc_8002A48
	ldrb r0, [r7,#2]
	ldrb r2, [r7,#3]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x17
	add r0, r0, r2
	push {r1}
	bl sub_800F26C
	lsl r0, r0, #8
	orr r0, r1
	pop {r1}
	mov r3, r5
	add r3, #4
	mov r9, r1
	mov r2, #0
loc_80029E8:
	ldrh r1, [r3,r2]
	cmp r0, r1
	mov r1, r9
	beq loc_8002A48
	add r2, #2
	cmp r2, #0x18
	blt loc_80029E8
	mov r1, r9
	lsl r2, r0, #0x18
	lsr r2, r2, #0x16
	lsr r3, r0, #8
	ldr r3, [r4,r3]
	ldr r2, [r3,r2]
	cmp r2, #0
	bge loc_8002A48
	lsl r2, r2, #1
	lsr r2, r2, #1
	mov r8, r2
	ldr r2, [r2]
	lsr r2, r2, #8
	add r3, r1, r2
	cmp r3, r6
	bge loc_8002A58
	mov r12, r0
	ldrb r0, [r5]
	cmp r0, #0xc
	mov r0, r12
	bge loc_8002A58
	push {r7}
	ldrb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	add r1, #4
	str r1, [r5,r7]
	// dest
	sub r1, #4
	add r3, #1
	strb r3, [r5]
	push {r1,r2,r4-r6}
	// src
	mov r0, r8
	bl SWI_LZ77UnCompReadNormalWrite8bit // (void *src, void *dest) -> void
	pop {r1,r2,r4-r6}
	add r1, r1, r2
	str r1, [r5,#0x4c]
	pop {r7}
loc_8002A48:
	add r7, #4
	b loc_80029BC
loc_8002A4C:
	mov r0, #1
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
loc_8002A58:
	mov r0, #0
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
	thumb_func_end sub_80029A8

	thumb_func_start sub_8002A64
sub_8002A64:
	push {r4-r7,lr}
	lsl r0, r0, #8
	orr r0, r1
	mov r1, r8
	mov r2, r9
	mov r3, r12
	push {r1-r3}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	ldr r1, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	ldr r4, off_8002BC0 // =spritePointers_8031CC4 
	ldr r6, off_8002BC8 // =dword_2033000 
	lsl r2, r0, #0x18
	lsr r2, r2, #0x16
	lsr r3, r0, #8
	ldr r3, [r4,r3]
	ldr r2, [r3,r2]
	cmp r2, #0
	bge loc_8002AD2
	lsl r2, r2, #1
	lsr r2, r2, #1
	mov r8, r2
	ldr r2, [r2]
	lsr r2, r2, #8
	add r3, r1, r2
	cmp r3, r6
	bge loc_8002AD2
	mov r12, r0
	ldrb r0, [r5]
	cmp r0, #0xc
	mov r0, r12
	bge loc_8002AD2
	ldrb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	add r1, #4
	str r1, [r5,r7]
	// dest
	sub r1, #4
	add r3, #1
	strb r3, [r5]
	push {r1,r2}
	// src
	mov r0, r8
	bl SWI_LZ77UnCompReadNormalWrite8bit // (void *src, void *dest) -> void
	pop {r1,r2}
	add r1, r1, r2
	str r1, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	mov r0, #1
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
loc_8002AD2:
	mov r0, #0
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
	thumb_func_end sub_8002A64

	thumb_func_start sub_8002ADE
sub_8002ADE:
	push {r4-r7,lr}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	ldr r4, off_8002BC0 // =spritePointers_8031CC4 
	ldrb r3, [r5]
	cmp r3, #0
	beq locret_8002B2E
	sub r3, #1
	lsl r7, r3, #1
	add r7, #4
	ldrh r0, [r5,r7]
	lsl r2, r0, #0x18
	lsr r2, r2, #0x16
	lsr r3, r0, #8
	ldr r3, [r4,r3]
	ldr r2, [r3,r2]
	cmp r2, #0
	bge locret_8002B2E
	lsl r2, r2, #1
	lsr r2, r2, #1
	mov r8, r2
	ldr r2, [r2]
	ldr r0, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	lsr r2, r2, #8
	sub r0, r0, r2
	str r0, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	ldrb r3, [r5]
	sub r3, #1
	strb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	mov r0, #0xff
	mov r1, #0x7f
	lsl r1, r1, #8
	orr r0, r1
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	mov r0, #0
	mvn r0, r0
	str r0, [r5,r7]
locret_8002B2E:
	pop {r4-r7,pc}
	thumb_func_end sub_8002ADE

	thumb_func_start sprite_decompress
sprite_decompress:
	push {r4-r7,lr}
	lsl r0, r0, #8
	orr r0, r1
	mov r1, r8
	mov r2, r9
	mov r3, r12
	push {r1-r3}
	ldr r5, off_8002BF0 // =byte_200DCA0 
	bl sub_8002BCC
	ldr r1, [r5,#0x4c] // (dword_200DCEC - 0x200dca0)
	ldr r4, off_8002BC0 // =spritePointers_8031CC4 
	ldr r6, off_8002BC8 // =dword_2033000 
	mov r3, r5
	add r3, #4
	mov r9, r1
	mov r2, #0
loc_8002B52:
	ldrh r1, [r3,r2]
	cmp r0, r1
	mov r1, r9
	beq loc_8002BB2
	add r2, #2
	cmp r2, #0x18
	blt loc_8002B52
	mov r1, r9
	lsl r2, r0, #0x18
	lsr r2, r2, #0x16
	lsr r3, r0, #8
	ldr r3, [r4,r3]
	ldr r2, [r3,r2]
	cmp r2, #0
	bge loc_8002BB2
	lsl r2, r2, #1
	lsr r2, r2, #1
	mov r8, r2
	ldr r2, [r2]
	lsr r2, r2, #8
	add r3, r1, r2
	cmp r3, r6
	bge loc_8002BB2
	mov r12, r0
	ldrb r0, [r5]
	cmp r0, #0xc
	mov r0, r12
	bge loc_8002BB2
	ldrb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	add r1, #4
	str r1, [r5,r7]
	// dest
	sub r1, #4
	push {r1,r2}
	// src
	mov r0, r8
	bl SWI_LZ77UnCompReadNormalWrite8bit // (void *src, void *dest) -> void
	pop {r1,r2}
	mov r0, #1
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
loc_8002BB2:
	mov r0, #0
	pop {r1-r3}
	mov r8, r1
	mov r9, r2
	mov r12, r3
	pop {r4-r7,pc}
	.byte 0, 0
off_8002BC0: .word spritePointers_8031CC4
dword_8002BC4: .word 0x2040000
off_8002BC8: .word dword_2033000
	thumb_func_end sprite_decompress

	thumb_local_start
sub_8002BCC:
	push {r0-r7,lr}
	ldrb r3, [r5]
	lsl r7, r3, #1
	add r7, #4
	mov r0, #0xff
	mov r1, #0x7f
	lsl r1, r1, #8
	orr r0, r1
	strh r0, [r5,r7]
	lsl r7, r3, #2
	add r7, #0x1c
	mov r0, #0
	mvn r0, r0
	str r0, [r5,r7]
	pop {r0-r7,pc}
	thumb_func_end sub_8002BCC

	thumb_local_start
sub_8002BEA:
	push {r4-r7,lr}
	pop {r4-r7,pc}
	.byte 0, 0
off_8002BF0: .word byte_200DCA0
	.word byte_8002BF8
byte_8002BF8: .byte 0x0, 0x6, 0x55, 0x4E
aCompStr8xEnd8x: .ascii "COMP\n"
	.ascii "STR:%8x\n"
	.ascii "END:%8x\n"
	.asciz "SIZ:%X/%X\n"
	.word unk_2037800
	.word 0x2040000
	thumb_func_end sub_8002BEA

	thumb_func_start sprite_setScaleParameters
sprite_setScaleParameters:
	push {r5,lr}
	push {r0-r2}
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	b loc_8002C36
	push {r5,lr}
	push {r0-r2}
loc_8002C36:
	ldrb r0, [r5,#0x11]
	mov r1, #3
	tst r0, r1
	beq loc_8002C4E
	ldrb r3, [r5,#0x13]
	mov r1, #0x3e 
	and r3, r1
	lsr r3, r3, #1
	pop {r0-r2}
	bl sub_802FE7A
	pop {r5,pc}
loc_8002C4E:
	pop {r0-r2}
	pop {r5,pc}
	thumb_func_end sprite_setScaleParameters

	thumb_func_start sub_8002C52
sub_8002C52:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	ldrb r1, [r3,#0x11]
	mov r0, #0xc
	bic r1, r0
	mov r0, #8
	orr r1, r0
	strb r1, [r3,#0x11]
	mov pc, lr
	thumb_func_end sub_8002C52

	thumb_func_start sub_8002C68
sub_8002C68:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	ldrb r1, [r3,#0x11]
	mov r0, #0xc
	bic r1, r0
	strb r1, [r3,#0x11]
	mov pc, lr
	thumb_func_end sub_8002C68

	thumb_func_start sub_8002C7A
sub_8002C7A:
	mov r2, #4
	b sprite_setMosaicScalingParameters
sprite_setMosaicScalingParameters:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	push {r7}
	ldrb r1, [r3,#0x11]
	mov r7, #0xc
	bic r1, r7
	orr r1, r2
	strb r1, [r3,#0x11]
	pop {r7}
	mov r3, r10
	ldr r3, [r3,#oToolkit_Unk2009740_Ptr]
	ldrb r1, [r3]
	mov r2, #0xc0
	bic r1, r2
	mov r2, #0
	orr r1, r2
	strb r1, [r3]
	strb r0, [r3,#2]
	sub r0, #0x10
	neg r0, r0
	strb r0, [r3,#3]
	mov r0, #0
	strb r0, [r3]
	mov r0, #0x3f 
	strb r0, [r3,#1]
	mov pc, lr
	thumb_func_end sub_8002C7A

	thumb_local_start
sub_8002CB6:
	mov r0, #0xc
	b loc_8002CBA
loc_8002CBA:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	ldrb r1, [r3,#0x11]
	bic r1, r0
	mov r2, #4
	orr r1, r2
	strb r1, [r3,#0x11]
	mov pc, lr
	thumb_func_end sub_8002CB6

	thumb_func_start sub_8002CCE
sub_8002CCE:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	ldrb r1, [r3,#0x11]
	mov r0, #0xc
	bic r1, r0
	strb r1, [r3,#0x11]
	mov pc, lr
	thumb_func_end sub_8002CCE

	thumb_func_start sprite_getMosaicScalingParameters
sprite_getMosaicScalingParameters:
	ldrb r3, [r0,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r0
	ldrb r1, [r3,#0x11]
	mov r2, #0xc
	and r2, r1
	mov r3, r10
	ldr r3, [r3,#oToolkit_Unk2009740_Ptr]
	ldrb r0, [r3,#2]
	mov pc, lr
	thumb_func_end sprite_getMosaicScalingParameters

	thumb_local_start
sub_8002CF6:
	ldrb r3, [r0,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r0
	ldrb r1, [r3,#0x11]
	mov r0, #4
	and r0, r1
	mov pc, lr
	thumb_func_end sub_8002CF6

	thumb_local_start
sub_8002D06:
	push {r5,lr}
	ldr r3, dword_8002D10 // =loc_30061E8 
	mov lr, pc
	bx r3
	pop {r5,pc}
dword_8002D10: .word 0x30061E9
	thumb_func_end sub_8002D06

	thumb_func_start sprite_makeScalable
sprite_makeScalable:
	push {r5,lr}
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	b loc_8002D22
	thumb_func_end sprite_makeScalable

	thumb_local_start
sub_8002D20:
	push {r5,lr}
loc_8002D22:
	ldrb r0, [r5,#0x11]
	mov r1, #3
	tst r1, r0
	bne loc_8002D4E
	bl sub_802FE48
	cmp r0, #0xff
	beq loc_8002D4E
	ldrb r2, [r5,#0x11]
	mov r1, #3
	orr r2, r1
	strb r2, [r5,#0x11]
	push {r7}
	ldrb r7, [r5,#0x13]
	mov r1, #0x3e 
	bic r7, r1
	lsl r0, r0, #1
	orr r7, r0
	strb r7, [r5,#0x13]
	pop {r7}
	mov r0, #1
	pop {r5,pc}
loc_8002D4E:
	mov r0, #0
	pop {r5,pc}
	thumb_func_end sub_8002D20

	thumb_func_start sprite_makeUnscalable
sprite_makeUnscalable:
	push {r5,lr}
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r5, r5, r3
	b loc_8002D60
	push {r5,lr}
loc_8002D60:
	ldrb r0, [r5,#0x11]
	mov r1, #3
	tst r1, r0
	beq locret_8002D7E
	bic r0, r1
	strb r0, [r5,#0x11]
	ldrb r0, [r5,#0x13]
	mov r2, r0
	mov r1, #0x3e 
	and r0, r1
	lsr r0, r0, #1
	bic r2, r1
	strb r2, [r5,#0x13]
	bl sub_802FE6A
locret_8002D7E:
	pop {r5,pc}
	thumb_func_end sprite_makeUnscalable

// (int pallete) -> void
	thumb_func_start sprite_setPallete
sprite_setPallete:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	strb r0, [r3,#4]
	mov pc, lr
	thumb_func_end sprite_setPallete

	thumb_func_start sprite_getPallete
sprite_getPallete:
	ldrb r3, [r0,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r0
	ldrb r0, [r3,#4]
	mov pc, lr
	thumb_func_end sprite_getPallete

	thumb_local_start
sprite_setAnimationAlt:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	strb r0, [r3]
	mov pc, lr
	thumb_func_end sprite_setAnimationAlt

// (u8 a1) -> void
	thumb_func_start sprite_setAnimation
sprite_setAnimation:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	strb r0, [r3]
	mov pc, lr
	thumb_func_end sprite_setAnimation

	thumb_func_start sprite_forceWhitePallete
sprite_forceWhitePallete:
	mov r1, #0xf0
	b loc_8002DB4
loc_8002DB4:
	ldrb r3, [r5,#2]
	lsr r3, r3, #4
	lsl r3, r3, #4
	add r3, r3, r5
	ldrb r0, [r3,#0x15]
	mov r2, #0xf0
	bic r0, r2
	orr r0, r1
	strb r0, [r3,#0x15]
	mov pc, lr
	thumb_func_end sprite_forceWhitePallete

/*For debugging purposes, connect comment at any range!*/

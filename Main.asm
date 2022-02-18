
ExitProcess PROTO
MessageBoxA PROTO

.data
myText			db "Hello World", 0
myCaption		db "Message Box Testing", 0

.code
main PROC
	sub rsp, 28h		; reserved as Win32 parameters' shadow area
						; see: Microsoft's Win32 Calling Convention document

	mov rcx, 0
	lea rdx, myText
	lea r8, myCaption
	mov r9, 0
	call MessageBoxA	; see: Win32 MessageBox document


	mov rcx, 12345678	; the exit code
	call ExitProcess	; see: Win32 ExitProcess document
main ENDP

END
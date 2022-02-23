
ExitProcess PROTO
MessageBoxA PROTO

.data
myText			db "Hello World", 0
myCaption		db "Message Box Testing", 0

.code
main PROC
						; usual x86-64 prolog code
	push rbp			;	save caller's rbp
	mov rbp, rsp		;	set rbp to point to start of stack frame
	sub rsp, 20h		;	reserved as Win32 parameters' shadow area
						;	see: Microsoft's X64 Calling Convention document
						;	https://docs.microsoft.com/en-us/cpp/build/x64-calling-convention?view=msvc-170
	mov rcx, 0
	lea rdx, myText
	lea r8, myCaption
	mov r9, 0
	call MessageBoxA	; see: Win32 MessageBox document
						; https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messagebox

	mov rcx, 12345678	; the exit code
	call ExitProcess	; see: Win32 ExitProcess document
						; https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess

						; usual x86-64 epilog code
	mov rsp, rbp		;	restore stack pointer
	pop rbp				;	restore old (caller's) rbp
	ret
main ENDP

END
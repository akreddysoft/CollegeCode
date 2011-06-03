.486p
.model flat,stdcall
option casemap:none

.data
mgdt db 0,0,0,0,0,0

.code
findgdt:
  mov eax,offset mgdt
  sgdt [eax]              ; get GDTR contents
  movzx edx,word ptr[eax] ; store size of GDT in EDX
  mov ecx,[eax+2]         ; store address of GDT in ECX
  mov eax,offset findgdt
  mov ebx,cs:[eax]
  mov cs:[eax],eax        ; writing to code area irritates kernel
  ret
end findgdt


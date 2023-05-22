; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

section .text
    global ages

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE

    mov     ebx, 0; ebx pe post de contor (i)

loop:
 
    mov     eax, [esi + my_date.year] ;pun in eax anul din data curenta
    sub     eax, [edi + ebx * 8 + my_date.year] ;scadem anul de nastere de pe pozitia i din data curenta
    push    eax ; salvam varsta pt mai tarziu
    cmp     eax, 0
    jle     negativeyear ;cazul in care varsta e negativa
    
    ;; comparam luna din data de nastere si data curenta
    mov     eax, [esi + my_date.month]
    cmp     eax, [edi + ebx * 8 + my_date.month] 
    jl      decyear ; trb scazut 1 din varsta daca luna e mai mica

    ;; comparam ziua din data de nastere si data curenta
    mov     eax, [esi + my_date.day]
    cmp     eax, [edi + ebx * 8 + my_date.day] 
    jl      decyear ; trb scazut 1 din varsta daca ziua e mai mica
    jge     end

negativeyear:
    
    ;; canzul in care varsta e negativa, punem 0
    mov     eax, 0
    jmp     end

decyear:
    
    pop     eax ; punem inapoi in eax varsta salvata anterior pe stiva
    dec     eax
    jmp     end_nopop ; sarim, sa nu facem pop de 2 ori

end:

    pop     eax ; punem inapoi in eax varsta salvata anterior pe stiva

end_nopop:
    
    mov     dword[ecx + ebx * 4], eax ; salvam varsta in vectorul de varste
    inc     ebx ; actualizare contor
    cmp     ebx, edx
    jnz     loop ; repetam loop-ul daca nu am ajuns la len

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

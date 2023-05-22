section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; TODO: Implment rotp
    ;; FREESTYLE STARTS HERE

    mov     ebx, 0 ; contorul de la 0 (i)
    dec     ecx    ; contorul de la len - 1

loop:
    mov     eax, [esi + ebx] ; salvez caracterul de pe pozitia i din plaintext in eax
    xor     eax, [edi + ecx] ; fac xor cu caracterul corespunzator din key
    mov     byte[edx + ebx], al ; punem rezultatul pe pozitia i in ciphertext
                                ; deaorece este un byte, se afla in partea al in eax
    dec     ecx
    inc     ebx
    cmp     ecx, 0
    jge     loop ; daca contorul care a inceput de la len-1 este >= 0 repetam


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
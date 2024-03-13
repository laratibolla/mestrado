;
; Mostra efeitos da convolu��o circular e do zero padding
;
;   Nuno, Nov 2005
;


;************************************
; sem zero padding
;************************************
; img
a = fltarr(256,256)
a(210:220, 210:220) = 1

window, 0, xs=256, ys=256, title="Image"
TVSCL, a
window, 1, xs=256, ys=256, title="Filter"
window, 2, xs=256, ys=256, title="Filtered image"
for i=0, 200 do begin
    ; kernel
    b = fltarr(256,256)
    b(0:i,0:i) = 1
    wset, 1
    TVSCL, b
    ; convolution
    c = fft(fft(a)*fft(b),/INV)
    wset, 2
    TVSCL, c
    print, i
    wait, 0.1
endfor




END

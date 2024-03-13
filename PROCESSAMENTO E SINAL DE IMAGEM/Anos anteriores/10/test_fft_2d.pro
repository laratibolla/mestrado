;+
;
;   Demo de algumas propriedades da FFT 2D
;
;   Nuno C. Ferreira, Jul 2005
;-
window, 0, title="Img"
window, 1, title="log(magnitude(fft(img)))
sx = 128
sy = sx
tiny = 1e-5

; rectângulo aumenta largura
for width=2,30 do begin
    ; image with a rectangle
    img     = fltarr(sx,sy)
    height  = 5
    img(sx/2-width/2:sx/2+width/2-1, sy/2-height/2:sy/2+height/2-1) = 1
    wset, 0
    show_image, img
    wset, 1
    show_image, shift(alog(abs(fft(img)) > tiny), sx/2, sy/2)
    wait, 0.2
endfor

; rectângulo aumenta altura
for height=2,30 do begin
    ; image with a rectangle
    img     = fltarr(sx,sy)
    width   = 5
    img(sx/2-width/2:sx/2+width/2-1, sy/2-height/2:sy/2+height/2-1) = 1
    wset, 0
    show_image, img
    wset, 1
    show_image, shift(alog(abs(fft(img)) > tiny), sx/2, sy/2)
    wait, 0.2
endfor

img = get_circle(128,40,/NOALIAS)
lixo = get_circle(128,30,center=[50,50],/NOALIAS)
img = img - lixo > 0

; rectângulo roda
for angle=0, 180 do begin
    img2 = rot(img, angle, CUBIC=-0.5) ; /interp)
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2)) > tiny), sx/2, sy/2)
    wait, 0.05
endfor

window, 2, title="Phase(fft(img))"

; rectângulo desloca-se segundo xx
for delta=0, 128 do begin
    img2 = shift(img, delta, 0)
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2)) > tiny), sx/2, sy/2)
    wset, 2
    show_image, shift(atan(fft(img2), /phase), sx/2, sy/2)
endfor

; rectângulo desloca-se segundo yy
for delta=0, 128 do begin
    img2 = shift(img, 0, delta)
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2) > tiny)), sx/2, sy/2)
    wset, 2
    show_image, shift(atan(fft(img2), /phase), sx/2, sy/2)
endfor

wdelete, 2

; alisa (corta altas freqs) segundo XX
for wdth=3,11,2 do begin
    img2 = smooth(img, [wdth,0])
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2) > tiny)), sx/2, sy/2)
    wait, 2
endfor

; alisa (corta altas freqs) segundo YY
for wdth=3,21,2 do begin
    img2 = smooth(img, [0, wdth])
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2) > tiny)), sx/2, sy/2)
    wait, 2
endfor

; alisa (corta altas freqs) segundo XX e YY
for wdth=3,21,2 do begin
    img2 = smooth(img, [wdth, wdth])
    wset, 0
    show_image, img2
    wset, 1
    show_image, shift(alog(abs(fft(img2) > tiny)), sx/2, sy/2)
    wait, 2
endfor

END


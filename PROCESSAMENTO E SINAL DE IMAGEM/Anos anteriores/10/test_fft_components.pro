;
; Mostra componentes da Transformada de Fourier para uma dada imagem
;
; Nuno, Nov. 2005
;
file="C:\Program Files\Exelis\IDL82\examples\data\md1107g8a.jpg"
read_jpeg, file, img

sz= size(img)
nx = sz(1)
ny = sz(2)
fft_img = fft(img)
window, 0, xs=nx, ys=ny
tvscl, img
window, 1, xs=nx, ys=ny
tvscl, alog(shift(fft_img,125,125))


window, 2, xs=nx, ys=ny
window, 3, xs=nx, ys=ny
window, 4, xs=nx, ys=ny
fft_2 = fft_img
fft_2(*) = 0
fft_3    = fft_2
for i=0, nx-1 do begin
    for j=0, ny-1 do begin
        fft_3(*) = 0
        fft_2(i,j) = fft_img(i,j)
        fft_3(i,j) = fft_img(i,j)
        wset, 2
        tvscl, alog(abs(shift(fft_2,125,125)+1e-6))
        wset, 3
        tvscl, fft(fft_2, /INVERSE)
        wset, 4
        TVSCL, fft(fft_3, /INVERSE)
        ;wait, 0.01
    endfor
endfor


END

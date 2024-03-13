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
tvscl, alog(shift(fft_img, nx/2, ny/2))

d = dist(nx, ny)
sortd = sort(d)

window, 2, xs=nx, ys=ny
window, 3, xs=nx, ys=ny
window, 4, xs=nx, ys=ny
fft_2 = fft_img
fft_2(*) = 0
fft_3    = fft_2
for i=0L, nx*ny-1 do begin
    if i LT 20 then wait, 0.5
    x = sortd(i) MOD nx
    y = sortd(i)   / nx
    fft_3(*) = 0
    fft_2(x,y) = fft_img(x,y)
    fft_3(x,y) = fft_img(x,y)
    wset, 2
    tvscl, alog(abs(shift(fft_2, nx/2, ny/2)+1e-6))
    wset, 3
    tvscl, fft(fft_2, /INVERSE)
    wset, 4
    TVSCL, fft(fft_3, /INVERSE)
    ;wait, 0.01
endfor


END

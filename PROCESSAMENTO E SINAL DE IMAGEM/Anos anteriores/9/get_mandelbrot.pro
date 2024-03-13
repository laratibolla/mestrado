;+
;
; NAME:
;   GET_MANDELBROT
;
; PURPOSE:
;   Calculates and returns an image of the Mandelbrot Set.
;
;   Basically, it performs the calculation x(n+1) = x(n)^2 + c
;   where "c" is a complex number, "n" the iteration number and x(0)=0.
;   If x(n+1) converges to a finite number, then "c" belongs to the Mandelbrot set.
;
; CATEGORY:
;   Image creation function
;
; CALLING SEQUENCE:
;   a=get_mandelbrot()
;
; INPUTS:
;   none
;
; OPTIONAL INPUT PARAMETERS:
;
; KEYWORD PARAMETERS:
;   NITERS:     the number of iterations. Default = 50.
;   REAL:       an array of two floats   specifying the range for the real      part of "c". Default: [-2, 1]
;   IMAGINARY:  an array of two floats   specifying the range for the imaginary part of "c". Default: [-1.5, 1.5]
;   SIZE:       an array of two integers specifying the size of the output image (X and Y).   Default: [500, 500]
;   COLORSCALE: the number of the IDL colorscale to use. Default: 39.
;   POWER:      the power to use in the calculation. Default: 2.
;   SHOW:       set this to 1 if you want to see the result as it is calculated. Default: 0.
;   WAIT:       waiting time, in seconds, between iterations (used to draw the image slowly - only if keyword SHOW is set). Default: 0.
;
; OUTPUTS:
;   an image containing the Mandelbrot set.
;
; OPTIONAL OUTPUT PARAMETERS:
;
; COMMON BLOCKS:
;
; SIDE EFFECTS:
;
; RESTRICTIONS:
;
; PROCEDURE:
;
; NOTES:
;
; MODIFICATION HISTORY:
;   Nuno C. Ferreira, Aug 2008
;-
FUNCTION get_mandelbrot, niters=niters, real=range_real, imaginary=range_imag, size=dims, colorscale=colorscale, power=pow, wait=wait_, show=show
device, decomposed=0
if n_elements(colorscale) EQ 0 then colorscale=39
loadct, colorscale
if n_elements(dims)         EQ 0 then dims=[500,500]
x    = complexarr(dims[0],dims[1])
mandelb = fltarr(dims[0],dims[1])
if n_elements(niters)       EQ 0 then niters=50
if n_elements(range_real)   EQ 0 then range_real = [-2,1]
if n_elements(range_imag)   EQ 0 then range_imag = [-1.5,1.5]
if n_elements(pow) EQ 0 then pow=2
if n_elements(wait_) EQ 0 then wait_=0
if keyword_set(show)        then show=1 else show=0
tmp_real = range_real[0] + findgen(dims[0])/float(dims[0]-1)*(range_real[1]-range_real[0])
tmp_imag = range_imag[0] + findgen(dims[1])/float(dims[1]-1)*(range_imag[1]-range_imag[0])
ones_x   = fltarr(dims[0])+1
ones_y   = fltarr(dims[1])+1
c       = complex(tmp_real # ones_y, ones_x # tmp_imag)
ntimes  = 50
for i=0,niters-1 do begin
    x = x^pow + c
    mandelb += finite(x)
    if show then begin
        tvscl, mandelb
        if wait_ NE 0 then wait, wait_
    endif
endfor
return, mandelb
END

%ilk olarak dairesel �er�eveyi yapt�m ama lena512 dikd�rtgen oldu�u i�in
%tam i�ine almad� bende maskelemeyi kulland�m ve maskelemenin arka plan�n�
%beyaz olarak ayarlad�m.r=200 de �ok k���k oldu�u i�in r=240 olarak
%ayarlad�m.
clc;
clear all;
close all;

load ('lena512.mat');
frdsbyznr=lena512/255;

imageSize = size(frdsbyznr);
m = size(frdsbyznr,1);	%sat�r say�s�		
n = size(frdsbyznr,2);	%s�tun say�s�		
R = 255;			    %yar��ap    
[X,Y] = meshgrid(1:n,1:m);
ind = (X-n/2).^2+(Y-m/2).^2 > R^2;    

ci = [512/2, 512/2, 255];
[xx,yy] = ndgrid((1:imageSize(1))-ci(1),(1:imageSize(2))-ci(2));
mask = double((xx.^2 + yy.^2)<ci(2)^2);
kirpilmis = double(zeros(size(frdsbyznr)));
kirpilmis(:,:,1) = frdsbyznr(:,:,1).*mask;
kirpilmis (ind) = 1;	%arkaplan� beyaz yapmak i�in
imshow(kirpilmis);

x=512;
y=512;
yatayeksen = x / 2;
duseyeksen = y/ 2;
r = 240;  %200 yar��apta �ember biraz k���k oldu�u i�in 240 ald�m.

hold on;

teta = 0 : (2 * pi / 10000) : (2 * pi);
pline_x = r * cos(teta) + yatayeksen;
pline_y = r * sin(teta) + duseyeksen;
plot(pline_x, pline_y, 'k-', 'LineWidth', 20);  %dairesel �er�evenin rengini siyah kal�nl���n�da 20 piksel olarak ayarlad�m.

hold off;
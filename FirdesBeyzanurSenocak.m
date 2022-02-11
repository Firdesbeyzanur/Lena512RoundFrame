%ilk olarak dairesel çerçeveyi yaptým ama lena512 dikdörtgen olduðu için
%tam içine almadý bende maskelemeyi kullandým ve maskelemenin arka planýný
%beyaz olarak ayarladým.r=200 de çok küçük olduðu için r=240 olarak
%ayarladým.
clc;
clear all;
close all;

load ('lena512.mat');
frdsbyznr=lena512/255;

imageSize = size(frdsbyznr);
m = size(frdsbyznr,1);	%satýr sayýsý		
n = size(frdsbyznr,2);	%sütun sayýsý		
R = 255;			    %yarýçap    
[X,Y] = meshgrid(1:n,1:m);
ind = (X-n/2).^2+(Y-m/2).^2 > R^2;    

ci = [512/2, 512/2, 255];
[xx,yy] = ndgrid((1:imageSize(1))-ci(1),(1:imageSize(2))-ci(2));
mask = double((xx.^2 + yy.^2)<ci(2)^2);
kirpilmis = double(zeros(size(frdsbyznr)));
kirpilmis(:,:,1) = frdsbyznr(:,:,1).*mask;
kirpilmis (ind) = 1;	%arkaplaný beyaz yapmak için
imshow(kirpilmis);

x=512;
y=512;
yatayeksen = x / 2;
duseyeksen = y/ 2;
r = 240;  %200 yarýçapta çember biraz küçük olduðu için 240 aldým.

hold on;

teta = 0 : (2 * pi / 10000) : (2 * pi);
pline_x = r * cos(teta) + yatayeksen;
pline_y = r * sin(teta) + duseyeksen;
plot(pline_x, pline_y, 'k-', 'LineWidth', 20);  %dairesel çerçevenin rengini siyah kalýnlýðýnýda 20 piksel olarak ayarladým.

hold off;
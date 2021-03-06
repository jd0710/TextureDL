
%create a sythetic image with two textured region
clear all
close all



fileName ='C:\TextureDL\data\image1.jpg';

%ImageWidth and ImageHeight are in the units of number of Texels
imageWidth = 40;
imageHeight = 40;

%create texels
linetexel = createTexel(10,10,3*(pi/4),4,1,1);
linetexel2 = createTexel(10,10,0,4,1,1);
%texel = createTexel(10,10,0,5,3,256);

%repeat the texel to create row
line1 = linetexel;
for y = 1 :imageWidth
        line1 = [line1 linetexel];
end


im1 = line1;
for x = 1: imageHeight/4
    im1 = [im1;line1];
end


%create a row with linetexel1 and linetextl2
region1 = floor(imageWidth/4);
region2 = floor(3 * imageWidth/4);
row2 = linetexel;
for y = 1 : region1
  row2 = [row2 linetexel];
end

for y = region1 + 1 : region2
   row2 = [row2 linetexel];
end

for y = region2 + 1 :imageWidth
   row2 = [row2 linetexel];
end


im = row2;
for x = 1: imageHeight/2
    im = [im;row2];
end


im = [im1;im ;im1];


imwrite(im,fileName,'jpg');
imshow(im);

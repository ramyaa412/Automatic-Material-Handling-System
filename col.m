%%
clc;
clear all;
close all;
imtool close all;
imaqreset;
%%
data = camera(3);
t=imtool(data);
figure(t);
imshow(t);
%%
%histImage = histogram(uint8(data));
%plot(histImage);
meanRGB = mean(reshape(data, [], 3), 1);
meanR = meanRGB(1);
meanG = meanRGB(2);
meanB = meanRGB(3);

if (meanR>meanG) && (meanR>meanB)
    disp('Red Object Detected');
    x = 1;
elseif meanG > meanB
    disp('Green Object Detected');
    x = 2;
else
    disp('Blue Object Detected');
    x = 3;
end

%disp('1.Red  2.Green 3.Blue');
%x = input('Please enter a color to highliht:');
GS = rgb2gray(data);
imtool(GS);
diff_im = imsubtract(data(:,:,x), GS);
imtool(diff_im);

%Use a median filter to filter out noise
filt_im = medfilt2(diff_im, [3 3]);
imtool(filt_im);

% Convert the resulting grayscale image into a binary image.
bw_im = im2bw(filt_im,0.1);
imtool(bw_im);

% Remove all those pixels less than 300px
bw_im = bwareaopen(bw_im,100);
imtool(bw_im);

% Label all the connected components in the image.
bw = bwlabel(bw_im, 8);

%% Here we do the image bounding box analysis.
% We get a set of properties for each labeled region.
stats = regionprops(bw, 'BoundingBox', 'Centroid');

% Display the image
figure(1),
imshow(data)

hold on

%This is a loop to bound the color objects in a rectangular box.
for object = 1:length(stats)
    bb = stats(object).BoundingBox;
    bc = stats(object).Centroid;
    rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
    plot(bc(1),bc(2), '-m+')
    a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), '    Y: ', num2str(round(bc(2)))));
    set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
end

hold off

switch x
    case 1
        serial_com('R');
        break;
    case 2
        serial_com('G');
        break;
    case 3
        serial_com('B');
        break;
end
        


 uiwait(msgbox('EXIT'));

%Clear all variables
 clc;
 clear all;
 close all;
imtool close all;
 imaqreset;

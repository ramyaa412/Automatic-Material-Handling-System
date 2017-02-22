function Capture =camera(pause_time)
% Capture the video frames using the videoinput function
% You have to replace the resolution & your installed adaptor name.
CamHw = imaqhwinfo('winvideo',1);
VidFormat = CamHw.SupportedFormats;
disp('SupportedFormats');
disp(VidFormat);

vid = videoinput('winvideo', 1, 'YUY2_320x240');%incase of laptops 'MJPG_1280x720'
vid.FramesPerTrigger = 1;
preview(vid);
start(vid);
pause(pause_time);

% Get the snapshot of the current frame
frame = getsnapshot(vid);
    
% Stop the video aquisition.
stop(vid);

% Flush all the image data stored in the memory buffer.
flushdata(vid);
%imaqreset;

%Color model change to RGB
Capture = ycbcr2rgb(frame);%Can be commented for standard camera
imtool(Capture);

end
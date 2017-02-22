function serial_com(cval)

%Set Up serial port
disp('Setting Com Port...');
s = serial('COM24');
set(s,'BaudRate',9600);
%Open for connection Active
fopen(s);
disp('Com Port Opened');
%Transmit data serially

fprintf(s,'%c',cval);

disp('Command Sent');
disp(cval);
%Close active port and clear port ID
fclose(s);
delete(s);
clear s;
disp('Port Closed and cleared.');
end
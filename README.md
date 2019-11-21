some more advanced circuitpython stuff and also some processing stuff

hello_world (folder) contains a processing file that makes a circle with the words "hello world" inside it shrink and grow while bouncing around the screen

CP_to_processing (folder) conntains a processing file that reads the data coming in from a UART cable and makes a speedometer out of it

CP to processing.py (file) gets input from a potentiometer and sends it into the computer through a UART cable

processing_to_CP (folder) has a processing file that takes the position of the mouse and changes it into two numbers, each between 0 and 180, and sends them through the UART cable

processing to CP.py (file) takes a series of individual digits coming through the UART cable, puts the digits together into two seperate numbers, and sets the positions of two servos to those numbers

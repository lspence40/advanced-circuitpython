import board #pylint: disable-msg=import-error
from time import sleep
from analogio import AnalogIn #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error

analog_in = AnalogIn(board.A1) #prepare to read the potentiometer

def get_voltage(pin): #more preparation
    return (pin.value * 256) / 65536

uart = busio.UART(board.TX, board.RX, baudrate=9600)
#prepare to send data

while True: #repeat forever
    
    uart.write(bytes([int(get_voltage(analog_in))])) #send data
    
    #print(bytes([int(get_voltage(analog_in))]))
    #debugging
    
    sleep(.1) #do 10 times per second

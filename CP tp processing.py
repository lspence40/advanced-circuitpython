import board #pylint: disable-msg=import-error
from time import sleep
from analogio import AnalogIn #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error

analog_in = AnalogIn(board.A1)

def get_voltage(pin):
    return (pin.value * 256) / 65536

uart = busio.UART(board.TX, board.RX, baudrate=9600)

while True:
    uart.write(bytes([int(get_voltage(analog_in))]))
    print(bytes([int(get_voltage(analog_in))]))
    sleep(.5)
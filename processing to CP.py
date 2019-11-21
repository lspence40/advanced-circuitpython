import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
import pulseio #pylint: disable-msg=import-error
from adafruit_motor import servo #pylint: disable-msg=import-error
# libraries

pwm1 = pulseio.PWMOut(board.A4, duty_cycle = 2 ** 15, frequency = 50)
pwm2 = pulseio.PWMOut(board.A3, duty_cycle = 2 ** 15, frequency = 50)
servo1 = servo.Servo(pwm1)  # setup servos
servo2 = servo.Servo(pwm2)

uart = busio.UART(board.TX, board.RX, baudrate=9600)
# prepare to recieve data

pos1 = 0
pos2 = 0  # variables
posToDecode = 1

while True:  # repeat forever

    data = uart.read(1)  # get data

    if data is not None:  # only do if recieving data

        F = data.decode("utf-8")  # turn data into regular text

        if F is ",":
            posToDecode = 2

        if F is "]":
            posToDecode = 1

            servo1.angle = pos1
            servo2.angle = pos2

            pos1 = 0
            pos2 = 0  
# to be honest i'm not really sure how lines 28-50 actually work
# even though i wrote them

        if F is not "," and F is not "]":

            if posToDecode is 1:
                pos1 *= 10
                pos1 += int(F)

            if posToDecode is 2:
                pos2 *= 10
                pos2 += int(F)

        print(str(pos1) + ", " + str(pos2))  # display decoding process
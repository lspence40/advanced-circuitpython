import board #pylint: disable-msg=import-error
import busio #pylint: disable-msg=import-error
import time
import pulseio #pylint: disable-msg=import-error
from adafruit_motor import servo #pylint: disable-msg=import-error
# libraries

pwm1 = pulseio.PWMOut(board.A4, duty_cycle = 2 ** 15, frequency = 50)
pwm2 = pulseio.PWMOut(board.A3, duty_cycle = 2 ** 15, frequency = 50)
servo1 = servo.Servo(pwm1) #setup servos
servo2 = servo.Servo(pwm2)

uart = busio.UART(board.TX, board.RX, baudrate=9600)
# prepare to recieve data

pos1 = 0
pos2 = 0 #variables
posToDecode = 1

while True: #repeat forever

    data = uart.read(1) #get data

    if data is not None: #only do if recieving data

        F = data.decode("utf-8") #turn data into regular text

        if F is ",":
            posToDecode = 2

        if F is "]": #if the end of the string is reached
            posToDecode = 1
            pos1 = 0 #go back to the beginning
            pos2 = 0
            
            servo1.angle = pos1
            servo2.angle = pos2 #move the servos

        if F is not "," and F is not "]": #if it's a number

            if posToDecode is 1: #if the first number is being decoded
                
                pos1 *= 10 #put the most recently recieved digit onto the end of the number
                pos1 += int(F)
                
            else: #if it's not
                
                pos2 *= 10 #the same but with the other position
                pos2 += int(F)

        print(str(pos1) + ", " + str(pos2)) #display decoding process

import serial
ser = serial.Serial("COM5", 9600)
while True:
    print(ser.readline())
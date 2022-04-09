import sys
import os
import multiprocessing
import time
import serial
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import Qt, QObject, Signal, Slot, Property, QThread

exiting = False

list_of_ports = ["A","B"]
serial_rcv_thread = None
# ser = serial.Serial("COM5", 9600) 
serialString = ""  # Initialize the serial string

def serial_ports():
    """ Lists serial port names

        :raises EnvironmentError:
            On unsupported or unknown platforms
        :returns:
            A list of the serial ports available on the system
    """
    if sys.platform.startswith('win'):
        ports = ['COM%s' % (i + 1) for i in range(256)]
    elif sys.platform.startswith('linux') or sys.platform.startswith('cygwin'):
        # this excludes your current terminal "/dev/tty"
        ports = glob.glob('/dev/tty[A-Za-z]*')
    elif sys.platform.startswith('darwin'):
        ports = glob.glob('/dev/tty.*')
    else:
        raise EnvironmentError('Unsupported platform')

    result = []
    for port in ports:
        try:
            s = serial.Serial(port, baudrate = 115200, timeout = 0)
            s.close()
            result.append(port)
        except (OSError, serial.SerialException):
            pass
    return result

list_of_ports = serial_ports()
print(list_of_ports)
class serial_receive_thread(QThread):
    
    def __init__(self, ui, parent = None):
        QThread.__init__(self, parent)
        self.ui = ui
        exiting = False
        

    def run(self):
        global serialString
        self.ui.udpate_list_of_serial_ports(list_of_ports)
        while True:
            if(ser.in_waiting > 0):
                # Read data out of the buffer until a carraige return / new line is found
                serialString = ser.readline()
                serialString = serialString.decode('Ascii')
                # print(serialString)
                self.process_serial_string()

    def process_serial_string(self):
        global serialString
        # print("Processing serial string: " + serialString)
        if(serialString == "Relay: 22 ON\r\n"):
            print("calling relay 22 on")
            self.ui.relay_22_on()
        elif(serialString == "Relay: 22 OFF\r\n"):
            self.ui.relay_22_off()
        elif(serialString == "Relay: 23 ON\r\n"):
            self.ui.relay_23_on()
        elif(serialString == "Relay: 23 OFF\r\n"):
            self.ui.relay_23_off()
        elif(serialString == "Relay: 24 ON\r\n"):
            self.ui.relay_24_on()
        elif(serialString == "Relay: 24 OFF\r\n"):
            self.ui.relay_24_off()
        elif(serialString == "Relay: 25 ON\r\n"):
            self.ui.relay_25_on()
        elif(serialString == "Relay: 25 OFF\r\n"):
            self.ui.relay_25_off()
        elif(serialString == "Relay: 26 ON\r\n"):
            self.ui.relay_26_on()
        elif(serialString == "Relay: 26 OFF\r\n"):
            self.ui.relay_26_off()
        elif(serialString == "Relay: 27 ON\r\n"):
            self.ui.relay_27_on()
        elif(serialString == "Relay: 27 OFF\r\n"):
            self.ui.relay_27_off()
        elif(serialString == "Relay: 28 ON\r\n"):
            self.ui.relay_28_on()
        elif(serialString == "Relay: 28 OFF\r\n"):
            self.ui.relay_28_off()
        elif(serialString == "Relay: 29 ON\r\n"):
            self.ui.relay_29_on()
        elif(serialString == "Relay: 29 OFF\r\n"):
            self.ui.relay_29_off()
        elif(serialString == "Relay: 30 ON\r\n"):
            self.ui.relay_30_on()
        elif(serialString == "Relay: 30 OFF\r\n"):
            self.ui.relay_30_off()
        elif(serialString == "Relay: 31 ON\r\n"):
            self.ui.relay_31_on()
        elif(serialString == "Relay: 31 OFF\r\n"):
            self.ui.relay_31_off()
        elif(serialString == "Relay: 32 ON\r\n"):
            self.ui.relay_32_on()
        elif(serialString == "Relay: 32 OFF\r\n"):
            self.ui.relay_32_off()
        elif(serialString == "Relay: 33 ON\r\n"):
            self.ui.relay_33_on()
        elif(serialString == "Relay: 33 OFF\r\n"):
            self.ui.relay_33_off()
        elif(serialString == "Relay: 34 ON\r\n"):
            self.ui.relay_34_on()
        elif(serialString == "Relay: 34 OFF\r\n"):
            self.ui.relay_34_off()
        elif(serialString == "Relay: 35 ON\r\n"):
            self.ui.relay_35_on()
        elif(serialString == "Relay: 35 OFF\r\n"):
            self.ui.relay_35_off()
        elif(serialString == "Relay: 36 ON\r\n"):
            self.ui.relay_36_on()
        elif(serialString == "Relay: 36 OFF\r\n"):
            self.ui.relay_36_off()
        elif(serialString == "Relay: 37 ON\r\n"):
            self.ui.relay_37_on()
        elif(serialString == "Relay: 37 OFF\r\n"):
            self.ui.relay_37_off()
        elif(serialString == "Relay: 38 ON\r\n"):
            self.ui.relay_38_on()
        elif(serialString == "Relay: 38 OFF\r\n"):
            self.ui.relay_38_off()
        elif(serialString == "Relay: 39 ON\r\n"):
            self.ui.relay_39_on()
        elif(serialString == "Relay: 39 OFF\r\n"):
            self.ui.relay_39_off()
        #else if string starts with "Progress:" then extract number
        elif(serialString.startswith("Progress:")):
            progress = serialString.split(":")[1]
            # print(progress)
            self.ui.update_progress(progress.strip())
class MainWindow(QObject):  
    
    def __init__(self):
        QObject.__init__(self)
        
    commandArd = Signal(str)
    relaySig = Signal(str)
    progressSig = Signal(int)
    listofserialportsReceived = Signal(list)

    def update_progress(self, progress):
        self.progress = progress
        # print("emitting progress" + progress)
        self.progressSig.emit(int(float(progress)))

    def relay_22_on(self):
        print("emitting signal about relay 22 on")
        self.relaySig.emit("Relay: 22 ON")
    
    def relay_22_off(self):
        print("emitting signal about relay 22 off")
        self.relaySig.emit("Relay: 22 OFF")

    def relay_23_on(self):
        self.relaySig.emit("Relay: 23 ON")
    
    def relay_23_off(self):
        self.relaySig.emit("Relay: 23 OFF")
    
    def relay_24_on(self):
        self.relaySig.emit("Relay: 24 ON")
    
    def relay_24_off(self):
        self.relaySig.emit("Relay: 24 OFF")

    def relay_25_on(self):
        self.relaySig.emit("Relay: 25 ON")
    
    def relay_25_off(self):
        self.relaySig.emit("Relay: 25 OFF")

    def relay_26_on(self):
        self.relaySig.emit("Relay: 26 ON")

    def relay_26_off(self):
        self.relaySig.emit("Relay: 26 OFF")

    def relay_27_on(self):
        self.relaySig.emit("Relay: 27 ON")

    def relay_27_off(self):
        self.relaySig.emit("Relay: 27 OFF")

    def relay_28_on(self):
        self.relaySig.emit("Relay: 28 ON")

    def relay_28_off(self):
        self.relaySig.emit("Relay: 28 OFF")

    def relay_29_on(self):
        self.relaySig.emit("Relay: 29 ON")

    def relay_29_off(self):
        self.relaySig.emit("Relay: 29 OFF")

    def relay_30_on(self):
        self.relaySig.emit("Relay: 30 ON")

    def relay_30_off(self):
        self.relaySig.emit("Relay: 30 OFF")

    def relay_31_on(self):
        self.relaySig.emit("Relay: 31 ON")

    def relay_31_off(self):
        self.relaySig.emit("Relay: 31 OFF")

    def relay_32_on(self):
        self.relaySig.emit("Relay: 32 ON")

    def relay_32_off(self):
        self.relaySig.emit("Relay: 32 OFF")

    def relay_33_on(self):
        self.relaySig.emit("Relay: 33 ON")

    def relay_33_off(self):
        self.relaySig.emit("Relay: 33 OFF")

    def relay_34_on(self):
        self.relaySig.emit("Relay: 34 ON")
    
    def relay_34_off(self):
        self.relaySig.emit("Relay: 34 OFF")

    def relay_35_on(self):
        self.relaySig.emit("Relay: 35 ON")

    def relay_35_off(self):
        self.relaySig.emit("Relay: 35 OFF")
    
    def relay_36_on(self):
        self.relaySig.emit("Relay: 36 ON")

    def relay_36_off(self):
        self.relaySig.emit("Relay: 36 OFF")

    def relay_37_on(self):
        self.relaySig.emit("Relay: 37 ON")

    def relay_37_off(self):
        self.relaySig.emit("Relay: 37 OFF")

    def relay_38_on(self):
        self.relaySig.emit("Relay: 38 ON")

    def relay_38_off(self):
        self.relaySig.emit("Relay: 38 OFF")

    def relay_39_on(self):
        self.relaySig.emit("Relay: 39 ON")

    def relay_39_off(self):
        self.relaySig.emit("Relay: 39 OFF")

    def udpate_list_of_serial_ports(self, ports):
        self.listofserialportsReceived.emit(ports)
    @Slot(str, str)
    def connect_port(self, port, baudrate):
        global ser
        global serial_rcv_thread
        print("Connecting to port: " + port + " at baudrate: " + baudrate)
        ser = serial.Serial(port, baudrate)
        serial_rcv_thread.start()
     
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
    serial_rcv_thread = serial_receive_thread(main)
    engine.rootContext().setContextProperty("backend", main)
    engine.addImportPath("imports")
    print(engine.importPathList() )
    engine.load('content/App.qml')
    print("before sys exit")
    main.udpate_list_of_serial_ports(list_of_ports)
    # if not engine.rootObjects():
    #     sys.exit(-1)
    #sys.exit()
    app.exec()
    print("after app exit")
    sys.exit()
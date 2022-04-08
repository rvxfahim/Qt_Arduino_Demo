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
            s = serial.Serial(port, baudrate = 115200, timeout = 0, dsrdtr=True)
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
        ui.udpate_list_of_serial_ports(list_of_ports)
        while True:
            if(ser.in_waiting > 0):
                # Read data out of the buffer until a carraige return / new line is found
                serialString = ser.readline()
                serialString = serialString.decode('Ascii')
                print(serialString)

class MainWindow(QObject):  
    
    def __init__(self):
        QObject.__init__(self)
        
    commandArd = Signal(str)
    listofserialportsReceived = Signal(list)
    def udpate_list_of_serial_ports(self, ports):
        self.listofserialportsReceived.emit(ports)
    @Slot(str, str)
    def connect_port(self, port, baudrate):
        global ser
        print("Connecting to port: " + port + " at baudrate: " + baudrate)
        ser = serial.Serial(port, baudrate)
        self.serial_rcv_thread = serial_receive_thread(parent)
        self.serial_rcv_thread.start()
     
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
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
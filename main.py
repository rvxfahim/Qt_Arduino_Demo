import sys
import os
import multiprocessing
import time
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import Qt, QObject, Signal, Slot, Property, QThread

list_of_ports = ["A","B"]

class MyThread(QThread):
        def __init__(self, parent = None):
                QThread.__init__(self, parent)
                self.exiting = False

        def run(self):
                while self.exiting==False:
                        print(".")
                        print(self.exiting)
                        time.sleep(1)

class MainWindow(QObject):  
    def __init__(self):
        QObject.__init__(self)
        self.thread = MyThread()
        self.thread.started.connect(self.started)
        self.thread.finished.connect(self.finished)
        self.thread.start()
    clickAck = Signal(list)
    
    def started(self):
        print("my thread started")

    def finished(self):
        print("my thread finished")

    @Slot(str)
    def clicked_ok(self, ack):
        print("Ack:", ack)
        self.clickAck.emit(list_of_ports)
        
    @Slot()
    def invoke_backend_loop(self):
        print("Invoke backend loop")
        self.thread.exiting=True
        
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)
    engine.addImportPath("imports")
    print(engine.importPathList() )
    engine.load('content/App.qml')
    print("before sys exit")
    # if not engine.rootObjects():
    #     sys.exit(-1)
    #sys.exit()
    app.exec()
    print("after app exit")
    # process1.terminate()
    sys.exit()
from PySide6.QtCore import QObject, Property, Slot

class AppViewModel(QObject):

    def __init__(self) -> None:
        super().__init__()

    def start_monitor(self):
        print("START MONITOR")

    def stop_monitor(self):
        print("STOP MONITOR")
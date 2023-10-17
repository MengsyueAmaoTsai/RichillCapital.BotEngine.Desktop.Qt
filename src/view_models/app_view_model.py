from PySide6.QtCore import QObject, Slot, Property, Signal
from PySide6.QtQml import QmlElement

QML_IMPORT_NAME = "AppViewModel"
QML_IMPORT_MAJOR_VERSION = 1
QML_IMPORT_MINOR_VERSION = 0


@QmlElement
class AppViewModel(QObject):
    value_changed = Signal()
    
    def __init__(self):
        super().__init__()
        print(f"Python object '{__class__.__name__}' initialized.")
        self._value = "Hello from python"

    @Property(str)
    def value(self):
        return self._value
    
    @value.setter
    def value(self, val):
        if self._value != val:
            self._value = val
            self.value_changed.emit()

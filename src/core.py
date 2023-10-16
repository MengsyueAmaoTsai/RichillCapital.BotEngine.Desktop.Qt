from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QmlElement

QML_IMPORT_NAME = "core"
QML_IMPORT_MAJOR_VERSION = 1
QML_IMPORT_MINOR_VERSION = 0


@QmlElement
class MainViewModel(QObject):

    def __init__(self):
        super().__init__()
        print(f"Python object '{__class__.__name__}' initialized.")

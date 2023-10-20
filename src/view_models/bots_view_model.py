
from PySide6.QtCore import Property, QFileSystemWatcher, QObject, Signal, Slot


class BotsViewModel(QObject):

    def __init__(self) -> None:
        super().__init__()

    
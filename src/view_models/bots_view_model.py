
from PySide6.QtCore import QObject, Property, Slot, Signal, QFileSystemWatcher


class BotsViewModel(QObject):

    def __init__(self) -> None:
        super().__init__()

    
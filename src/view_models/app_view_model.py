import asyncio
from pathlib import Path
from PySide6.QtCore import QObject, Property, Slot, Signal, QFileSystemWatcher
from aiofile import AIOFile, LineReader, Writer
from view_models.monitor_view_model import MonitorViewModel

class AppViewModel(QObject):
    new_signal =  Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        self.monitor_view_model = MonitorViewModel()


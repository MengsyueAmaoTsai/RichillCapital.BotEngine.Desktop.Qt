import asyncio
from pathlib import Path
from PySide6.QtCore import QObject, Property, Slot, Signal
from view_models.monitor_view_model import MonitorViewModel
import requests 
import json

class AppViewModel(QObject):
    new_signal =  Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        self.monitor_view_model = MonitorViewModel()

    @Slot()
    def load_bots(self) -> None:
        self._bots.clear()
        self.monitor_view_model.clear_paths()

        response = requests.get("http://localhost:10005/api/bots")  
        data = json.loads(response.content)

        self._bots.extend(data)

        for bot in data:
            self.monitor_view_model.add_file(Path("C://BotEngineDesktop//Data") / f"{bot["id"]}.sig")
            self.monitor_view_model.add_file(Path("C://BotEngineDesktop//Data") / f"{bot["id"]}.exc")
            
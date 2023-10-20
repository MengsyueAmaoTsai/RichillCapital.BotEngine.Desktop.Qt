import asyncio
import json
from pathlib import Path

from aiohttp import ClientSession
from PySide6.QtCore import Property, QObject, Signal, Slot

from view_models.monitor_view_model import MonitorViewModel


class AppViewModel(QObject):
    new_signal =  Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        self.monitor_view_model = MonitorViewModel()

    @Slot()
    def load_bots(self) -> None:
        self._bots.clear()
        
        bots = asyncio.run(self.get_bots_async())
        self._bots.extend(bots)


    async def get_bots_async(self):
        async with ClientSession() as session:
            async with session.get("http://localhost:10005/api/bots") as response:
                content = await response.text()
                return json.loads(content)
            
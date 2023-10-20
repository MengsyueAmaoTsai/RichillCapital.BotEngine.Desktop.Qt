

import asyncio
from pathlib import Path
from typing import override

from aiofile import AIOFile, LineReader
from PySide6.QtCore import Property, QFileSystemWatcher, QObject, Signal, Slot
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class MonitorViewModel(QObject, FileSystemEventHandler):
    new_signal = Signal()
    new_execution = Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        
        self.observer = Observer()
        _ = self.observer.schedule(self, "C://BotEngineDesktop//Data", recursive=False)
        self.observer.start()
    
    @override
    def on_modified(self, event):
        path = Path(event.src_path)

        asyncio.run(self.read_file_async(path))

    async def read_file_async(self, path: Path) -> None:
        
        if path.suffix not in [".sig"]:
            return
        
        async with AIOFile(path, "r", encoding="utf-8") as file:
            async for line in LineReader(file):
                print(line)        
    
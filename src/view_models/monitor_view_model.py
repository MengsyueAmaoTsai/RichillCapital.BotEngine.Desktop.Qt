

import asyncio
from pathlib import Path
from PySide6.QtCore import QObject, Property, Slot, Signal, QFileSystemWatcher
from aiofile import AIOFile, LineReader

class MonitorViewModel(QObject):
    new_signal =  Signal()
    new_execution = Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        
        self.file_system_watcher = QFileSystemWatcher()
        self.file_system_watcher.fileChanged.connect(self.on_file_changed)
        _ = self.file_system_watcher.addPath("C://BotEngineDesktop//Data//XQ-TX-Test.sig")

    def add_file(self, path: Path) -> None:
        _ = self.file_system_watcher.addPath(str(path))
        print(f"ADD {path}")
    
    def clear_paths(self):    
        for path in self.file_system_watcher.files():
            self.file_system_watcher.removePath(path)
        
    def on_file_changed(self, path: str) -> None:
        """Slot function called when the monitored file is changed."""
        asyncio.run(self.read_file_async(Path(path)))

    async def read_file_async(self, path: Path) -> None:
        
        if path.suffix not in [".sig"]:
            return
        
        async with AIOFile(path, "r", encoding="utf-8") as file:
            async for line in LineReader(file):
                print(line)        
    
import asyncio
from pathlib import Path
from PySide6.QtCore import QObject, Property, Slot, Signal, QFileSystemWatcher
from aiofile import AIOFile, LineReader, Writer

class AppViewModel(QObject):
    new_signal =  Signal()

    def __init__(self) -> None:
        super().__init__()

        self.file_system_watcher = QFileSystemWatcher()
        self.file_system_watcher.fileChanged.connect(self.on_file_changed)
        self.file_system_watcher.addPath("C://BotEngineDesktop//Data//test.txt")

    @Slot()
    def start_monitor(self):
        print("start monitor")

    @Slot()
    def stop_monitor(self):
        print("Stop monitor")

    @Slot()
    def load_bots(self) -> None:
        print("Load bot")

    def on_file_changed(self, path: str):
        print(f"File changed. Path={path}")
        asyncio.run(self.read_file_async(path))

    async def read_file_async(self, path: str) -> None:
        async with AIOFile(path, 'r') as file:
            async for line in LineReader(file):
                print(line)        

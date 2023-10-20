

import asyncio
from pathlib import Path
from datetime import datetime as DateTime
from aiofile import AIOFile, LineReader
from PySide6.QtCore import Property, QFileSystemWatcher, QObject, Signal, Slot
from aiohttp import ClientSession
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler, FileModifiedEvent, DirModifiedEvent

class MonitorViewModel(QObject, FileSystemEventHandler):
    new_signal = Signal()
    new_execution = Signal()

    def __init__(self) -> None:
        super().__init__()
        self._bots = []
        
        self.observer = Observer()
        _ = self.observer.schedule(self, "C://BotEngineDesktop//Data", recursive=False)
        self.observer.start()
    
    def on_modified(self, event: FileModifiedEvent | DirModifiedEvent):
        if isinstance(event, DirModifiedEvent): 
            return
        
        if event.event_type != "modified":
            return 
        
        path = Path(event.src_path)
        raw_data = asyncio.run(self.read_file_async(path))
        
        if (len(raw_data) == 0):
            return
        
        data = raw_data[-1]
        parts = data.split(",")

        time = parts[0]
        trade_type = parts[1] 
        symbol = parts[2] 
        quantity = float(parts[3]) 
        price = float(parts[3]) 

        signal = {
            "time": time,
            "tradeType": trade_type,
            "symbol": symbol,
            "quantity": quantity,
            "price": price
        }
        asyncio.run(self.emit_signal_async(path.stem, signal))

        # TODO: new_signal.emit()

    async def emit_signal_async(self, bot_id: str, signal):
        async with ClientSession() as session:
            async with session.post(f"http://localhost:10005/api/bots/{bot_id}/signals", data=signal) as response:
                content = await response.text()
                print(content)

    async def read_file_async(self, path: Path) -> list[str]:
        lines: list[str] = []

        if path.suffix not in [".sig"]:
            return lines
        
        async with AIOFile(path, "r", encoding="utf-8") as file:
            async for line in LineReader(file):
                if (line.strip().isspace() or line.strip() == ""):
                    continue
                lines.append(str(line))
        return lines        
    

from PySide6.QtCore import QFileSystemWatcher, Property, Signal, QUrl, qWarning, QDirIterator, QObject

class FileSystemViewModel(QObject):
    
    file_changed = Signal()

    def __init__(self) -> None:
        super(FileSystemViewModel, self).__init__()    

        self._watcher = QFileSystemWatcher()
     
from pathlib import Path
from uu import encode
from PySide6.QtCore import QObject, Slot, Property, Signal
from PySide6.QtQml import QmlElement
from PySide6.QtNetwork import QNetworkRequest, QNetworkAccessManager, QNetworkReply
import json

QML_IMPORT_NAME = "AppViewModel"
QML_IMPORT_MAJOR_VERSION = 1
QML_IMPORT_MINOR_VERSION = 0


@QmlElement
class AppViewModel(QObject):
    
    def __init__(self):
        super().__init__()
        print(f"Python object '{__class__.__name__}' initialized.")
        self._bots = []
        self._watching_directory = Path("C:/BotEngineDesktop/Data")

        self._http_client = QNetworkAccessManager()
        self._http_client.finished.connect(self.on_response)
        self.load_bots()

    def load_bots(self) -> None:
        self._bots.clear()
        request = QNetworkRequest()
        request.setUrl("http://localhost:10005/api/bots")
        _ = self._http_client.get(request)

    def on_response(self, reply: QNetworkReply):
        """ """     
        error = reply.error
        content = reply.readAll()
        response_json = json.loads(str(content, encoding='utf-8'))
        self._bots.extend(response_json)


    def create_strategy(self) -> None:
        pass
    
    def delete_strategy(self) -> None:
        pass

    def update_strategy(self) -> None:
        pass

import sys
from pathlib import Path

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

import core

try:
    print("Starting application...\n")
    root_path = Path(__file__).parent.parent

    QQuickStyle.setStyle("Material")

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(root_path / 'src' / 'main.qml')

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
except Exception as exception:
    print(f"Unexpected error.\n{exception}")

finally:
    print("\nShutdown completed.")
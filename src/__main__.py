# Copyright (C) 2022 The Qt Company Ltd.
# SPDX-License-Identifier: LicenseRef-Qt-Commercial

import sys
from pathlib import Path

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtQuickControls2 import QQuickStyle

import core

if __name__ == '__main__':
    root_path = Path(__file__).parent.parent

    QQuickStyle.setStyle("Material")

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load(root_path / 'src' / 'main.qml')

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())

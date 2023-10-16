import sys
import logging
from pathlib import Path
from datetime import datetime as DateTime
from PySide6.QtCore import QUrl, qWarning
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtQuickControls2 import QQuickStyle

DATE_FORMAT = "%Y-%m-%dT%H:%M:%S.%fZ"

output_template = "%(asctime)s - [%(levelname)s] - %(name)s\n%(message)s"
output_template = output_template.replace("%(asctime)s", f"{DateTime.utcnow().strftime(DATE_FORMAT)}")

console_handler = logging.StreamHandler(sys.stdout)
console_handler.setFormatter(logging.Formatter(output_template))

log = logging.getLogger("BotEngine.Desktop")
log.addHandler(console_handler)
log.setLevel(logging.DEBUG)


try:
    log.info("Starting application...")

    root_path = Path(__file__).parent.parent
    qml_path = root_path / "src" / "views" / "main_window.qml"
    logo_path = str(root_path / "public" / "logo.png")

    QQuickStyle.setStyle("Fusion")

    app = QGuiApplication(sys.argv)
    app.setOrganizationName("Richill Capital")
    app.setOrganizationDomain("richillcapital.com")
    app.setApplicationName("BotEngine Desktop")
    app.setApplicationDisplayName("BotEngine Desktop")

    engine = QQmlApplicationEngine()
    
    engine.addImportPath(":/") # import path = qrc:/

    # Output import paths to debug console.
    log.info("----- QmlEngine import paths -----")
    for path in engine.importPathList():
        print(f"Import path = {path}")
    print("----------------------------------")

    # Load qml
    engine.load(qml_path)
    
    objects = engine.rootObjects()

    if not objects:
        log.error(f"Can not resolve qml: {qml_path}")
        sys.exit(-1)

    app.setWindowIcon(QIcon(logo_path))
    
    sys.exit(app.exec())

except Exception as exception:
    log.error(f"Unexpected error.\n{exception}")

finally:
    log.info("Shutdown completed.")

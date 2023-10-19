import sys
import logging
from pathlib import Path
from datetime import datetime as DateTime


from PySide6.QtCore import QUrl, qWarning
from PySide6.QtGui import QGuiApplication, QIcon
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType, qmlRegisterSingletonInstance, qmlRegisterModule, qmlRegisterUncreatableMetaObject, qmlRegisterUncreatableType, qmlRegisterSingletonType,qmlClearTypeRegistrations
from PySide6.QtQuickControls2 import QQuickStyle
from view_models.app_view_model import AppViewModel

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
    qml_path = root_path / "src" / "App.qml"
    logo_path = str(root_path / "public" / "logo.png")

    app = QGuiApplication(sys.argv)
    app.setOrganizationName("Richill Capital")
    app.setOrganizationDomain("richillcapital.com")
    app.setApplicationName("BotEngine Desktop")
    app.setApplicationDisplayName("BotEngine Desktop")
    app.setWindowIcon(QIcon(logo_path))

    QQuickStyle.setStyle("Default")
    log.info(f"Using built-in style: {QQuickStyle.name()}")

    # qInstallMessageHandler(logging.messageHandler)

    # Set fonts if we needs


    # Start up
    engine = QQmlApplicationEngine()
    # import path = qrc:/
    # engine.addImportPath("qrc:/modules")
    # engine.addImportPath(root_path / "/src/presentation/qt_tree_view/qml/")  

    # Register types to QML engine.
    
    # Authentication if we needs.

    # qmlRegisterSingletonInstance("Type, 1, 0)

    # register Enums qmlRegisterUncreatableMetaObject

    #region Output import paths to debug console.
    log.info("----- QmlEngine import paths -----")
    for path in engine.importPathList():
        print(f"Import path = {path}")
    print("----------------------------------")
    #endregion

    # Load qml
    engine.load(qml_path)
    
    objects = engine.rootObjects()

    if not objects:
        log.error(f"Can not resolve qml: {qml_path}")
        sys.exit(-1)
    
    sys.exit(app.exec())

except Exception as exception:
    log.error(f"Unexpected error.\n{exception}")

finally:
    log.info("Shutdown completed.")

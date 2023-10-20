

from dependency_injector.containers import DeclarativeContainer, WiringConfiguration
from dependency_injector.providers import Singleton
from view_models.app_view_model import AppViewModel

class Container(DeclarativeContainer):

    wiring_config = WiringConfiguration(
    )

    app_view_model = Singleton(AppViewModel)
from typing import Dict, Any

from flask import Flask


def create_app(config_dict: Dict[str, Any] = None):
    """This function generates an app depending on needs."""
    app = Flask(__name__)

    if config_dict is not None:
        app.config.from_mapping(config_dict)

    return app

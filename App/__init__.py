"""
    Initialisation des variables d'environnement
    Auteur : OM 2023.03.21 Indispensable pour définir les variables 
    indispensables dans tout le projet.
"""
import sys

from environs import Env
from flask import Flask

try:
    try:
        obj_env = Env()
        obj_env.read_env()
        HOST_MYSQL = obj_env("HOST_MYSQL")
        USER_MYSQL = obj_env("USER_MYSQL")
        PASS_MYSQL = obj_env("PASS_MYSQL")
        PORT_MYSQL = int(obj_env("PORT_MYSQL"))
        NAME_BD_MYSQL = obj_env("NAME_BD_MYSQL")
        NAME_FILE_DUMP_SQL_BD = obj_env("NAME_FILE_DUMP_SQL_BD")

        ADRESSE_SRV_FLASK = obj_env("ADRESSE_SRV_FLASK")
        DEBUG_FLASK = obj_env("DEBUG_FLASK")
        PORT_FLASK = obj_env("PORT_FLASK")
        SECRET_KEY_FLASK = obj_env("SECRET_KEY_FLASK")

        # OM 2022.04.11 Début de l'application
        app = Flask(__name__, template_folder="templates")
        print("app.url_map ____> ", app.url_map, file=sys.stderr)

    except Exception as erreur:
        print(('45677564530 init application variables d’environnement ou '
                'avec le fichier (son nom, son contenu)'), file=sys.stderr)
        print(f'{__name__}, {erreur.args[0]}, {repr(erreur)}, {type(erreur)}',
                file=sys.stderr)
        sys.exit(1)

    # Tout commence ici. Il faut "indiquer" les routes de l'applicationn.    
    # Dans l'application les lignes ci-dessous doivent se trouver ici... soit
    # après l'instanciation de la classe "Flask"

    from App.database import database_tools
    from App.essais_wtf_forms import (gestion_essai_wtf, 
            gestion_wtf_forms_demo_select)
    from App.demos_om_164 import routes_demos

    from App.erreurs import msg_avertissements

    from App.personnes import controller
    from App.mail import controller
    #from App.graphie import controller 
    # from App.graphie import controller as graphie
    import App.graphie.controller as graphie
    import App.clas.controller as clas
    import App.genre.controller as genre

except Exception as e:
    print(e, file=sys.stderr)
    sys.exit(1)

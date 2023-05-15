"""Gestion des "routes" FLASK et des données pour les genres.
Fichier : gestion_personnes_crud.py
Auteur : OM 2021.03.16
"""
from pathlib import Path

from flask import redirect
from flask import request
from flask import session
from flask import url_for

from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *
from APP_FILMS_164.personnes.gestion_personnes_wtf_forms import (
    FormWTFAjouterPersonnes)
from APP_FILMS_164.personnes.gestion_personnes_wtf_forms import FormWTFDeleteGenre
from APP_FILMS_164.personnes.gestion_personnes_wtf_forms import FormWTFUpdateGenre

"""
    Auteur : OM 2021.03.16
    Définition d'une "route" /personnes_afficher
    
    Test : ex : http://127.0.0.1:5575/personnes_afficher
    
    Paramètres : order_by : ASC : Ascendant, DESC : Descendant
                id_personne_sel = 0 >> tous les personne.
                id_personne_sel = "n" affiche la personne dont l'id est "n"
"""
class PersonneModel:

    def execute(self, sql: str, values=None) -> list:
        with DBconnection() as db:
            if values is None:
                db.execute(sql)
            else:
                db.execute(sql, values)
            return db.fetchall()

    def get_personne(self, id_personne):
        sql = ('SELECT * '
              'FROM t_personne '
              'WHERE id_personne = %s;')
        return  self.execute(sql, id_personne)[0]

    def get_personnes(self):
        sql = ('SELECT * '
              'FROM t_personne;')
        return self.execute(sql)

    def insert_personne(self, name:str) -> None:
        sql = ('INSERT '
                'INTO t_personne '
                '(nom_pers) '
                'VALUES (%s);')
        self.execute(sql, name)

    def update_personne(self, values) -> None:
        sql = ('UPDATE t_personne '
               'SET nom_pers = %s ' 
               'WHERE id_personne = %s;') 
        self.execute(sql, values)
        

@app.route("/personnes_afficher")
def personnes_afficher():
    model = PersonneModel()
    data = model.get_personnes()

    return render_template("personnes/personnes_afficher.html", data=data)



@app.route("/personnes_ajouter", methods=['GET', 'POST'])
def personnes_ajouter():
    form = FormWTFAjouterPersonnes()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template("personnes/personnes_ajouter_wtf.html",
                form=form)
    name = form.nom_personne_wtf.data
    model = PersonneModel()
    model.insert_personne(name)
    return redirect(url_for('personnes_afficher'))

@app.route("/personnes_update", methods=['GET', 'POST'])
def personnes_update():
    form = FormWTFUpdateGenre()
    id_personne = request.values['id_personne']
    model = PersonneModel()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.nom_personne.data = model.get_personne(
                id_personne)["nom_pers"]
        return render_template("genres/genre_update_wtf.html",
                form=form)
    name = form.nom_personne.data
    values = (name, id_personne)
    model.update_personne(values)
    return redirect(url_for('personnes_afficher'))








"""
    Auteur : OM 2021.03.29
    Définition d'une "route" /genre_update
    
    Test : ex cliquer sur le menu "genres" puis cliquer sur le bouton "EDIT" d'un "genre"
    
    Paramètres : sans
    
    But : Editer(update) un genre qui a été sélectionné dans le formulaire "personnes_afficher.html"
    
    Remarque :  Dans le champ "nom_genre_update_wtf" du formulaire "genres/genre_update_wtf.html",
                le contrôle de la saisie s'effectue ici en Python.
                On transforme la saisie en minuscules.
                On ne doit pas accepter des valeurs vides, des valeurs avec des chiffres,
                des valeurs avec des caractères qui ne sont pas des lettres.
                Pour comprendre [A-Za-zÀ-ÖØ-öø-ÿ] il faut se reporter à la table ASCII https://www.ascii-code.com/
                Accepte le trait d'union ou l'apostrophe, et l'espace entre deux mots, mais pas plus d'une occurence.
"""


@app.route("/personnes_update", methods=['GET', 'POST'])
def personnes_update_wtf():
    # L'utilisateur vient de cliquer sur le bouton "EDIT". Récupère la valeur de "id_genre"
    id_personne = request.values['id_personne_btn_edit_html']

    # Objet formulaire pour l'UPDATE
    form_update = FormWTFUpdateGenre()
    try:
        print(" on submit ", form_update.validate_on_submit())
        if form_update.validate_on_submit():
            # Récupèrer la valeur du champ depuis "genre_update_wtf.html" après avoir cliqué sur "SUBMIT".
            # Puis la convertir en lettres minuscules.
            name_genre_update = form_update.nom_genre_update_wtf.data
            name_genre_update = name_genre_update.lower()
            # date_genre_essai = form_update.date_genre_wtf_essai.data

            valeur_update_dictionnaire = {"value_id_genre": id_personne,
                                          "value_name_genre": name_genre_update,
                                          }
            print("valeur_update_dictionnaire ", valeur_update_dictionnaire)

            str_sql_update_intitulegenre = ('UPDATE t_personne SET nom_pers = %(value_name_genre)s ' 
            'WHERE id_personne = %(value_id_genre)s') 
            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_update_intitulegenre, valeur_update_dictionnaire)

            flash(f"Donnée mise à jour !!", "success")
            print(f"Donnée mise à jour !!")

            # afficher et constater que la donnée est mise à jour.
            # Affiche seulement la valeur modifiée, "ASC" et l'"id_personne"
            return redirect(url_for('personnes_afficher', order_by="ASC", id_genre_sel=id_personne))
        elif request.method == "GET":
            # Opération sur la BD pour récupérer "id_genre" et "intitule_genre" de la "t_genre"
            str_sql_id_genre = ('SELECT id_personne, nom_pers FROM t_personne ' 
                               'WHERE id_personne = %(value_id_genre)s')
            valeur_select_dictionnaire = {"value_id_genre": id_personne}
            with DBconnection() as mybd_conn:
                mybd_conn.execute(str_sql_id_genre, valeur_select_dictionnaire)
            # Une seule valeur est suffisante "fetchone()", vu qu'il n'y a qu'un seul champ "nom genre" pour l'UPDATE
            data_nom_genre = mybd_conn.fetchone()
            print("data_nom_genre ", data_nom_genre, " type ", type(data_nom_genre), " genre ",
                  data_nom_genre["nom_pers"])

            # Afficher la valeur sélectionnée dans les champs du formulaire "genre_update_wtf.html"
            form_update.nom_genre_update_wtf.data = data_nom_genre["nom_pers"]
            #form_update.date_genre_wtf_essai.data = data_nom_genre["date_ins_genre"]

    except Exception as Exception_genre_update_wtf:
        raise ExceptionGenreUpdateWtf(f"fichier : {Path(__file__).name}  ;  "
                                      f"{genre_update_wtf.__name__} ; "
                                      f"{Exception_genre_update_wtf}")

    return render_template("genres/genre_update_wtf.html", form_update=form_update)


"""
    Auteur : OM 2021.04.08
    Définition d'une "route" /genre_delete
    
    Test : ex. cliquer sur le menu "genres" puis cliquer sur le bouton "DELETE" d'un "genre"
    
    Paramètres : sans
    
    But : Effacer(delete) un genre qui a été sélectionné dans le formulaire "personnes_afficher.html"
    
    Remarque :  Dans le champ "nom_genre_delete_wtf" du formulaire "genres/genre_delete_wtf.html",
                le contrôle de la saisie est désactivée. On doit simplement cliquer sur "DELETE"
"""


@app.route("/personnes_delete", methods=['GET', 'POST'])
def personnes_delete_wtf():
    data_films_attribue_genre_delete = None
    btn_submit_del = None
    # L'utilisateur vient de cliquer sur le bouton "DELETE". Récupère la valeur de "id_genre"
    id_genre_delete = request.values['id_genre_btn_delete_html']

    # Objet formulaire pour effacer le genre sélectionné.
    form_delete = FormWTFDeleteGenre()
    try:
        print(" on submit ", form_delete.validate_on_submit())
        if request.method == "POST" and form_delete.validate_on_submit():

            if form_delete.submit_btn_annuler.data:
                return redirect(url_for("genres_afficher", order_by="ASC", id_genre_sel=0))

            if form_delete.submit_btn_conf_del.data:
                # Récupère les données afin d'afficher à nouveau
                # le formulaire "genres/genre_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
                data_films_attribue_genre_delete = session['data_films_attribue_genre_delete']
                print("data_films_attribue_genre_delete ", data_films_attribue_genre_delete)

                flash(f"Effacer le genre de façon définitive de la BD !!!", "danger")
                # L'utilisateur vient de cliquer sur le bouton de confirmation pour effacer...
                # On affiche le bouton "Effacer genre" qui va irrémédiablement EFFACER le genre
                btn_submit_del = True

            if form_delete.submit_btn_del.data:
                valeur_delete_dictionnaire = {"value_id_genre": id_genre_delete}
                print("valeur_delete_dictionnaire ", valeur_delete_dictionnaire)

                # str_sql_delete_films_genre = """DELETE FROM t_genre_film WHERE fk_genre = %(value_id_genre)s"""
                str_sql_delete_idgenre = 'DELETE FROM t_personne WHERE id_personne = %(value_id_genre)s'
                # Manière brutale d'effacer d'abord la "fk_genre", même si elle n'existe pas dans la "t_genre_film"
                # Ensuite on peut effacer le genre vu qu'il n'est plus "lié" (INNODB) dans la "t_genre_film"
                with DBconnection() as mconn_bd:
                    # mconn_bd.execute(str_sql_delete_films_genre, valeur_delete_dictionnaire)
                    mconn_bd.execute(str_sql_delete_idgenre, valeur_delete_dictionnaire)

                flash(f"Genre définitivement effacé !!", "success")
                print(f"Genre définitivement effacé !!")

                # afficher les données
                return redirect(url_for('personnes_afficher', order_by="ASC", id_genre_sel=0))

        if request.method == "GET":
            valeur_select_dictionnaire = {"value_id_genre": id_genre_delete}
            print(id_genre_delete, type(id_genre_delete))

            # Requête qui affiche tous les films_genres qui ont le genre que l'utilisateur veut effacer
            # str_sql_genres_films_delete = """SELECT id_genre_film, nom_film, id_genre, intitule_genre FROM t_genre_film 
            #                                 INNER JOIN t_film ON t_genre_film.fk_film = t_film.id_film
            #                                 INNER JOIN t_genre ON t_genre_film.fk_genre = t_genre.id_genre
            #                                 WHERE fk_genre = %(value_id_genre)s"""
            str_sql_genres_films_delete = 'SELECT * FROM t_personne WHERE id_personne = %(value_id_genre)s;'

            with DBconnection() as mydb_conn:
                mydb_conn.execute(str_sql_genres_films_delete, valeur_select_dictionnaire)
                data_films_attribue_genre_delete = mydb_conn.fetchall()
                print("data_films_attribue_genre_delete...", data_films_attribue_genre_delete)

                # Nécessaire pour mémoriser les données afin d'afficher à nouveau
                # le formulaire "genres/genre_delete_wtf.html" lorsque le bouton "Etes-vous sur d'effacer ?" est cliqué.
                session['data_films_attribue_genre_delete'] = data_films_attribue_genre_delete

                # Opération sur la BD pour récupérer "id_genre" et "intitule_genre" de la "t_genre"
                str_sql_id_genre = "SELECT id_personne, nom_pers FROM t_personne WHERE id_personne = %(value_id_genre)s"

                mydb_conn.execute(str_sql_id_genre, valeur_select_dictionnaire)
                # Une seule valeur est suffisante "fetchone()",
                # vu qu'il n'y a qu'un seul champ "nom genre" pour l'action DELETE
                data_nom_genre = mydb_conn.fetchone()
                print("data_nom_genre ", data_nom_genre, " type ", type(data_nom_genre), " genre ",
                      data_nom_genre["nom_pers"])

            # Afficher la valeur sélectionnée dans le champ du formulaire "genre_delete_wtf.html"
            form_delete.nom_genre_delete_wtf.data = data_nom_genre["nom_pers"]

            # Le bouton pour l'action "DELETE" dans le form. "genre_delete_wtf.html" est caché.
            btn_submit_del = False

    except Exception as Exception_genre_delete_wtf:
        raise ExceptionGenreDeleteWtf(f"fichier : {Path(__file__).name}  ;  "
                                      f"{genre_delete_wtf.__name__} ; "
                                      f"{Exception_genre_delete_wtf}")

    return render_template("genres/genre_delete_wtf.html",
                           form_delete=form_delete,
                           btn_submit_del=btn_submit_del,
                           data_films_associes=data_films_attribue_genre_delete)

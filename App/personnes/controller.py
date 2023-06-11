"""
Gestion des "routes" FLASK et des données pour les personnes.
"""
# from pathlib import Path

from flask import (redirect, request, url_for, render_template)

from App import app

from App.personnes.forms import ( FormAjouterPersonnes, FormDeletePersonnes,
        FormUpdatePersonnes)

from App.personnes.model import PersonneModel
from App.mail.model import MailModel


        

@app.route("/personnes_afficher")
def personnes_afficher():
    model = PersonneModel()
    data = model.find_all()
    return render_template("personnes/personnes_afficher.html", data=data)



@app.route("/personnes_ajouter", methods=['GET', 'POST'])
def personnes_ajouter():
    form = FormAjouterPersonnes()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template("personnes/personnes_ajouter.html", form=form)
    name = form.nom_personne_wtf.data
    model = PersonneModel()
    model.insert_personne(name)
    return redirect(url_for('personnes_afficher'))

@app.route("/personnes_update", methods=['GET', 'POST'])
def personnes_update():
    form = FormUpdatePersonnes()
    id_personne = request.values['id_personne']
    model = PersonneModel()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.nom_personne.data = model.find(id_personne)["nom_pers"]
        return render_template("personnes/personnes_update.html", form=form)
    name = form.nom_personne.data
    values = (name, id_personne)
    model.update_personne(values)
    return redirect(url_for('personnes_afficher'))

@app.route("/personnes_delete", methods=['GET', 'POST'])
def personnes_delete():
    form = FormDeletePersonnes()
    id_personne = request.values['id_personne']
    model = PersonneModel()
    if request.method == 'GET':
        form.nom_personne.data = model.find(id_personne)['nom_pers']
        #data_films_attribue_genre_delete = model.get_personne(id_personne)
        data_films_attribue_genre_delete = None
        return render_template("personnes/personnes_delete.html",
               form=form,
               data_films_associes=data_films_attribue_genre_delete)

    mailModel = MailModel()
    mailModel.delete_join_all_other(id_personne)
    model.delete(id_personne)
    return redirect(url_for('personnes_afficher'))


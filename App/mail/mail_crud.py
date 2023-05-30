
from flask import (redirect, request, url_for, render_template)

from App import app

from App.mail.model import MailModel

from App.mail.forms import FormAjouterMail, FormUpdateMail, FormDeleteMail

from App.mail.model import MailModel

@app.route("/mail_afficher")
def mail_afficher():
    model = MailModel()
    data = model.find_all()
    return render_template("mails/afficher.html", data=data)

@app.route("/mail_ajouter", methods=['GET', 'POST'])
def mail_ajouter():
    form = FormAjouterMail()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template("mails/ajouter.html", form=form)
    name = form.nom.data
    model = MailModel()
    model.insert_mail(name)
    return redirect(url_for('mail_afficher'))

@app.route("/mail_update", methods=['GET', 'POST'])
def mail_update():
    form = FormUpdateMail()
    id_mail = request.values['id_mail']
    model = MailModel()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.nom.data = model.find(id_mail)["nom_mail"]
        return render_template("mails/update.html", form=form)
    name = form.nom.data
    values = (name, id_mail)
    model.update_mail(values)
    return redirect(url_for('mail_afficher'))


@app.route("/mail_delete", methods=['GET', 'POST'])
def mail_delete():
    form = FormDeleteMail()
    id_mail = request.values['id_mail']
    model = MailModel()
    if (request.method == 'GET'):
        form.nom.data = model.find(id_mail)['nom_mail']
        data_films_attribue_genre_delete = None
        return render_template("mails/delete.html",
               form=form,
               data_films_associes=data_films_attribue_genre_delete)
    model.delete(id_mail)
    return redirect(url_for('mail_afficher'))

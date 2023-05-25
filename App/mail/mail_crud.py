
from flask import (redirect, request, url_for, render_template)

from App import app

from App.mail.model import MailModel

from App.mail.forms import FormAjouterMail, FormUpdateMail

from App.mail.model import MailModel

@app.route("/mail_afficher")
def mail_afficher():
    model = MailModel()
    data = model.get_mails()
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
        form.nom.data = model.get_mail(id_mail)["nom_mail"]
        return render_template("mails/update.html", form=form)

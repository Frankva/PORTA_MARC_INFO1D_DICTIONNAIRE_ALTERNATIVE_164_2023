
from flask import (redirect, request, url_for, render_template)

from App import app

from App.mail.model import MailModel

from App.mail.forms import FormAjouterMail, FormUpdateMail, FormDeleteMail

from App.mail.model import MailModel
from App.personnes.model import PersonneModel

def add_other_table_data(line) -> dict :
    model = MailModel()
    line['other'] = model.get_personnes_str(line['id_mail'])
    return line


@app.route("/mail_afficher")
def mail_afficher():
    model = MailModel()
    data = model.find_all()
    data_with_other = map(add_other_table_data, data)
    return render_template("mails/afficher.html", data=data_with_other)

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

@app.route("/pers_avoir_mail_update", methods=['GET', 'POST'])
def pers_avoir_mail_update():
    model = MailModel()
    id_mail = request.values['id_mail']
    selected_data = model.find_join(id_mail)
    selected_id = list(map(lambda line: line['id_personne'], selected_data))
    personneModel = PersonneModel()
    all_data = personneModel.find_all()
    unselected_data = filter(lambda i:
            i['id_personne'] not in selected_id, all_data)
    unselected_data = list(unselected_data)
    if (request.method == 'GET'):
        return render_template("mails/link.html",
                           id_mail=id_mail,
                           all_data=all_data,
                           selected_data=selected_data,
                           unselected_data=unselected_data)
    new_ids_str = request.form.getlist('name_select_tags')
    new_ids = list(map(lambda id: int(id), new_ids_str))
    to_insert = set(new_ids) - set(selected_id)
    to_delete = set(selected_id) - set(new_ids)
    model.insert_join_list(id_mail, to_insert)
    model.delete_join_list(id_mail, to_delete)
    return redirect(url_for('mail_afficher'))



@app.route("/test", methods=['GET', 'POST'])
def test():
    return 'a'

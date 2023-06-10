from flask import (redirect, request, url_for, render_template)
from App import app
from App.graphie.model import GraphieModel as Model

#from App.mail.forms import FormAjouterMail, FormUpdateMail, FormDeleteMail
from App.graphie.forms import FormAjouterGraphie as FormAjouter
from App.graphie.forms import FormUpdateGraphie as FormUpdate

UTITY_NAME = 'graphie'


@app.route(f'/{UTITY_NAME}_afficher')
def graphie_afficher():
    model = Model()
    data = model.find_all()
    return render_template(f'{UTITY_NAME}/afficher.html', data=data)

@app.route(f'/{UTITY_NAME}_ajouter', methods=['GET', 'POST'])
def graphie_ajouter():
    form = FormAjouter()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template(f'{UTITY_NAME}/ajouter.html', form=form)
    graphie = form.graphie.data
    phonetique = form.phonetique.data
    model = Model()
    model.insert(graphie, phonetique)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))

@app.route(f'/{UTITY_NAME}_update', methods=['GET', 'POST'])
def graphie_update():
    form = FormUpdate()
    id = request.values[f'id_{UTITY_NAME}']
    model = Model()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.graphie.data = model.find(id)['graphie_grap']
        form.phonetique.data = model.find(id)['phonetique_grap']
        return render_template(f'{UTITY_NAME}/update.html', form=form)
    graphie = form.graphie.data
    phonetique = form.phonetique.data
    model = Model()
    model.update(graphie, phonetique, id)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))


@app.route(f'/{UTITY_NAME}_test', methods=['GET', 'POST'])
def grahie_test():
    return 'a'

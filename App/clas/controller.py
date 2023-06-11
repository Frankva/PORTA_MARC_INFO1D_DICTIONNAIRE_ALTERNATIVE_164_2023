from flask import (redirect, request, url_for, render_template)
from App import app
from App.clas.model import ClasModel as Model

from App.clas.forms import FormAjouterClas as FormAjouter
from App.clas.forms import FormUpdateClas as FormUpdate
from App.clas.forms import FormDeleteClas as FormDelete

from App.article.model import ArticleModel

UTITY_NAME = 'clas'


@app.route(f'/{UTITY_NAME}_afficher')
def clas_afficher():
    model = Model()
    data = model.find_all()
    return render_template(f'{UTITY_NAME}/afficher.html', data=data)

@app.route(f'/{UTITY_NAME}_ajouter', methods=['GET', 'POST'])
def clas_ajouter():
    form = FormAjouter()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template(f'{UTITY_NAME}/ajouter.html', form=form)
    name = form.name.data
    model = Model()
    model.insert(name)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))

@app.route(f'/{UTITY_NAME}_update', methods=['GET', 'POST'])
def clas_update():
    form = FormUpdate()
    id = request.values[f'id_classe_gramaticale']
    model = Model()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.name.data = model.find(id)['nom_clas']
        return render_template(f'{UTITY_NAME}/update.html', form=form)
    name = form.name.data
    model.update(name, id)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))

@app.route(f'/{UTITY_NAME}_delete', methods=['GET', 'POST'])
def clas_delete():
    form = FormDelete()
    id = request.values[f'id_classe_gramaticale']
    model = Model()
    if request.method == 'GET':
        form.name.data = model.find(id)['nom_clas']
        return render_template(f'{UTITY_NAME}/delete.html', form=form)
    model.delete(id)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))




@app.route(f'/{UTITY_NAME}_test', methods=['GET', 'POST'])
def clas_test():
    return 'a'

from flask import (redirect, request, url_for, render_template)
from App import app
from App.genre.model import GenreModel as Model

from App.genre.forms import FormAjouterGenre as FormAjouter
from App.genre.forms import FormUpdateGenre as FormUpdate
from App.genre.forms import FormDeleteGenre as FormDelete


UTITY_NAME = 'genre'


@app.route(f'/{UTITY_NAME}_afficher')
def genre_afficher():
    model = Model()
    data = model.find_all()
    return render_template(f'{UTITY_NAME}/afficher.html', data=data)

@app.route(f'/{UTITY_NAME}_ajouter', methods=['GET', 'POST'])
def genre_ajouter():
    form = FormAjouter()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        return render_template(f'{UTITY_NAME}/ajouter.html', form=form)
    name = form.name.data
    model = Model()
    model.insert(name)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))

@app.route(f'/{UTITY_NAME}_update', methods=['GET', 'POST'])
def genre_update():
    form = FormUpdate()
    id = request.values[f'id_{UTITY_NAME}']
    model = Model()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.name.data = model.find(id)['nom_genr']
        return render_template(f'{UTITY_NAME}/update.html', form=form)
    name = form.name.data
    model.update(name, id)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))

@app.route(f'/{UTITY_NAME}_delete', methods=['GET', 'POST'])
def genre_delete():
    form = FormDelete()
    id = request.values[f'id_{UTITY_NAME}']
    model = Model()
    if request.method == 'GET':
        form.name.data = model.find(id)['nom_genr']
        return render_template(f'{UTITY_NAME}/delete.html', form=form)
    model.delete(id)
    return redirect(url_for(f'{UTITY_NAME}_afficher'))


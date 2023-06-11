from flask import (redirect, request, url_for, render_template)
from App import app
from App.article.model import ArticleModel as Model

from App.article.forms import FormAjouterArticle as FormAjouter

from App.graphie.model import GraphieModel

UTITY_NAME = 'article'

@app.route(f'/{UTITY_NAME}_ajouter', methods=['GET', 'POST'])
def article_ajouter():
    id_graphie = request.values[f'id_graphie']
    form = FormAjouter()
    graphie_model = GraphieModel()
    if (request.method == 'GET') or (not form.validate_on_submit()):
        form.graphie.data = graphie_model.find(id_graphie)['graphie_grap']
        return render_template(f'{UTITY_NAME}/ajouter.html', form=form)
    model = Model()
    model.insert()

    # not safe
    articles_data = model.find_all()
    id_article = articles_data[-1]['id_article']

    model.insert_join(id_article, id_graphie)
    return redirect(url_for(f'graphie_afficher'))


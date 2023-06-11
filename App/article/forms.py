from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Regexp


class FormAjouterArticle(FlaskForm):

    graphie = StringField(f'Ajöté ũ artikl a la grafi/mo')
    submit = SubmitField('Ajöté')




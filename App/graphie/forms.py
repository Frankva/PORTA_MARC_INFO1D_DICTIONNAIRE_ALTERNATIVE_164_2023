from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Regexp

class FormCommonAUGraphie(FlaskForm):
    regexp = '.+'
    graphie = StringField('Sèsir le mo',
            validators=[Regexp(regexp, message='mo ĩkorèkt')])
    phonetique = StringField('Sèsir la fonétik',
            validators=[Regexp(regexp, message='fonétik ĩkorèkt')])

class FormAjouterGraphie(FormCommonAUGraphie):
    submit = SubmitField('Ajöté')

class FormUpdateGraphie(FormCommonAUGraphie):
    submit = SubmitField('Édité')

class FormDeleteGraphie(FlaskForm):
    nom = StringField('Suprimé sèt grafi')
    submit_btn_del = SubmitField('Suprimé')

from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Regexp

class FormCommonAUGenre(FlaskForm):
    regexp = '.+'
    name = StringField('Sèsir le jãr gramatikal',
            validators=[Regexp(regexp, message='jãr gramatikal ĩkorèkt')])

class FormAjouterGenre(FormCommonAUGenre):
    submit = SubmitField('Ajöté')

class FormUpdateGenre(FormCommonAUGenre):
    submit = SubmitField('Édité')

class FormDeleteGenre(FlaskForm):
    name = StringField('Suprimé se jãr')
    submit_btn_del = SubmitField('Suprimé')


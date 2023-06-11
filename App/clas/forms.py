from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Regexp

class FormCommonAUClas(FlaskForm):
    regexp = '.+'
    name = StringField('Sèsir le nõ',
            validators=[Regexp(regexp, message='nom ĩkorèkt')])

class FormAjouterClas(FormCommonAUClas):
    submit = SubmitField('Ajöté')

class FormUpdateClas(FormCommonAUClas):
    submit = SubmitField('Édité')

class FormDeleteClas(FlaskForm):
    name = StringField('Suprimé sèt klas gramatikal')
    submit_btn_del = SubmitField('Suprimé')


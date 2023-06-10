from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Regexp

class FormCommonAUMail(FlaskForm):
    regexp = '.+@.+\..+'
    nom = StringField("Saisir le mail",
            validators=[Regexp(regexp, message='Mail incorrecte')])


class FormAjouterMail(FormCommonAUMail):
    submit = SubmitField("Ajouter")

class FormUpdateMail(FormCommonAUMail):
    submit = SubmitField('Éditer')

class FormDeleteMail(FlaskForm):
    nom = StringField("Supprimer cette mail")
    submit_btn_del = SubmitField("Supprimer")

# class FormPersAvoirMail(FlaskForm):
#     nom = StringField('Nom')
#     submit = SubmitField("Modifier")


"""
    Fichier : gestion_personnes_wtf_forms.py
    Auteur : OM 2021.03.22
            modif Marc Louis PORTA 2023
    Gestion des formulaires avec WTF
"""
from flask_wtf import FlaskForm
from wtforms import StringField, DateField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, DataRequired
from wtforms.validators import Regexp


class FormAjouterPersonnes(FlaskForm):
    regexp = '.+'
    nom_personne_wtf = StringField('Saisir le nom de la personne',
            validators=[Length(min=1, max=20, message='min 1 max 20'),
            Regexp(regexp, message= 'Insérer des caractères.')])
    submit = SubmitField('Ajouter')


class FormUpdatePersonnes(FlaskForm):
    nom_genre_update_regexp = ".*"
    nom_personne = StringField('Saisir le nom de la personne',
            validators=[Length(min=2, max=20, message='min 2 max 20'),
            Regexp(nom_genre_update_regexp, message='Pas de chiffres, de '
            'caractères spéciaux, d’espace à double, de double apostrophe, de '
            'double trait union')])
    submit = SubmitField('Éditer')


class FormDeletePersonnes(FlaskForm):
    nom_personne = StringField('Supprimer cette personne')
    submit_btn_del = SubmitField('Supprimer')

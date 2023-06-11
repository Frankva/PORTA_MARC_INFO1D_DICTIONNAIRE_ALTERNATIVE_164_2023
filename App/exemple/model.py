from App.database.model import Model

class ExempleModel(Model):
    def __init__(self):
        self.primary_key = 'id_exemple'
        self.table = 't_exemple'
        self._allowed_fields = ('texte_exem')


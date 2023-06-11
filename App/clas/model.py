from App.database.model import Model

class ClasModel(Model):
    def __init__(self):
        self.primary_key = 'id_classe_gramaticale'
        self.table = 't_classe_gramaticale'
        self._allowed_fields = ('nom_clas', )


from App.database.model import Model

class GraphieModel(Model):
    def __init__(self):
        self.primary_key = 'id_graphie'
        self.table = 't_graphie'
        self._allowed_fields = ('graphie_grap', 'phonetique_grap')


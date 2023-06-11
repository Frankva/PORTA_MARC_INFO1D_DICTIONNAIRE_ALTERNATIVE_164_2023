from App.database.model import Model

class GraphieModel(Model):
    def __init__(self):
        self.primary_key = 'id_graphie'
        self.table = 't_graphie'
        self._allowed_fields = ('graphie_grap', 'phonetique_grap')
        self.link_table = 't_arti_avoir_grap'
        self.other_id = 'id_article'
        self.other_table = 't_article'
        self.other_fk = 'fk_article'
        self.fk = 'fk_grap'



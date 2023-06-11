from App.database.model import Model

class GenreModel(Model):
    def __init__(self):
        self.primary_key = 'id_genre'
        self.table = 't_genre'
        self._allowed_fields = ('nom_genr', )


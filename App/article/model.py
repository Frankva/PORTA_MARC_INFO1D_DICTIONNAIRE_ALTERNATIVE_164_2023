from App.database.model import Model
from App.sens.model import SensModel

class ArticleModel(Model):
    def __init__(self):
        self.primary_key = 'id_article'
        self.table = 't_article'
        # self._allowed_fields = ('')

    def find_join_genres(self, id) -> tuple:
        link_table = 't_arti_avoir_genr'
        fk = 'fk_article'
        other_table = 't_genre'
        other_id = 'id_genre'
        other_fk = 'fk_genre'
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {link_table} '
               f'ON {self.primary_key}={fk} '
               f'INNER JOIN {other_table} '
               f'ON {other_id}={other_fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

    def find_join_sens(self, id) -> list:
        fk = 'fk_article'
        other_table = 't_sens'
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {other_table} '
               f'ON {self.primary_key} = {fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

    def find_join_clas(self, id) -> list:
        fk = 'fk_classe_gramaticale'
        other_table = 't_classe_gramaticale'
        other_id = 'id_classe_gramaticale'
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {other_table} '
               f'ON {other_id} = {fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

    def get_articles_dict(self, id) -> dict:
        data = dict()
        sens = self.find_join_sens(id)
        sens_ids = list(map(lambda line: line['id_sens'], sens))
        sens_model = SensModel()
        data['sens_list'] = map(sens_model.get_sens_dict, sens_ids)
        data['genres'] = self.find_join_genres(id)
        clas = self.find_join_clas(id)
        if not clas:
            data['nom_clas'] = ''
        else:
            data['nom_clas'] = clas[0]['nom_clas']
        return data

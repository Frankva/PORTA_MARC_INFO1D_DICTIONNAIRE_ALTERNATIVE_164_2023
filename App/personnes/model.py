from App.database.model import Model


class PersonneModel(Model):

    def __init__(self):
        self.primary_key = 'id_personne'
        self.table = 't_personne'

    def insert_personne(self, name:str) -> None:
        sql = ('INSERT '
               f'INTO {self.table} '
               '(nom_pers) '
               'VALUES (%s);')
        self.execute(sql, name)

    def update_personne(self, values) -> None:
        sql = (f'UPDATE {self.table} '
               'SET nom_pers = %s ' 
               f'WHERE {self.primary_key} = %s;') 
        self.execute(sql, values)

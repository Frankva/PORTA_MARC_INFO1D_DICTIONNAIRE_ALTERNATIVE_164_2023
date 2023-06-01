from App.database.model import Model

class MailModel(Model):
    def __init__(self):
        self.primary_key = 'id_mail'
        self.table = 't_mail'
        self.link_table = 't_pers_avoir_mail'
        self.link_fk = 'id_pers_avoir_mail'
        self.other_fk = 'id_personne'
        self.other_table = 't_personne'

    def insert_mail(self, name:str) -> None:
        sql = ('INSERT '
                f'INTO {self.table} '
                '(nom_mail) '
                'VALUES (%s);')
        self.execute(sql, name)

    def update_mail(self, values) -> None:
        sql = (f'UPDATE {self.table} '
               'SET nom_mail = %s '
               f'WHERE {self.primary_key} = %s;')
        self.execute(sql, values)

    def find_join(self, id)->list:
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {self.link_table} '
               f'ON {self.primary_key}={self.link_fk} '
               f'INNER JOIN {self.other_table} '
               f'ON {self.other_fk}={self.link_fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

    def find_all_join(self)->list:
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {self.link_table} '
               f'ON {self.primary_key}={self.link_fk} '
               f'INNER JOIN {self.other_table} '
               f'ON {self.other_fk}={self.link_fk} ')
        return  self.execute(sql)



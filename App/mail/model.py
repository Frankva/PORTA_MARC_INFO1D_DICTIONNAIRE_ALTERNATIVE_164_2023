from App.database.model import Model
from functools import reduce

class MailModel(Model):
    def __init__(self):
        self.primary_key = 'id_mail'
        self.table = 't_mail'
        self.link_table = 't_pers_avoir_mail'
        self.other_id = 'id_personne'
        self.other_table = 't_personne'
        self.other_fk = 'fk_personne'
        self.fk = 'fk_mail'

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

    # to remove it is put in model parent class
    def find_join(self, id)->list:
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {self.link_table} '
               f'ON {self.primary_key}={self.fk} '
               f'INNER JOIN {self.other_table} '
               f'ON {self.other_id}={self.other_fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

    def get_personnes_str(self, id) -> str:
        data = self.find_join(id)
        if not data:
            return ''
        return reduce(lambda text, line: f'{text} {line["nom_pers"]}',
                    data, '')

    def find_all_join(self)->list:
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {self.link_table} '
               f'ON {self.primary_key}={self.fk} '
               f'INNER JOIN {self.other_table} '
               f'ON {self.other_id}={self.other_fk} ')
        return  self.execute(sql)


    def insert_join(self, id, other_id) -> None:
        sql = ('INSERT '
                f'INTO {self.link_table} '
                f'({self.fk}, {self.other_fk}) '
                'VALUES (%s, %s); ')
        self.execute(sql, (id, other_id))
    

    def insert_join_list(self, id, other_ids) -> None:
        for other_id in other_ids:
            self.insert_join(id, other_id)

    def delete_join(self, id, other_id) -> None:
        sql = ('DELETE '
                f'FROM {self.link_table} '
                f'WHERE (({self.fk}=%s) '
                f'AND ({self.other_fk}=%s));')
        self.execute(sql, (id, other_id))

    def delete_join_list(self, id, other_ids) -> None:
        for other_id in other_ids:
            self.delete_join(id, other_id)
            
    def delete_join_all(self, id) -> None:
        sql = ('DELETE '
                f'FROM {self.link_table} '
                f'WHERE {self.fk}=%s; ')
        self.execute(sql, id)

    def delete_join_all_other(self, id_other) -> None:
        sql = ('DELETE '
                f'FROM {self.link_table} '
                f'WHERE {self.other_fk}=%s;')
        self.execute(sql, id_other)


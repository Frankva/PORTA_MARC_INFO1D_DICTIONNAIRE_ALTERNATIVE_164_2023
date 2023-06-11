from App.database.database_tools import DBconnection
from functools import reduce

class Model:

    def __init__(self):
        self.primary_key = ''
        self.table = ''
        self._allowed_fields = tuple()
        self.link_table = ''
        self.other_id = ''
        self.other_table = ''
        self.other_fk = ''
        self.fk = ''

    def execute(self, sql: str, values=None) -> list:
        with DBconnection() as db:
            if values is None:
                db.execute(sql)
            else:
                db.execute(sql, values)
            return db.fetchall()

    def find(self, id) -> dict:
        sql = ('SELECT * '
              f'FROM {self.table} '
              f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)[0]

    def find_all(self) -> list:
        sql = ('SELECT * '
              f'FROM {self.table};')
        return self.execute(sql)

    def delete(self, id) -> None:
        sql = (f'DELETE FROM {self.table} '
               f'WHERE {self.primary_key} = %s;')
        self.execute(sql, id)

    def insert(self, *values):
        sql = ('INSERT '
                f'INTO {self.table} '
                f'{self.allowed_fields} '
                f'VALUES {self.placeholders_text(values)}; ')
        self.execute(sql, values)

    def insert_join(self, id, other_id) -> None:
        sql = ('INSERT '
                f'INTO {self.link_table} '
                f'({self.fk}, {self.other_fk}) '
                'VALUES (%s, %s); ')
        self.execute(sql, (id, other_id))

    def update(self, *values) -> None:
        sql = (f'UPDATE {self.table} '
               f'SET {self.set_text} '
               f'WHERE {self.primary_key} = %s;')
        self.execute(sql, values)

    @property
    def set_text(self):
        return reduce(lambda text, field: f'{text}, `{field}` = %s',
                self._allowed_fields, '')[2:]



    @staticmethod
    def placeholders_text(values:tuple):
        return '(' + reduce(lambda text, value: f'{text}, %s', values,
                '')[2:] + ')'

    @property
    def allowed_fields(self):
        return ('(' + reduce(lambda text, field: f'{text}, `{field}`',
                self._allowed_fields, '')[2:] + ')')

    def find_join(self, id)->list:
        sql = ('SELECT * '
               f'FROM {self.table} '
               f'INNER JOIN {self.link_table} '
               f'ON {self.primary_key}={self.fk} '
               f'INNER JOIN {self.other_table} '
               f'ON {self.other_id}={self.other_fk} '
               f'WHERE {self.primary_key} = %s;')
        return  self.execute(sql, id)

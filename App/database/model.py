from App.database.database_tools import DBconnection
from functools import reduce

class Model:

    def __init__(self):
        self.primary_key = ''
        self.table = ''
        self._allowed_fields = tuple()

    def execute(self, sql: str, values=None) -> list:
        with DBconnection() as db:
            if values is None:
                db.execute(sql)
            else:
                db.execute(sql, values)
            return db.fetchall()

    def find(self, id):
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

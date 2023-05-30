from App.database.database_tools import DBconnection

class Model:

    def __init__(self):
        self.primary_key = ''
        self.table = ''

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

    def find_all(self):
        sql = ('SELECT * '
              f'FROM {self.table};')
        return self.execute(sql)

    def delete(self, id) -> None:
        sql = (f'DELETE FROM {self.table} '
               f'WHERE {self.primary_key} = %s;')
        self.execute(sql, id)

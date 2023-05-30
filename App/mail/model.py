from App.database.model import Model

class MailModel(Model):
    def __init__(self):
        self.primary_key = 'id_mail'
        self.table = 't_mail'

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

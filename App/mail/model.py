from App.database.database_tools import DBconnection

class MailModel:

    def execute(self, sql: str, values=None) -> list:
        with DBconnection() as db:
            if values is None:
                db.execute(sql)
            else:
                db.execute(sql, values)
            return db.fetchall()

    def get_mails(self):
        sql = ('SELECT * '
              'FROM t_mail;')
        return self.execute(sql)

    def get_mail(self, id):
        sql = ('SELECT * '
              'FROM t_mail '
              'WHERE id_mail = %s;')
        return self.execute(sql, id)[0]

    def insert_mail(self, name:str) -> None:
        sql = ('INSERT '
                'INTO t_mail '
                '(nom_mail) '
                'VALUES (%s);')
        self.execute(sql, name)

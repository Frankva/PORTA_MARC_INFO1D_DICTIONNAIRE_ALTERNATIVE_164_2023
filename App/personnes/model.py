from App.database.database_tools import DBconnection

class PersonneModel:

    def execute(self, sql: str, values=None) -> list:
        with DBconnection() as db:
            if values is None:
                db.execute(sql)
            else:
                db.execute(sql, values)
            return db.fetchall()

    def get_personne(self, id_personne):
        sql = ('SELECT * '
              'FROM t_personne '
              'WHERE id_personne = %s;')
        return  self.execute(sql, id_personne)[0]

    def get_personnes(self):
        sql = ('SELECT * '
              'FROM t_personne;')
        return self.execute(sql)

    def insert_personne(self, name:str) -> None:
        sql = ('INSERT '
                'INTO t_personne '
                '(nom_pers) '
                'VALUES (%s);')
        self.execute(sql, name)

    def update_personne(self, values) -> None:
        sql = ('UPDATE t_personne '
               'SET nom_pers = %s ' 
               'WHERE id_personne = %s;') 
        self.execute(sql, values)

    def delete_personne(self, id_personne) -> None:
        sql = ('DELETE FROM t_personne '
                'WHERE id_personne = %s;')
        self.execute(sql, id_personne)

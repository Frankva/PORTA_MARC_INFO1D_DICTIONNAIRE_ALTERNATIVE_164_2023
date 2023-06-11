from App.database.model import Model

class SensModel(Model):
    def __init__(self):
        self.primary_key = 'id_sens'
        self.table = 't_sens'
        self._allowed_fields = ('exemple')
        self.link_table = 't_sens_citer_exem'
        self.other_id = 'id_exemple'
        self.other_table = 't_exemple'
        self.other_fk = 'fk_exemple'
        self.fk = 'fk_sens'

    def get_sens_dict(self, id) -> dict:
        data = self.find(id)
        data['exemples'] = self.get_exemples(id)
        return data

    def get_exemples(self, id) -> list:
        data = self.find_join(id)
        if not data:
            return list()
        return list(map(self.filtre_exemple, data))

    @staticmethod
    def filtre_exemple(line):
        data = dict()
        data['id_exemple'] = line ['id_exemple']
        data['texte_exem'] = line ['texte_exem']
        return data







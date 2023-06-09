//Essa é a classe modelo que representa a tarefa.
//Ela possui três atributos: id, todoText e isDone.
// O id é um identificador único para cada tarefa, o todoText é o texto da tarefa e o
//isDone é um booleano que indica se a tarefa está concluída ou não.
//O atributo isDone é opcional, por isso, caso não seja passado, ele será false por padrão.
// A classe também possui um método estático chamado fillList()
//que retorna uma lista de tarefas preenchida com alguns dados.
//Esse método será usado para popular a lista de tarefas no início do aplicativo.

class TarefasModel {
  String? id;
  String? tarefaText;
  bool isDone;

  TarefasModel({
    required this.id,
    required this.tarefaText,
    this.isDone = false,
  });

  static List<TarefasModel> fillList() {
    return [
      TarefasModel(id: '01', tarefaText: 'Ir ao mercado', isDone: true),
      TarefasModel(id: '02', tarefaText: 'Pagar conta de luz', isDone: true),
      TarefasModel(
        id: '03',
        tarefaText: 'Tomar café',
      ),
      TarefasModel(
        id: '04',
        tarefaText: 'Reunião com o time',
      ),
      TarefasModel(
        id: '05',
        tarefaText: 'Trabalho',
      ),
      TarefasModel(
        id: '06',
        tarefaText: 'Jantar com a família',
      ),
    ];
  }
}

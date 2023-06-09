import 'package:flutter/material.dart';

import '../model/tarefa_model.dart';
import '../constants/colors.dart';
import '../widgets/tarefa_item.dart';

//Essa é a classe principal da tela inicial do aplicativo.
//Aqui estamos criando um StatefulWidget. Um StatefulWidget é um widget que possui um estado mutável.
//O estado de um StatefulWidget pode ser alterado durante a execução do aplicativo.
//Para alterar o estado de um StatefulWidget, é necessário chamar o método setState().

class HomeScreen extends StatefulWidget {
  //O parâmetro key é usado para identificar o widget. Ele é usado pelo framework para identificar o widget.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Aqui estamos criando uma lista de tarefas e preenchendo ela com os dados criados na função na classe model.
  final tarefasLista = TarefasModel.fillList();
  List<TarefasModel> _lstTarefas = [];

  //Aqui estamos criando um controlador para o campo de texto que será usado para adicionar novas tarefas.
  final _tarefasController = TextEditingController();

  //A função initState é sempre chamada quando o estado da tela é criado. Nela,
  //estamos atribuindo a lista de tarefas preenchida para a lista que será exibida na tela.
  @override
  void initState() {
    _lstTarefas = tarefasLista;
    super.initState();
  }

  //Aqui estamos criando a tela principal do aplicativo.
  @override
  Widget build(BuildContext context) {
    //widget Scaffold é um widget que cria uma tela com uma barra de título e um corpo.
    return Scaffold(
      backgroundColor: tdBGColor,
      //AppBar é um widget que cria uma barra de título. Nesse caso o deixei em branco,
      //caso queira pode adicionar um título para a barra.
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tdBGColor,
        elevation: 0,
      ),
      //Stack é um widget que permite que outros widgets sejam empilhados uns sobre os outros. Funciona como uma pilha.
      body: Stack(
        children: [
          //Container é um widget que cria um container retangular.
          // Nesse caso, estamos criando um container que ocupa todo o espaço da tela. Criamos esse
          //container para que o botão de adicionar tarefa fique fixo na tela.
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            //Aqui estamos criando uma coluna que irá conter a lista de tarefas.
            child: Column(
              children: [
                //Expanded é um widget que expande o filho para preencher o espaço disponível.
                Expanded(
                  //ListView é um widget que cria uma lista rolável de widgets. Essa será a lista de tarefas.
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Tarefas Diárias',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      //Percorremos toda a lista de tarefas e para cada tarefa criamos um widget TarefaItem.
                      //Esse widget é o que exibe cada tarefa na tela.
                      for (TarefasModel tarefas in _lstTarefas.reversed)
                        //Aqui estamos passando os parâmetros necessários para o widget TarefaItem.
                        //É importante que widgets personalizados sejam criados por fora da classe principal para facilitar a manutenção.
                        //Por isso, criamos o widget TarefaItem na pasta widgets.
                        TarefaItem(
                          tarefa: tarefas,
                          onTarefaChanged: _handleTarefaChange,
                          onDeleteItem: _deleteTarefaItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          //Align é um widget que alinha seu filho dentro de si mesmo e depois o posiciona dentro de si mesmo.
          //Aqui estamos alinhando o botão de adicionar tarefa na parte inferior da tela.
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                //Aqui estamos criando um container que irá conter o campo de texto para adicionar tarefas.
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _tarefasController,
                    decoration: const InputDecoration(
                        hintText: 'Adicionar Tarefa', border: InputBorder.none),
                  ),
                ),
              ),
              //Nesse Container estamos criando o botão de adicionar tarefa.
              //Usamos o container para definir o tamanho do botão.
              //Em seguida usamos o ElevatedButton para criar o botão.
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _addTarefaItem(_tarefasController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorGreen,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //Aqui estamos criando uma função que altera o estado da tarefa.
  //O método setState é usado para notificar o framework que o estado da tela foi alterado.
  //Dessa forma, o framework irá reconstruir a tela com os novos dados.
  //Sempre que o estado da tela for alterado, o método build será chamado novamente.
  void _handleTarefaChange(TarefasModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  //Aqui estamos criando uma função que deleta uma tarefa da lista de tarefas.
  //O método removeWhere() remove todos os elementos da lista que satisfazem a condição passada.
  //Nesse caso, estamos removendo o item da lista que possui o mesmo id que o item que queremos deletar.
  void _deleteTarefaItem(String id) {
    setState(() {
      tarefasLista.removeWhere((item) => item.id == id);
    });
  }

  //Aqui estamos criando uma nova tarefa e adicionando ela na lista de tarefas.
  //Usamos o dateTime.now().millisecondsSinceEpoch.toString() para gerar um id único para a tarefa.
  //E usamos o método clear() para limpar o campo de texto.
  void _addTarefaItem(String toDo) {
    setState(() {
      tarefasLista.add(TarefasModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        tarefaText: toDo,
      ));
    });
    _tarefasController.clear();
  }
}

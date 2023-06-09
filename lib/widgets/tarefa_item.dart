import 'package:flutter/material.dart';

import '../model/tarefa_model.dart';
import '../constants/colors.dart';

//Essa classe define o item de Tarefa que sera exibido na lista de tarefas. Aqui definimos o layout do item.
class TarefaItem extends StatelessWidget {
  final TarefasModel tarefa;
  final dynamic onTarefaChanged;
  final dynamic onDeleteItem;

  const TarefaItem({
    Key? key,
    required this.tarefa,
    required this.onTarefaChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      //Este widget cria um item de lista que pode ser selecionado. Deve-se utilizar ele dentro de um ListView.
      child: ListTile(
        onTap: () {
          //Aqui estamos chamando a função que altera o estado da tarefa toda vez que pressionamos o item da lista.
          onTarefaChanged(tarefa);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        //leading é um widget que define o conteúdo que será exibido no início do item da lista.
        //Aqui estamos exibindo um ícone de checkbox.
        //Ele contém uma condição que verifica se a tarefa está concluída ou não.
        //Caso esteja concluída, o ícone será um checkbox marcado, caso contrário, será um checkbox vazio.
        leading: Icon(
          tarefa.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: colorGreen,
        ),
        //Title é um widget que define o conteúdo que será exibido no meio do item da lista.
        //Aqui estamos exibindo o texto da tarefa. Caso a tarefa esteja concluída, o texto será riscado.
        title: Text(
          tarefa.tarefaText!,
          style: TextStyle(
            fontSize: 16,
            color: colorBlack,
            decoration: tarefa.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        //Trailling é um widget que define o conteúdo que será exibido no final do item da lista.
        //Aqui estamos exibindo um ícone de lixeira que será usado para deletar a tarefa.
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: colorRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              //Aqui estamos chamando a função que deleta a tarefa toda vez que pressionamos o ícone de lixeira.
              onDeleteItem(tarefa.id);
            },
          ),
        ),
      ),
    );
  }
}

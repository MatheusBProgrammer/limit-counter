// Importa o pacote Flutter Material Design.
import 'package:flutter/material.dart';

// Função principal que é executada quando o aplicativo é iniciado.
void main() {
  runApp(const Myapp());
}

// StatelessWidget é uma classe base para widgets que descrevem parte da interface do usuário que depende
// apenas da configuração e do contexto do widget.
class Myapp extends StatelessWidget {
  // Este widget é responsável pelo aplicativo inteiro.
  const Myapp({Key? key}) : super(key: key);

  // Método obrigatório que constrói e retorna a árvore de widgets.
  @override
  Widget build(BuildContext context) {
    // MaterialApp é um widget que envolve vários widgets do Material Design.
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //tira o rótulo debud em cima do aplicativo
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  // Método obrigatório que constrói e retorna a árvore de widgets para esta página.
  @override
  Widget build(BuildContext context) {
    // Scaffold é um widget que implementa a estrutura visual básica do Material Design.
    return Scaffold(
      // Define a cor de fundo da tela.
      backgroundColor: Colors.red,
      // body é onde os widgets principais são colocados.
      body: Container(
        decoration: const BoxDecoration(
            //colocando a imagem de fundo
            image: DecorationImage(
                image: AssetImage('assets/images/image.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          // mainAxisAlignment alinha os widgets no eixo vertical principal da coluna.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lista de widgets filhos dentro da coluna.

            // Text é um widget que exibe uma sequência de caracteres com estilo.
            Text(
              !isEmpty && isFull
                  ? 'Lotado'
                  : isEmpty
                      ? 'Está vazio'
                      : 'Pode entrar',
              style: const TextStyle(
                fontSize: 42,
                color: Colors.white,
              ),
            ),

            Padding(
              //cria um padding em torno do elemento dentro do child
              padding: EdgeInsets.all(32), //aplicação do padding em si
              child: Text(
                //conteúdo que receberá o padding
                count.toString(),
                style:  TextStyle(
                  fontSize: 120,
                  color: isFull? Colors.red: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fixedSize: const Size(100, 100),
                      //altura e largura
                      //padding: const EdgeInsets.all(36), //configuração de padding
                      primary: Colors.black,
                      //mudar a cor do botão ao ser pressionado
                      shape: RoundedRectangleBorder(
                          //formato do botão
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: isEmpty ? null : decrement,
                  child: Text(
                    isEmpty ? 'Vazio' : 'Sair',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 38,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100), //altura e largura
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          //formato do botão
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: isFull ? null : increment,
                  child: Text(
                    isFull ? 'Lotado' : 'Entrar',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

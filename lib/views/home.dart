// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pagina = 0;
  PageController controller = PageController(initialPage: 0);

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String info = "";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      //print(imc);
      if (imc < 18.5) {
        info = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        info = "Peso normal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        info = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        info = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        info = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /*void _abrirIMC() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Imc()));
  }

  void _abrirHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void _abrirFinanceiro() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Financeiro()));
  }

  void _abrirTreino() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Treino()));
  }

  void _abrirManu() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Manutencao()));
  }*/

  void resetCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      info = "";
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _buildTreino(String title, String image) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Image.asset(
          image,
          height: 80,
          width: 80,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        shadowColor: Color.fromARGB(255, 255, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              child: Image.asset("images/Logo TigerFit Branco.png"),
            ),
            ListTile(
              leading: Icon(Icons.person,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              title: Text(
                "Minha Conta",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20),
              ),
              onTap: () {
                // _abrirManu();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              title: Text(
                "Início",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // _abrirHome();
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on_outlined,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              title: Text(
                "Financeiro",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // _abrirFinanceiro();
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              title: Text(
                "Treinos",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
              onTap: () {
                // _abrirTreino();
              },
            ),
            ListTile(
              leading: Icon(Icons.monitor_weight,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              title: Text(
                "IMC",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20),
              ),
              onTap: () {
                // _abrirIMC();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              title: Text(
                "Configurações",
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20),
              ),
              onTap: () {
                //_abrirManu();
              },
            )
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text("TIGER FIT - GYM", style: TextStyle(fontSize: 25)),
      ),
      body: Center(
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => pagina = index);
          },
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16),
                  Text(
                    "Bem-vindo(a) a Tiger Fit!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Aqui você encontra tudo o que precisa para atingir seus objetivos de fitness e bem-estar. Temos uma grande variedade de equipamentos de última geração, treinadores qualificados e uma ampla variedade de aulas e programas de treinamento personalizados para ajudá-lo a alcançar seus objetivos.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "AGENDE UMA VISITA",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 32.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                    "images/gym.jpg",
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'CONFIRA OS SEUS TREINOS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildTreino(
                          'Treino de Abdominais',
                          'images/treino_abdominais.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treino de Pernas',
                          'images/treino_pernas.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treino de Peito e Costas',
                          'images/treino_peito_costas.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treino de Braços',
                          'images/treino_bracos.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treino de Panturrilha',
                          'images/treino_panturrilha.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treino de Agachamentos',
                          'images/treino_agachamento.jpg',
                        ),
                        SizedBox(height: 16),
                        _buildTreino(
                          'Treinos Aeróbicos',
                          'images/treino_aerobicos.jpg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 200.0, top: 12.5)),
                    Text('INFORME SEUS DADOS',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 25),
                    Icon(
                      Icons.monitor_weight_outlined,
                      size: 80,
                      color: Color.fromARGB(255, 255, 0, 0),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          labelText: "Peso (Kg)",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      controller: pesoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira seu Peso';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 75),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.straight_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          labelText: "Altura (Cm)",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      controller: alturaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira sua Altura';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 80),
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            calcular();
                          }
                        },
                        child: Text('Calcular'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 0, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      info,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'MINHA CONTA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira seu email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white)
                      ),
                      controller: senhaController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Insira sua senha';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('ENTRAR'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 60,
        iconSize: 30,
        backgroundColor: Colors.black,
        selectedIndex: pagina,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => pagina = index);
          controller.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            icon: Icon(Icons.home_outlined),
            title: Text('HOME',
                style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            activeColor: Color.fromARGB(255, 255, 0, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            icon: Icon(Icons.fitness_center_outlined),
            title: Text('TREINOS',
                style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            activeColor: Color.fromARGB(255, 255, 0, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            icon: Icon(Icons.accessibility_new_outlined),
            title: Text('IMC',
                style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            activeColor: Color.fromARGB(255, 255, 0, 0),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.white,
            icon: Icon(Icons.account_circle_outlined),
            title: Text('USUÁRIO',
                style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))),
            activeColor: Color.fromARGB(255, 255, 0, 0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

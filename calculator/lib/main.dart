import 'package:flutter/material.dart';

void main() {
  runApp(const calculadora());
}

// ignore: camel_case_types
class calculadora extends StatelessWidget {
  const calculadora({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';

  void _calcularIMC() {
    setState(() {
      if (controllerPeso.text == '' || controllerAltura.text == '') {
        resultadoImc = 'Você não preencheu um campo';
    
      } else {
        num numAux = (num.parse(controllerPeso.text) /
            (num.parse(controllerAltura.text) *
                num.parse(controllerAltura.text)));

        resultadoImc = numAux.toStringAsFixed(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 2, 96),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calcule seu IMC',
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  labelText: "Peso ",
                  hintText: "Digite seu peso",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                controller: controllerPeso,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  labelText: "Altura ",
                  hintText: "Digite sua altura",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                controller: controllerAltura,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                resultadoImc,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: _calcularIMC,
                  child: const Text('Calcular'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    // Adicione ação específica aqui
  }
}

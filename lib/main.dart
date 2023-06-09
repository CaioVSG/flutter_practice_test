import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_practice_test/screens/home_screen.dart';

//Essa é a função principal do aplicativo. Ela é chamada quando o aplicativo é iniciado.
//Aqui estamos chamando o widget MaterialApp que é o widget que cria um aplicativo Flutter.
//O widget MaterialApp possui vários parâmetros que podem ser passados para personalizar o aplicativo.
//Nesse caso, estamos passando o parâmetro title que define o título do aplicativo.
//O parâmetro home define a tela inicial do aplicativo. Nesse caso, estamos passando o widget HomeScreen.
//O parâmetro theme define o tema do aplicativo. Nesse caso, estamos passando o tema padrão do Flutter.
//O parâmetro debugShowCheckedModeBanner define se o banner de debug será exibido ou não.
//O parâmetro locale define a localização do aplicativo. Nesse caso, estamos passando o locale do DevicePreview.
//O device_preview é um plugin que permite visualizar o aplicativo em vários dispositivos.

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
      title: 'Device Preview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cbt_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_cbt_app/data/datasources/materi_remote_datasource.dart';
import 'package:flutter_cbt_app/data/datasources/onboarding_local_datasource.dart';
import 'package:flutter_cbt_app/data/datasources/ujian_remote_datasource.dart';
import 'package:flutter_cbt_app/data/models/responses/auth_response_model.dart';
import 'package:flutter_cbt_app/data/models/responses/content_response_model.dart';
import 'package:flutter_cbt_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_cbt_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_cbt_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_cbt_app/presentation/home/bloc/content/content_bloc.dart';
import 'package:flutter_cbt_app/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_cbt_app/presentation/materi/bloc/materi/materi_bloc.dart';
import 'package:flutter_cbt_app/presentation/onboarding/pages/onboarding_page.dart';
import 'package:flutter_cbt_app/presentation/quiz/bloc/answer/answer_bloc.dart';
import 'package:flutter_cbt_app/presentation/quiz/bloc/create_ujian/create_ujian_bloc.dart';
import 'package:flutter_cbt_app/presentation/quiz/bloc/daftar_soal/daftar_soal_bloc.dart';
import 'package:flutter_cbt_app/presentation/quiz/bloc/hitung_nilai/hitung_nilai_bloc.dart';
import 'package:kiosk_mode/kiosk_mode.dart';

import 'data/datasources/content_remote_datasource.dart';
import 'presentation/auth/bloc/logout/logout_bloc.dart';
import 'presentation/quiz/bloc/ujian_by_kategori/ujian_by_kategori_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await startKioskMode();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ContentBloc(ContentRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => MateriBloc(MateriRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => UjianByKategoriBloc(UjianRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateUjianBloc(UjianRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => AnswerBloc(UjianRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DaftarSoalBloc(),
        ),
        BlocProvider(
          create: (context) => HitungNilaiBloc(UjianRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<AuthResponseModel>(
          future: AuthLocalDatasource().getAuthData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const DashboardPage();
            } else {
              return FutureBuilder<bool>(
                  future: OnboardingLocalDatasource().getIsFirstTime(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!
                          ? const LoginPage()
                          : const OnboardingPage();
                    } else {
                      return const OnboardingPage();
                    }
                  });
            }
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

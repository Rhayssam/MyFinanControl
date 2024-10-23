import 'dart:async';
import 'dart:developer';
import 'package:finan_control/app/core/constants/routes.dart';
import 'package:finan_control/app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  bool get wantKeepAlive => true;
  @override
  void dispose() {
    log('dispose');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    log('init');
    timer;
  }

  Timer timer = Timer(const Duration(seconds: 2), () => log('finished'));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nova tela'),
            ElevatedButton(
              onPressed: () async {
                _secureStorage.deleteOne(key: 'CURRENT_USER').then(
                      (_) => Navigator.popAndPushNamed(
                        context,
                        NamedRoute.initial,
                      ),
                    );
              },
              child: Text(
                'Sair',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';
// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
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
        child: Text('Profile'),
      ),
    );
  }
}
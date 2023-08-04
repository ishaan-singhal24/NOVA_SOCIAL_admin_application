import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:novasocial_admin/notifiers/profile/profile_notifier.dart';
import 'package:novasocial_admin/nova_social_admin.dart';
import 'package:novasocial_admin/repositories/profile/global_repository.dart';
import 'package:novasocial_admin/repositories/profile/profile_repository.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();

  await _initialize();
  runApp(const NovaSocialAdminApp());
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();
}

Future<void> _initialize() async {
  await _registerRepo();
  await _registerNotifiers();
}

Future<void> _registerRepo() async {
  getIt.registerSingleton<ProfileRepository>(ProfileRepository());
  getIt.registerSingleton<GlobalRepository>(GlobalRepository());
}

Future<void> _registerNotifiers() async {
  getIt.registerSingleton<ProfileNotifier>(
    ProfileNotifier.initialize(
      getIt<ProfileRepository>(),
      globalRepo: getIt<GlobalRepository>(),
    ),
  );
}

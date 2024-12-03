import 'package:ohos_app/config/routes.dart';
import 'package:domains/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:services/services.dart';
import 'package:widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp.router(
      title: Constants.appName,
      debugShowCheckedModeBanner: true,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh', 'CH')],
      routerConfig: GoRouter(
        errorPageBuilder: (context, state) => const MaterialPage(child: EmptyState(text: '页面不存在')),
        routes: routes.entries.map((e) => GoRoute(name: e.key.value, path: e.key.value, builder: e.value)).toList(),
      ),
      builder: EasyLoading.init(
        builder: (context, child) =>
            MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child!),
      ),
    ));
  }
}

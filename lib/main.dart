import 'package:flutter/material.dart';
import 'package:gdsc_solution_challenge/providers/event_provider.dart';
import 'package:gdsc_solution_challenge/providers/theme_provider.dart';
import 'package:gdsc_solution_challenge/screens/event_detail_screen.dart';
import 'package:gdsc_solution_challenge/screens/events_screen.dart';
import 'package:gdsc_solution_challenge/screens/new_event_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppWithProviderSetup());
}

// modify this to implement different providers
class AppWithProviderSetup extends StatelessWidget {
  const AppWithProviderSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // setting up provider for controlling themes
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Themes(),
        ),
        ChangeNotifierProvider(
          create: (_) => Events(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

// this will contain logic for the app to load initial contents and routes
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: context.watch<Themes>().currentTheme,
      debugShowCheckedModeBanner: false,

      initialRoute: EventsScreen.routeName,
      routes: {
        EventsScreen.routeName: (_) => const EventsScreen(),
        NewEventScreen.routeName: (_) => const NewEventScreen(),
        EventDetailScreen.routeName: (_) => const EventDetailScreen(),
      },
    );
  }
}

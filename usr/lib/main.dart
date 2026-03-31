import 'package:flutter/material.dart';

void main() {
  // runApp starts the application and tells it which widget is the root.
  runApp(const MyApp());
}

// MyApp is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Front-End',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Routing Safety: Always define the initial route and the routes map
      initialRoute: '/',
      routes: {
        '/': (context) => const LearningHomePage(),
      },
    );
  }
}

// LearningHomePage is a "StatefulWidget". 
// In front-end development, "State" refers to data that can change and affect the UI.
class LearningHomePage extends StatefulWidget {
  const LearningHomePage({super.key});

  @override
  State<LearningHomePage> createState() => _LearningHomePageState();
}

class _LearningHomePageState extends State<LearningHomePage> {
  // --- STATE VARIABLES ---
  // These variables hold the data for our screen. 
  // When they change, the UI updates automatically!
  bool _isDarkMode = false;
  int _clickCount = 0;

  // --- LOGIC / INTERACTIVITY ---
  // This function runs when the user clicks the button.
  void _interact() {
    // setState() is crucial in Flutter. It tells the app: 
    // "Hey, the data changed! Please redraw the screen to show the new data."
    setState(() {
      _clickCount++;
      
      // Every 5 clicks, we toggle between dark mode and light mode
      if (_clickCount % 5 == 0) {
        _isDarkMode = !_isDarkMode;
      }
    });
  }

  // --- UI / LAYOUT ---
  // The build method describes what the user actually sees on the screen.
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of a page (top bar, body, background)
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[100],
      
      // The top navigation bar
      appBar: AppBar(
        title: const Text('My First Front-End App'),
        backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
        foregroundColor: Colors.white,
      ),
      
      // The main content area
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. A simple Text Widget
              Text(
                'Welcome to Front-End Development!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 20), // Adds vertical spacing
              
              // 2. A Card Widget to group information nicely
              Card(
                elevation: 4,
                color: _isDarkMode ? Colors.grey[800] : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Front-end is all about what the user sees and interacts with. '
                        'In Flutter, we build the UI using "Widgets". Everything you see here is a Widget!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: _isDarkMode ? Colors.grey[300] : Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // This text updates dynamically based on our state variable!
                      Text(
                        'You have interacted $_clickCount times.',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // 3. An Interactive Button Widget
              ElevatedButton.icon(
                onPressed: _interact,
                icon: const Icon(Icons.touch_app),
                label: const Text('Interact with UI'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              
              // 4. A helpful hint
              Text(
                '(Tip: Click 5 times to toggle the theme!)',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: _isDarkMode ? Colors.grey[400] : Colors.grey[600],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

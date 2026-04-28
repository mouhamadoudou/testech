import 'package:flutter/material.dart';

class MagicButtonScreen extends StatefulWidget {
  const MagicButtonScreen({super.key});

  @override
  State<MagicButtonScreen> createState() => _MagicButtonScreenState();
}

class _MagicButtonScreenState extends State<MagicButtonScreen> {
  String? _message; // le texte à afficher (null = rien à afficher)
  bool _isLoading = false; // true pendant l'attente

  final _nameController = TextEditingController();

  Future<void> _launchMagic() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _message = "Hello world Im ${_nameController.text}";
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _message = "Hello world Im zayd";
    print("hello world");
  }

  @override
  void dispose() {
    _nameController.dispose();
    print("byby");
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mag")),
      body: Center(
        child: Column(
          children: [
            _isLoading
                ? const CircularProgressIndicator()
                : Text(_message ?? 'Aucun message'),
            ElevatedButton(
              onPressed: _isLoading ? null : _launchMagic,
              child: const Text("Lancer le metthod"),
            ),
           const SizedBox(height: 16,),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Tnn prenom",
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

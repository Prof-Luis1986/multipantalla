import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _playAudio(); // Reproducir el audio al entrar a la pantalla
  }

  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource('monet.mp3')); // Reproducir el audio
    setState(() {
      _isPlaying = true;
    });
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause(); // Pausar el audio
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Liberar recursos del reproductor de audio
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar la imagen
            Image.asset(
              'assets/monet.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20), // Espacio entre la imagen y el botón
            // Botón para reproducir/pausar el audio
            ElevatedButton(
              onPressed: () {
                if (_isPlaying) {
                  _pauseAudio();
                } else {
                  _playAudio();
                }
              },
              child: Text(_isPlaying ? 'Pause Audio' : 'Play Audio'),
            ),
            SizedBox(height: 20), // Espacio adicional
            // Botón para regresar a la pantalla anterior
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
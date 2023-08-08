import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class OcrScreen extends StatefulWidget {
  @override
  _OcrScreenState createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  File? _pickedImage;
  List<dynamic>? _recognitions;
  late Interpreter interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    String modelPath = 'assets/lite-model_keras-ocr_float16_2.tflite';
    try {
      final gpuDelegateV2 = GpuDelegateV2(); // Create a GPU delegate instance
      final options = InterpreterOptions()
        ..addDelegate(gpuDelegateV2); // Add the GPU delegate to the interpreter

      interpreter = await Interpreter.fromAsset(modelPath, options: options);
    } catch (e) {}
  }

  Future<void> runModelOnImage(File image) async {
    if (image == null) return;

    try {
      final imgBytes = await image.readAsBytes();
      final inputName = interpreter.getInputTensor(0).name;
      final outputName = interpreter.getOutputTensor(0).name;

      interpreter.run(inputName, {inputName: imgBytes});

      var outputTensor = interpreter.getOutputTensor(0);
      var outputData = outputTensor.data as Float32List;
      var recognitions = outputData.buffer.asUint8List();
      setState(() {
        _recognitions = recognitions;
      });
    } catch (e) {}
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
        _recognitions = null; // Reset previous results
      });
      runModelOnImage(_pickedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_pickedImage != null)
              Image.file(
                _pickedImage!,
                height: 200,
              ),
            if (_recognitions != null)
              Text(
                'Recognized Text: ${_recognitions![0]}', // Display the first recognition value as an example
                style: TextStyle(fontSize: 20),
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    interpreter.close();
    super.dispose();
  }
}

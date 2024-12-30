import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackScreen extends StatefulWidget {
  final String instruction;
  final String generatedText;

  FeedbackScreen({required this.instruction, required this.generatedText});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _fluency = 1.0;
  double _coherence = 1.0;
  double _relevance = 1.0;
  double _diversity = 1.0;

  Future<void> _submitFeedback() async {
    final response = await http.post(
      Uri.parse('http://192.168.216.153:5000/feedback'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'instruction': widget.instruction,
        'generated_text': widget.generatedText,
        'fluency': _fluency.toInt(),
        'coherence': _coherence.toInt(),
        'relevance': _relevance.toInt(),
        'diversity': _diversity.toInt(),
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit feedback')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provide Feedback'),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.feedback_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Text(
              'Instruction:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.instruction),
            SizedBox(height: 10),
            Text(
              'Generated Text:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.generatedText),*/
            SizedBox(height: 20),
            Text('Fluency: ${_fluency.toInt()}'),
            Slider(
              value: _fluency,
              min: 1,
              max: 5,
              divisions: 4,
              label: _fluency.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _fluency = value;
                });
              },
            ),
            Text('Coherence: ${_coherence.toInt()}'),
            Slider(
              value: _coherence,
              min: 1,
              max: 5,
              divisions: 4,
              label: _coherence.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _coherence = value;
                });
              },
            ),
            Text('Relevance: ${_relevance.toInt()}'),
            Slider(
              value: _relevance,
              min: 1,
              max: 5,
              divisions: 4,
              label: _relevance.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _relevance = value;
                });
              },
            ),
            Text('Diversity: ${_diversity.toInt()}'),
            Slider(
              value: _diversity,
              min: 1,
              max: 5,
              divisions: 4,
              label: _diversity.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _diversity = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
                  foregroundColor: Colors.white,
                  //minimumSize: const Size(double.infinity, 50),
                  shape: const StadiumBorder(),
                ),
                child: const Text('Submit Feedback'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

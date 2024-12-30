import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  double _temperature = 0.7;
  double _maxLength = 100;

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add({'user': _controller.text});
    });

    final response = await http.post(
      Uri.parse('http://192.168.216.153:5000/generate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'instruction': _controller.text,
        'temperature': _temperature,
        'max_length': _maxLength.toInt(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _messages.add({'bot': data['generated_text']});
      });
    } else {
      setState(() {
        _messages.add({'bot': 'Error: Unable to get response from server.'});
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot'),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFF17203A).withOpacity(0.8),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.chat_bubble),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    /*title: Text(
                      message.keys.first == 'user' ? '你' : '阿ㄆㄧㄚˇ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                    ),*/
                    /*title: Text(
                      message.keys.first == 'user' ? '' : '阿ㄆㄧㄚˇ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),*/
                    subtitle: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: Text(
                        message.values.first,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    tileColor: message.keys.first == 'user'
                        ? Colors.blue[50]
                        : Colors.green[50],
                    textColor: message.keys.first == 'user'
                        ? Colors.black
                        : Colors.black,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Temperature:'),
                      Expanded(
                        child: Slider(
                          value: _temperature,
                          min: 0.1,
                          max: 1.0,
                          divisions: 9,
                          label: _temperature.toStringAsFixed(1),
                          onChanged: (value) {
                            setState(() {
                              _temperature = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Max Length:'),
                      Expanded(
                        child: Slider(
                          value: _maxLength,
                          min: 50,
                          max: 200,
                          divisions: 15,
                          label: _maxLength.toInt().toString(),
                          onChanged: (value) {
                            setState(() {
                              _maxLength = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

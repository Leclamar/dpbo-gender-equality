import 'package:flutter/material.dart';
import 'community.dart';
import 'contoh_chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagesPage(),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search here ...",
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CommunityScreen()),
              );
            },
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.people, color: Colors.black),
                Text(
                  "Community",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Pesan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(name: "Dr. Tony"),
                      ),
                    );
                  },
                  child: MessageTile(
                    imageUrl: 'assets/avatar1.png',
                    name: "Dr. Tony",
                    message: "Hai, ada yang bisa dibantu?",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(name: "Dr. Gary"),
                      ),
                    );
                  },
                  child: MessageTile(
                    imageUrl: 'assets/avatar2.png',
                    name: "Dr. Gary",
                    message: "Halo, ada yang bisa saya bantu?",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(name: "Dr. Emily"),
                      ),
                    );
                  },
                  child: MessageTile(
                    imageUrl: 'assets/avatar3.png',
                    name: "Dr. Emily",
                    message: "Selamat pagi!",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;

  MessageTile({required this.imageUrl, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 25,
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(message),
    );
  }
}
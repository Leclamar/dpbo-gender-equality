import 'package:flutter/material.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Map<String, String>> users = [
    {"name": "User 1", "phone": "+256 704 123 456"},
    {"name": "User 2", "phone": "+256 704 654 321"},
    {"name": "User 3", "phone": "+256 704 111 222"},
    {"name": "User 4", "phone": "+256 704 333 444"},
  ];

  late List<Map<String, String>> filteredUsers;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void filterSearch(String query) {
    final results = users
        .where((user) => user['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredUsers = results;
    });
  }

  void deleteUser(int index) {
    setState(() {
      filteredUsers.removeAt(index);
      users = List.from(filteredUsers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Block User'),
            IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: filterSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        filteredUsers[index]['name']![0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(filteredUsers[index]['name']!),
                    subtitle: Text(filteredUsers[index]['phone']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteUser(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Welcome to the Community Page!'),
      ),
    );
  }
}

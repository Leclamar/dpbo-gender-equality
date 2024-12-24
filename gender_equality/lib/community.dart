import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommunityScreen(),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search here ...',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.people,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Komunitas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            CommunityCard(
              title: 'Komunitas Baru',
              icon: Icons.groups,
              iconBackground: Colors.grey[300],
            ),
            SizedBox(height: 16),
            CommunityCard(
              title: 'Community Name',
              icon: Icons.person,
              iconBackground: Colors.green[100],
              createdDate: '2nd/06/2020',
              members: 12,
            ),
            SizedBox(height: 8),
            CommunityCard(
              title: 'Community Name',
              icon: Icons.person,
              iconBackground: Colors.purple[100],
              createdDate: '2nd/06/2020',
              members: 12,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3586D2), // Mengatur warna menjadi #3586D2
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CommunityCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconBackground;
  final String? createdDate;
  final int? members;

  const CommunityCard({
    required this.title,
    required this.icon,
    this.iconBackground,
    this.createdDate,
    this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: iconBackground ?? Colors.grey[200],
            child: Icon(
              icon,
              size: 28,
              color: Colors.black54,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              if (createdDate != null && members != null) ...[
                SizedBox(height: 4),
                Text(
                  'Created: $createdDate',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                SizedBox(height: 2),
                Text(
                  '$members members',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

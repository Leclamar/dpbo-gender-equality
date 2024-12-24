import 'package:flutter/material.dart';
import 'profile.dart';
import 'artikel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: Colors.blue),
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey),
            ),
            iconSize: 40,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(label: 'Berita'),
                CategoryButton(label: 'FAQ'),
                CategoryButton(label: 'Kesetaraan'),
              ],
            ),
            SizedBox(height: 16),
            Section(
              title: 'Rekomendasi',
              items: ['Belajar Flutter', 'Tips Coding', 'Panduan UI/UX'],
              onItemTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(title: ['Belajar Flutter', 'Tips Coding', 'Panduan UI/UX'][index]),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Section(
              title: 'Tahukah Kamu?',
              items: ['Fakta Teknologi', 'Tips Hidup Sehat', 'Sejarah Internet'],
              onItemTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(title: ['Fakta Teknologi', 'Tips Hidup Sehat', 'Sejarah Internet'][index]),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Section(
              title: 'Berita Terbaru',
              items: ['Perkembangan AI', 'Update Flutter', 'Tren Teknologi 2024'],
              onItemTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleDetailScreen(title: ['Perkembangan AI', 'Update Flutter', 'Tren Teknologi 2024'][index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<String> items;
  final void Function(int)? onItemTap;

  Section({required this.title, required this.items, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items.asMap().entries.map((entry) {
              int index = entry.key;
              String label = entry.value;

              return ItemCard(
                label: label,
                onTap: () {
                  if (onItemTap != null) {
                    onItemTap!(index);
                  }
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const ItemCard({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


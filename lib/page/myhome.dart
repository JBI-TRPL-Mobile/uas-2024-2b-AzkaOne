import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  
final String userName;

  const MyHome({super.key, required this.userName});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome '),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/back.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Keep Moving Up
              Text(
                'Keep Moving Up',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Selamat Datang Dan Semangat Jalanani Hari',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              // Categories
              const SizedBox(height: 24),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  // Example category items
                  CategoryItem(
                    title: 'Development',
                    imagePath: 'assets/images/im1.jpg',
                  ),
                  CategoryItem(
                    title: 'IT & Software',
                    imagePath: 'assets/images/im2.jpg',
                  ),
                  CategoryItem(
                    title: 'UI/UX',
                    imagePath: 'assets/images/im3.jpg',
                  ),
                  CategoryItem(
                    title: 'Development',
                    imagePath: 'assets/images/im1.jpg',
                  ),
                  CategoryItem(
                    title: 'IT & Software',
                    imagePath: 'assets/images/im2.jpg',
                  ),
                  CategoryItem(
                    title: 'UI/UX',
                    imagePath: 'assets/images/im3.jpg',
                  ),
                ],
              ),

              // Top Courses
              const SizedBox(height: 24),
              Text(
                'Top Courses',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItem extends StatelessWidget {
  final String title;

  const CourseItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(title),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Menampilkan gambar dari assets
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          // Menampilkan judul kategori
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

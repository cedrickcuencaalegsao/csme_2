import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/navigation_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home page'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: Future.delayed(const Duration(seconds: 3)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return ClipOval(
                    child: Image.network(
                      'https://hips.hearstapps.com/hmg-prod/images/napoleon-crossing-the-alps-1802-the-full-french-title-of-news-photo-1700601601.jpg?crop=1.00xw:0.904xh;0,0.0576xh&resize=980:*',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          size: 150,
                          color: Colors.red,
                        );
                      },
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Napoleon Bonaparte',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'French military general Napoleon Bonaparte crowned himself the first emperor of France in 1804. His Napoleonic Code remains a model for governments worldwide.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationButton(
        pageName: 'Home',
      ),
    );
  }
}

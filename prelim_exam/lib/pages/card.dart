import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/navigation_button.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  CardViewState createState() => CardViewState();
}

class CardViewState extends State<CardView> {
  final List<Map<String, String>> figures = [
    {
      'name': 'Napoleon Bonaparte',
      'description': 'French military leader.',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/napoleon-crossing-the-alps-1802-the-full-french-title-of-news-photo-1700601601.jpg?crop=1.00xw:0.904xh;0,0.0576xh&resize=980:*',
    },
    {
      'name': 'Julius Caesar',
      'description': 'Roman general and statesman.',
      'image':
          'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRFFullzqgaw6LZkI7K4FG8StFCgQns_x_ClBLYnuYQxZ8_CQOwliZRMWnndxUTQzSuSNGyxTtaXH_BWSY',
    },
    {
      'name': 'Alexander the Great',
      'description': 'King of Macedonia.',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/gettyimages-463906803sq.jpg',
    },
    {
      'name': 'Cleopatra',
      'description': 'Queen of Egypt.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTagMmR2d10zw2l3Wl4jr-phIg5vJPh2sOmRQ&s',
    },
    {
      'name': 'Leonardo da Vinci',
      'description': 'Renaissance artist & scientist.',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_G5r53TLdwVOLQvg50uLgGUCFiWya6IBgJw&s',
    },
    {
      'name': 'Abraham Lincoln',
      'description': '16th President of the USA.',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Abraham_Lincoln_1863_Portrait_%283x4_cropped%29.jpg/1200px-Abraham_Lincoln_1863_Portrait_%283x4_cropped%29.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Card Page'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4, // Adjusts card height
          ),
          itemCount: figures.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${figures[index]['name']} selected"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        figures[index]['image']!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      figures[index]['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      figures[index]['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const NavigationButton(pageName: 'Card'),
    );
  }
}

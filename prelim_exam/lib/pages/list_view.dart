import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../components/navigation_button.dart';
import '../components/list_modal.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});
  @override
  ListViewPageState createState() => ListViewPageState();
}

class ListViewPageState extends State<ListViewPage> {
  final List<Map<String, String>> figures = [
    {
      'name': 'Napoleon Bonaparte',
      'description': 'French military leader.',
      'image':
          'https://hips.hearstapps.com/hmg-prod/images/napoleon-crossing-the-alps-1802-the-full-french-title-of-news-photo-1700601601.jpg?crop=1.00xw:0.904xh;0,0.0576xh&resize=980:*',
    },
    {
      'name': 'Julius Ceasar',
      'description': 'Roman general and stateman.',
      'image':
          'https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRFFullzqgaw6LZkI7K4FG8StFCgQns_x_ClBLYnuYQxZ8_CQOwliZRMWnndxUTQzSuSNGyxTtaXH_BWSY',
    },
    {
      'name': 'Alexander the Greate',
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
      'name': 'Leonardo da Vince',
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
      appBar: const CustomAppBar(title: "List View Page"),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: figures.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  radius: 25,
                  child: ClipOval(
                    child: Image.network(
                      figures[index]['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  figures[index]['name']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(figures[index]['description']!),
                trailing: const Icon(
                  Icons.info_outline,
                  color: Colors.grey,
                ),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) {
                        return ListModal(
                          name: figures[index]["name"]!,
                          description: figures[index]['description']!,
                          image: figures[index]['image']!,
                        );
                      });
                },
              ),
            );
          }),
      bottomNavigationBar: const NavigationButton(pageName: 'List'),
    );
  }
}

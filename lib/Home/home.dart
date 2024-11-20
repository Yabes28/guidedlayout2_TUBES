import 'package:flutter/material.dart';
import 'package:guidedlayout2_1748/View/profile.dart';
import 'package:guidedlayout2_1748/View/view_list.dart';
import 'dart:async';
import 'package:guidedlayout2_1748/Home/alat1.dart';
import 'package:guidedlayout2_1748/Home/abs.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Define the widget options based on the selected index in the BottomNavigationBar
  static const List<Widget> _widgetOptions = <Widget>[
    CategorySelectionPage(),
    ListNamaView(),
    ProfilePage(),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}


class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({Key? key}) : super(key: key);

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}


class _CategorySelectionPageState extends State<CategorySelectionPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  // Mulai auto slide
  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat widget dibuang
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat datang Nathaniel!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Carousel yang dapat auto-slide
              SizedBox(
                height: screenHeight * 0.3,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Image.asset('assets/carousel1.jpg', fit: BoxFit.cover),
                    Image.asset('assets/carousel2.jpg', fit: BoxFit.cover),
                    Image.asset('assets/carousel3.jpg', fit: BoxFit.cover),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Indikator untuk carousel
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    height: 8.0,
                    width: _currentPage == index ? 16.0 : 8.0,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              const Text(
                'Alat Tersedia',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // List alat
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Bench Press'),
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Alat1Page(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Treadmill'),
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Alat1Page(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Legpress'),
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Alat1Page(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: const Text('Cable Machine'),
                      tileColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Alat1Page(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Apa Yang Ingin Kamu Latih?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: screenHeight * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WorkoutCard(
                      title: 'Fullbody Workout',
                      price: 'Rp 450.000,00',
                      imageAsset: 'assets/fullbody.jpg',
                      onPressed: () {
                        // Tambahkan navigasi sesuai kebutuhan
                      },
                    ),
                    WorkoutCard(
                      title: 'Lowerbody Workout',
                      price: 'Rp 300.000,00',
                      imageAsset: 'assets/lowerbody.jpg',
                      onPressed: () {
                        // Tambahkan navigasi sesuai kebutuhan
                      },
                    ),
                    WorkoutCard(
                      title: 'Abs Workout',
                      price: 'Rp 300.000,00',
                      imageAsset: 'assets/abs.jpg',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AbsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageAsset;
  final VoidCallback onPressed; // Tambahkan callback

  const WorkoutCard({
    Key? key,
    required this.title,
    required this.price,
    required this.imageAsset,
    required this.onPressed, // Inisialisasi callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(imageAsset,
                height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.blue)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onPressed, // Gunakan callback
                  child: const Text('View Class'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


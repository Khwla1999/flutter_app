import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  List<String> _cart = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addToCart(String course) {
    setState(() {
      _cart.add(course);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'أضيف إلى السلة',
          style: GoogleFonts.cairo(),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showCart() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Text(
            'السلة',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final course in _cart)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    course,
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF2C2C2E).withOpacity(0.5),
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _cart.clear();
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'تم الطلب بنجاح',
                        style: GoogleFonts.cairo(
                            color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF007AFF),
                ),
                child: Text(
                  'الدفع',
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courseNames = [
      'الفيزياء الكمية',
      'الكيمياء الحيوية',
      'علم الأحياء الجزيئي',
      'هندسة المواد',
      'علم الفلك',
      'علم الأرض',
      'علم الأحياء الدقيقة',
      'الهندسة الوراثية',
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9B51E0),
              Color(0xFF2D9CDB),
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFF2C2C2E).withOpacity(0.5),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'الكورسات',
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: _showCart,
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.white,
                    ),
                    if (_cart.isNotEmpty)
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF007AFF),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            _cart.length.toString(),
                            style: GoogleFonts.cairo(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                IconButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, "/login"),
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final course = courseNames[index];
                    return SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: GestureDetector(
                          onTap: () {
                            _addToCart(course);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF2C2C2E).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Center(
                              child: Text(
                                course,
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

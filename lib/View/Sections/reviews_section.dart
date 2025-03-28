import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_main/View/Layout/layout_builder.dart';
import 'package:portfolio_main/View/Widgets/review_card.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Adam Smith',
      'position': 'CEO, ABC Inc.',
      'review':
          'Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text. Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text.',
      'image': 'Assets/Moiz Baloch 22.png',
    },
    {
      'name': 'Sarah Johnson',
      'position': 'Marketing Director',
      'review':
          'Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text. Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text.',
      'image': 'Assets/Moiz Baloch 33.png',
    },
    {
      'name': 'Michael Brown',
      'position': 'Project Manager',
      'review':
          'Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text. Lorem ipsum is simply dummy text in the printing and typesetting industry. Lorem ipsum has been the industry standard dummy text.',
      'image': 'Assets/Moiz Baloch 11.png',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutController(
      mobile: _buildMobileReviews(context),
      tablet: _buildTabletReviews(context),
      desktop: _buildDesktopReviews(context),
    );
  }

  Widget _buildDesktopReviews(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
      child: Column(
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 50),
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _reviews.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return ReviewCard(
                  name: _reviews[index]['name'],
                  position: _reviews[index]['position'],
                  review: _reviews[index]['review'],
                  imagePath: _reviews[index]['image'],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              const SizedBox(width: 20),
              Row(
                children: List.generate(
                  _reviews.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == _currentPage
                              ? Colors.black
                              : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_currentPage < _reviews.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabletReviews(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 40),
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _reviews.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return ReviewCard(
                  name: _reviews[index]['name'],
                  position: _reviews[index]['position'],
                  review: _reviews[index]['review'],
                  imagePath: _reviews[index]['image'],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              const SizedBox(width: 20),
              Row(
                children: List.generate(
                  _reviews.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == _currentPage
                              ? Colors.black
                              : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_currentPage < _reviews.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileReviews(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 30),
          SizedBox(
            height: 360,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _reviews.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return ReviewCard(
                  name: _reviews[index]['name'],
                  position: _reviews[index]['position'],
                  review: _reviews[index]['review'],
                  imagePath: _reviews[index]['image'],
                  isMobile: true,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 20),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              const SizedBox(width: 10),
              Row(
                children: List.generate(
                  _reviews.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == _currentPage
                              ? Colors.black
                              : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.arrow_forward, size: 20),
                onPressed: () {
                  if (_currentPage < _reviews.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      children: [
        Text(
          "Simply Excellent",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Client Reviews",
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

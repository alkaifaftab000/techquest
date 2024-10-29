import 'package:flutter/material.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/text/app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Enhanced Profile Header
            Container(
              height: 320,
              width: ss.width*.5,
              decoration: BoxDecoration(

                // gradient: LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [
                //     Colors.green[400]!,
                //     Colors.green[600]!,
                //   ],
                // ),
                borderRadius: BorderRadius.circular(60),

                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(5, 5),
                  ),
                ],
                // shape: BoxShape.circle
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Decorative circle behind avatar
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Main avatar
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(image:NetworkImage('https://i.zoomtventertainment.com/story/Pirates_of_the_Caribbean_6_Johnny_Depp_Captain_Jack_Sparrow.jpg'),fit: BoxFit.cover),
                            border: Border.all(color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Captain Jack',
                      style: AppText.appTextStyleBody(28, FontWeight.bold, Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 120,
                      alignment: Alignment.center,
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(

                        'Quiz Expert',

                        style: AppText.appTextStyleBody(14, FontWeight.bold, Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Enhanced Stats Cards
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildEnhancedStatCard(
                      'Total Quizzes',
                      '28',
                      Icons.quiz_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildEnhancedStatCard(
                      'Average Score',
                      '85%',
                      Icons.analytics_outlined,
                    ),
                  ),
                ],
              ),
            ),

            // Enhanced Profile Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.green[600],
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Profile Details',
                            style: AppText.appTextStyleBody(20, FontWeight.bold, Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildEnhancedDetailRow(Icons.email_outlined, 'Email', 'jack.sparrow@example.com'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1),
                      ),
                      _buildEnhancedDetailRow(Icons.phone_outlined, 'Phone', '+91 9234567890'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Divider(height: 1),
                      ),
                      _buildEnhancedDetailRow(Icons.location_on_outlined, 'Location', 'New Delhi, India'),
                    ],
                  ),
                ),
              ),
            ),

            // Enhanced Achievements
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.green[600],
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Achievements',
                            style: AppText.appTextStyleBody(20, FontWeight.bold, Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildEnhancedAchievementRow(
                        'Quiz Master',
                        'Completed 25+ quizzes',
                        Icons.emoji_events,
                        Colors.amber[700]!,
                      ),
                      const SizedBox(height: 16),
                      _buildEnhancedAchievementRow(
                        'Perfect Score',
                        'Achieved 100% in 5 quizzes',
                        Icons.star,
                        Colors.orange[700]!,
                      ),
                      const SizedBox(height: 16),
                      _buildEnhancedAchievementRow(
                        'Quick Learner',
                        'Completed 10 quizzes in a day',
                        Icons.speed,
                        Colors.green[700]!,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedStatCard(String title, String value, IconData icon) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                icon,
                size: 30,
                color: Colors.green[600],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: AppText.appTextStyleBody(26, FontWeight.bold, Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: AppText.appTextStyleBody(14, FontWeight.w500, Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnhancedDetailRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.green[600],
            size: 22,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppText.appTextStyleBody(14, FontWeight.w500, Colors.black54),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppText.appTextStyleBody(16, FontWeight.w600, Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEnhancedAchievementRow(String title, String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppText.appTextStyleBody(16, FontWeight.w600, Colors.black87),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppText.appTextStyleBody(14, FontWeight.w400, Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
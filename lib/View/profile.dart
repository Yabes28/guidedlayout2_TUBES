import 'package:flutter/material.dart';
// import 'package:guidedlayout2_1807/view/register.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  // final String username;
  // final String email;

  //ProfilePage({required this.username, required this.email});
  // final String Username;
  // final String Location;

  // ProfilePage({required this.usernameController, required this.location});
  // // const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with Gradient and Transparency
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // AppBar height
        child: AppBar(
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Color(0xFF8360c3).withOpacity(0.7), Color(0xFF2ebf91).withOpacity(0.7)], // Apply transparency with .withOpacity
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //     ),
          //   ),
          // ),
          backgroundColor: Color(0xFF8360c3), // Makes the AppBar background transparent
          elevation: 0, // Removes the AppBar shadow
          leading: Icon(Icons.arrow_back_ios, color: Colors.grey),
          actions: [Icon(Icons.more_horiz, color: Colors.grey)],
          centerTitle: true,
          title: Text('My Profile',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
      body: 
      Container(
        // Apply LinearGradient as background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8360c3), Color(0xFF2ebf91)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            
            // Profile Picture with Decorative Background
            Stack(
              alignment: Alignment.center,
              children: [
                // Decorative Background
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'),
                ),
              ],
            ),
            SizedBox(height: 10),
            
            // Name
            Text(
              'User',
              // formData['username'].text,
              // usernameController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            
            // Location
            Text(
              'User@gmail.com',
              // passwordController.text,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 20),
            
            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatWidget(icon: Icons.star, label: 'Badges', value: '0', iconColor: Colors.purple),
                  StatWidget(icon: Icons.access_time, label: 'Active Time', value: '0', iconColor: Colors.pink),
                  StatWidget(icon: Icons.favorite, label: 'Points', value: '0', iconColor: Colors.redAccent),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Settings and Bookmarks Buttons
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     children: [
            //       ProfileActionWidget(icon: Icons.settings, label: 'Settings'),
            //       ProfileActionWidget(icon: Icons.bookmark, label: 'Bookmarks'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Widget for Profile Stats (Badges, Active Time, Points)
class StatWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  StatWidget({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.1),
          radius: 25,
          child: Icon(icon, color: iconColor, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

// Widget for Settings and Bookmarks Buttons
class ProfileActionWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  ProfileActionWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(label),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
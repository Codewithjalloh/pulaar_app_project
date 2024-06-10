import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'login_screen.dart';
import 'home_page_screen.dart'; // Make sure you have this import

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  String? _profileImageUrl;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      _loadUserProfile();
    }
  }

  Future<void> _loadUserProfile() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    if (doc.exists) {
      final data = doc.data()!;
      _nameController.text = data['name'] ?? '';
      _dobController.text = data['dob'] ?? '';
      _bioController.text = data['bio'] ?? '';
      setState(() {
        _profileImageUrl = data['profileImageUrl'];
      });
    }
  }

  Future<void> _updateProfile() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, dynamic> data = {
        'name': _nameController.text,
        'dob': _dobController.text,
        'bio': _bioController.text,
        'profileImageUrl': _profileImageUrl,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .set(data, SetOptions(merge: true));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')));
      setState(() {
        _isEditing = false;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(user!.uid + '.jpg');
      await storageRef.putFile(imageFile);
      final String downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        _profileImageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      _showLoginPrompt(context);
      return Container(); // Empty container when user is not logged in
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isEditing ? _buildEditProfileForm() : _buildProfileView(),
      ),
    );
  }

  Widget _buildProfileView() {
    return ListView(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: _profileImageUrl != null
                ? NetworkImage(_profileImageUrl!)
                : AssetImage('assets/placeholder.png') as ImageProvider,
          ),
        ),
        SizedBox(height: 20),
        _buildProfileDetail('Name', _nameController.text),
        _buildProfileDetail('Date of Birth', _dobController.text),
        _buildProfileDetail('Bio', _bioController.text),
      ],
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditProfileForm() {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!)
                    : AssetImage('assets/placeholder.png') as ImageProvider,
                child: Icon(Icons.camera_alt,
                    size: 50, color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildTextField(
            controller: _nameController,
            label: 'Name',
            validator: (value) =>
                value!.isEmpty ? 'Please enter your name' : null,
          ),
          SizedBox(height: 20),
          _buildTextField(
            controller: _dobController,
            label: 'Date of Birth',
            validator: (value) =>
                value!.isEmpty ? 'Please enter your date of birth' : null,
          ),
          SizedBox(height: 20),
          _buildTextField(
            controller: _bioController,
            label: 'Bio',
            validator: (value) => value!.isEmpty ? 'Please enter a bio' : null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _updateProfile,
            child: Text('Update Profile'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: validator,
    );
  }

  void _showLoginPrompt(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Required'),
            content: Text('Please log in to access your profile.'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
              ),
              TextButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    });
  }
}

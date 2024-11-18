import 'package:flutter/material.dart';
import 'package:guidedlayout2_1748/View/login.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _gender = "Male"; // Default gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                const Text(
                  'Hey there,',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Form Container
                Container(
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB0E0E6), Color(0xFFE0BBE4)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Username Input
                        _buildInputField(
                          hint: "User",
                          icon: Icons.person,
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Email Input
                        _buildInputField(
                          hint: "Email",
                          icon: Icons.email,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Password Input
                        _buildInputField(
                          hint: "Password",
                          icon: Icons.lock,
                          controller: passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Weight Input with KG
                        Row(
                          children: [
                            Expanded(
                              child: _buildInputField(
                                hint: "Your Weight",
                                icon: Icons.monitor_weight,
                                controller: weightController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Weight cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            _buildUnitBox("KG", const Color(0xFFF06292)),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Height Input with CM
                        Row(
                          children: [
                            Expanded(
                              child: _buildInputField(
                                hint: "Your Height",
                                icon: Icons.height,
                                controller: heightController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Height cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            _buildUnitBox("CM", const Color(0xFFBA68C8)),
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Gender Selector
                        Row(
                          children: [
                            _buildGenderRadio("Male"),
                            const SizedBox(width: 10),
                            _buildGenderRadio("Female"),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Register Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Gather form data
                              Map<String, String> formData = {
                                'username': usernameController.text,
                                'email': emailController.text,
                                'password': passwordController.text,
                                'weight': weightController.text,
                                'height': heightController.text,
                                'gender': _gender,
                              };
                              // TODO: Navigasi ke halaman
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>  LoginView(data: formData),
                                  ),
                                  );
                              // TODO: Handle registration logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 120, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: const Color(0xFF6A5ACD),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Or Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 15),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to Login Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginView()),
                          );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF8A2BE2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for input fields
  Widget _buildInputField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Helper for unit boxes (KG, CM)
  Widget _buildUnitBox(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper for gender radio buttons
  Widget _buildGenderRadio(String gender) {
    return Row(
      children: [
        Radio<String>(
          value: gender,
          groupValue: _gender,
          onChanged: (String? value) {
            setState(() {
              _gender = value!;
            });
          },
        ),
        Text(gender),
      ],
    );
  }
}

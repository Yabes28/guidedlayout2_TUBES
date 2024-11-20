import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guidedlayout2_1748/Home/home.dart';
import 'package:guidedlayout2_1748/View/register.dart';
import 'package:guidedlayout2_1748/component/form_component.dart';

class LoginView extends StatefulWidget {
  final Map? data;
  const LoginView({super.key, this.data});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input data
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<dynamic, dynamic>? dataForm;

  @override
  void initState() {
    super.initState();
    // Data awal form jika ada (dikirim melalui parameter)
    dataForm = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background aplikasi
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header teks
                const Text(
                  'Hey there,',
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                // Container input form
                Container(
                  width: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB0C4DE), Color(0xFF87CEFA)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                    key: _formKey, // Menyimpan status form
                    child: Column(
                      children: [
                        // Input username
                        inputForm(
                          (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Username tidak boleh kosong";
                            }
                            return null;
                          },
                          controller: usernameController,
                          hintTxt: "User",
                          helperTxt: "",
                          iconData: Icons.person,
                        ),
                        // Input email
                        inputForm(
                          (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Email tidak boleh kosong";
                            }
                            return null;
                          },
                          controller: emailController,
                          hintTxt: "Email",
                          helperTxt: "",
                          iconData: Icons.email,
                        ),
                        // Input password
                        inputForm(
                          (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                          controller: passwordController,
                          hintTxt: "Password",
                          helperTxt: "",
                          iconData: Icons.lock,
                          password: true,
                        ),
                        // Link lupa password
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Tambahkan fungsi "Lupa Password"
                              debugPrint("Forgot Password Clicked");
                            },
                            child: const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Tombol Login
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF87CEFA),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    // Validasi form
                    if (_formKey.currentState!.validate()) {
                      if (dataForm != null &&
                          dataForm?['username'] == usernameController.text &&
                          dataForm?['password'] == passwordController.text) {
                        // TODO: Navigasi ke halaman Home jika berhasil login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomeView(),
                          ),
                        );
                      } else {
                        // TODO: Tampilkan dialog jika login gagal
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Login Gagal'),
                            content: const Text('Username atau password salah.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Garis pembatas dengan teks "Or"
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Or", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 10),

                // Tombol media sosial
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                      onPressed: () {
                        // TODO: Tambahkan login Google
                        debugPrint("Google Login Clicked");
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                      onPressed: () {
                        // TODO: Tambahkan login Facebook
                        debugPrint("Facebook Login Clicked");
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Link Register
                TextButton(
                  onPressed: () {
                    // TODO: Navigasi ke halaman Register
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterView()),
                    );
                  },
                  child: const Text(
                    "Don't have an account yet? Register",
                    style: TextStyle(
                      color: Color(0xFF8A2BE2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

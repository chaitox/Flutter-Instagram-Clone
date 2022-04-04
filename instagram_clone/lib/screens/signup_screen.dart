import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import 'package:instagram_clone/resourses/auth_Methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  @override
  @override
  void dispose() {
    _bioController.clear();
    _userNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 2,
            ),
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(height: 64),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/portrait-of-young-smiling-caucasian-man-with-crossed-arms-wearing-picture-id1171169107?k=20&m=1171169107&s=612x612&w=0&h=VkbOnU3zWYCbh3ojzqWFhK7JObxQduGzr4bRxqbgkLU='),
                ),
                Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.add_a_photo)))
              ],
            ),
            const SizedBox(height: 24),
            TextFiledInput(
                textEditingController: _userNameController,
                hintText: 'Usuario',
                textInputType: TextInputType.text),
            const SizedBox(height: 24),
            TextFiledInput(
                textEditingController: _emailController,
                hintText: 'Ingrese su correo',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            TextFiledInput(
                textEditingController: _passwordController,
                isPass: true,
                hintText: 'Ingrese su contraseña',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 24),
            TextFiledInput(
                textEditingController: _bioController,
                hintText: 'Ingrese su bio',
                textInputType: TextInputType.text),
            const SizedBox(height: 12),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().signUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userName: _userNameController.text,
                    bio: _bioController.text);
                print(res);
              },
              child: Container(
                child: const Text('Crear'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: blueColor),
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text('No cuentas con un usuario?'),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}

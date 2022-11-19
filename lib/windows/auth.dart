import 'package:flutter/material.dart';
import 'package:flutter_application_1/windows/home.dart';
import '../domain/users.dart';
import 'package:flutter_application_1/windows/landing.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 100, left: 20),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Вход',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    Widget _input(String hint, TextEditingController controller, bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(children: <Widget>[
              Text(
                hint,
                style: TextStyle(
                  color: Color.fromARGB(255, 94, 89, 89),
                  fontSize: 16,
                ),
              ),
              TextField(
                  controller: controller,
                  obscureText: obscure,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 143, 139, 139)),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 150, 0, 250)),
                    ),
                    /*hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 198, 56, 214)),
              hintText: hint,
              */
                    /*focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 82, 77, 77), width: 3)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(137, 128, 124, 124), width: 1)),*/
                    /*prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(
                    data: IconThemeData(color: Colors.white), child: icon),
              ),
              */
                  )),
            ])),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Color.fromARGB(255, 191, 123, 255),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 16),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        width: 327,
        height: 348,
        decoration: BoxDecoration(
            color: Colors.white,
            // И тут указываем размер скругления границ
            // В данном случае скругление со всех сторо одинаковое
            borderRadius: BorderRadius.circular(16),
            // Указываем информацию о самих границах
            border: Border.all(
              width: 1,
              color: Color.fromARGB(255, 143, 18, 18),
            )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input("EMAIL", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _input("Пароль", _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: _button(label, func),
                ))
          ],
        ),
      );
    }

    void _loginUser() {
      //_email = _emailController.text;
      //_password = _passwordController;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 100, 100),
      body: Column(
        children: <Widget>[
          
          _logo(),
          _form('Войти', _loginUser),
        ],
      ),
    );
  }
}

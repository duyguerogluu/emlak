/*
 *  This file is part of emlak.
 *
 *  emlak is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  emlak is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with emlak.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:emlak/functions/duygu_nav.dart';
import 'package:emlak/loginPage/signup_page.dart';
import 'package:emlak/riverpod/login_riverpod.dart';
import 'package:emlak/riverpod/riverpod_management.dart';
import 'package:emlak/screens/base_scafold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _pageLogin = true;
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      // login.telNo.text = "05554443311";
      // login.passwprd.text = "10";
    }
  }

  void _togglePage(bool _switchme) {
    setState(
      () {
        _pageLogin = _switchme;
      },
    );
  }

  bool _ishidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _ishidden = !_ishidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(loginRiverpod);

    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: watch.fetchLogin(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.hasError) {
              return const Center(
                child: Row(
                  children: [
                    Text('Yükleniyor...'),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: deviceHeight * 0.18,
                        child: Image.asset(
                          'assets/images/logorb.png',
                        ),
                      ),
                    ),
                    //buttonlarım
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Login button
                        ElevatedButton(
                          onPressed: () {
                            _togglePage(true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _pageLogin
                                ? Color.fromARGB(255, 22, 120, 13)
                                : Colors.transparent,
                            primary: Colors.transparent,
                            onPrimary: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Giriş',
                            style: TextStyle(
                              fontSize: 18,
                              color: _pageLogin
                                  ? Colors.white
                                  : Color.fromARGB(255, 217, 217, 217),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //register buttton
                        ElevatedButton(
                          onPressed: () {
                            _togglePage(false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _pageLogin
                                ? Colors.transparent
                                : Color.fromARGB(255, 12, 98, 22),
                            primary: Colors.transparent,
                            onPrimary: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(
                                fontSize: 18,
                                color: _pageLogin
                                    ? const Color.fromARGB(255, 217, 217, 217)
                                    : Colors.white),
                          ),
                        ),
                      ],
                    ),
                    _pageLogin
                        //login page im
                        ? Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      //Username gircem
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                          ),
                                        ),
                                        child: TextField(
                                          controller: watch.username,
                                          cursorColor: Colors.purpleAccent,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 12, 98, 22)),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Phone number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]),
                                          ),
                                        ),
                                      ),

                                      //password gircem
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: watch.password,
                                          cursorColor: Colors.purpleAccent,
                                          obscureText: _ishidden ? true : false,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 253, 210, 92)),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(_ishidden
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: _toggleVisibility,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      DuyguNav.push(BaseScaffold());
                                      // final res = await login.fetchLogin();
                                      // if (res == true) {
                                      //   // ignore: use_build_context_synchronously
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => BaseScaffold()),
                                      //   );
                                      // } else {
                                      //   // ignore: use_build_context_synchronously
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //       const SnackBar(
                                      //           content:
                                      //               Text("Giriş yapılamadı!")));
                                      // }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _pageLogin
                                          ? Color.fromARGB(255, 12, 98, 22)
                                          : Colors.transparent,
                                      primary: Colors.transparent,
                                      onPrimary: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Giriş Yap',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: _pageLogin
                                            ? Colors.white
                                            : Color.fromARGB(
                                                255, 217, 217, 217),
                                      ),
                                    ),
                                  ),
                                ),

                                //Şifremi Unuttum
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: InkWell(
                                    child: const Text(
                                      'Şifremi Unuttum',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 12, 98, 22),
                                        fontSize: 16,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SignupPage()
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

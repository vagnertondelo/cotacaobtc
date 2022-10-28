import 'package:cotacao_btc/app/utils/responsive_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  late Screen sizeCustom;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeCustom = Screen(MediaQuery.of(context).size);

    return PageView(children: <Widget>[
      Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: Form(
              key: _formKey,
              child: Stack(fit: StackFit.expand, children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/login-app.png",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child:
                    Column(
                      children: <Widget>[
                        SizedBox(
                          child: Image.asset(
                            "assets/images/logo-jiu-jitsu.png",
                            height: 300,
                            width: 300,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                        SizedBox(height: sizeCustom.getWidthPx(8)),
                        TextFormField(
                         // style: TextStyle(fontSize: 18, color: Colors.red),
                          controller: _emailController,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                            ),
                            hintText: "E-mail",
                            icon: Icon(Icons.email,color: Colors.grey),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // validator: (text) {
                          //   if (text.isEmpty || !text.contains("@"))
                          //     return "Email inválido";
                          // },
                        ),

                        SizedBox(height: sizeCustom.getWidthPx(50)),

                        TextFormField(
                          controller: _passController,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
                            ),
                            hintText: "Senha",
                            contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(32.0)),
                            icon: Icon(Icons.lock_outline,color: Colors.grey),
                          ),
                          obscureText: true,
                          // validator: (text) {
                          //   if (text.isEmpty || text.length < 6)
                          //     return "Senha inválida";
                          // },
                        ),
                        SizedBox(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushReplacement(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ForgotPassScreen()));
                                  },
                                  child: Text("Esqueci minha senha",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                          child: Column(
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Não possui conta faça seu cadastro!",
                                  style: TextStyle(
                                      color:
                                      Color.fromRGBO(140, 209, 27, 0.7),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: FlatButton(
                                  onPressed: () {
                                    // Navigator.of(context).pushReplacement(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             SignUpScreen()));
                                  },
                                  child: const Text(
                                    "REGISTRE-SE ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 0.0, 0.0, 0.0),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        SizedBox(
                          height: 44.0,
                          child: RaisedButton(
                            //color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),

                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              // if (_formKey.currentState.validate()) {
                              //   model.signIn(
                              //       email: _emailController.text,
                              //       pass: _passController.text,
                              //       onSuccess: _onSuccess(model.userData),
                              //       onFail: _onFail);
                              // }
                            },
                          ),
                        ),
                      ],
                    ))
              ])))
    ]);
  }
}

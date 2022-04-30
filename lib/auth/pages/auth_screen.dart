import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../const/color_styles.dart';
import '../../const/textStyles_const.dart';
import '../widgets/text_field_widget.dart';

class AuthScreen extends StatefulWidget {
  final intro;
  const AuthScreen({Key? key, this.intro}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final Box box = Hive.box('onBoarding');

  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
        child: Container(
          child: Stack(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/background_sign.png', width: MediaQuery.of(context).size.width,),
                  widget.intro == true ? Positioned(
                    top: 30,
                    left: 4,
                    child: GestureDetector(
                        child: Container(
                          child: Icon(Icons.keyboard_arrow_left, size: 56, color: ColorStyles.whiteColor,),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                        ),
                        onTap: (){
                          Navigator.pop(context);
                          // if (currentPage == 0) {
                          //   setState(() {
                          //     indexController?.move(1);
                          //   });
                          // } else if (currentPage == 1) {
                          //   setState(() {
                          //     indexController?.move(2);
                          //   });
                          // } else if (currentPage == 2) {
                          //   setState(() {
                          //     indexController?.move(3);
                          //   });
                          // }
                        }
                    ),
                  ) : Offstage(),
                  Positioned(
                    top: signUp ? 175 : 112,
                    // bottom: 125,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('SCI MED LINGUA', style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.whiteColor, fontSize: 36),),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: signUp ? 300 : 220,
                  child: Container(
                    decoration: new BoxDecoration(
                        color: ColorStyles.whiteColor, //new Color.fromRGBO(255, 0, 0, 0.0),
                        borderRadius: new BorderRadius.only(
                            topLeft:  const  Radius.circular(30.0),
                            topRight: const  Radius.circular(30.0))
                    ),
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32,),
                          signUp ? Text('SIGN IN' , style: TextStyles.blueMainRegularStyle.copyWith(fontSize: 24),) : Text('SIGN UP' , style: TextStyles.blueMainRegularStyle.copyWith(fontSize: 24),),
                          SizedBox(height: 37,),
                          TextFieldWidget(controller: login, placeholder: 'Enter email',),
                          SizedBox(height: 42,),
                          TextFieldWidget(controller: login, placeholder: 'Enter password', forgotPass: !signUp ? false : true, secret: true),
                          !signUp ? SizedBox(height: 42,) : Offstage(),
                          !signUp ? TextFieldWidget(controller: login, placeholder: 'Confirm password', forgotPass: false,secret: true,) : Offstage(),
                          SizedBox(height: 72,),
                          CupertinoButton(
                              padding: EdgeInsets.all(0),
                              borderRadius: BorderRadius.circular(72),
                              color: ColorStyles.blueMainColor,
                              onPressed: () {
                                // Navigator.pushNamed(context, LanguageRoute);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width - 56,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    child: Text(
                                        signUp ? 'SIGN IN' : 'SIGN UP',
                                            key: ValueKey<String>('buttonText'),
                                            style: TextStyles.blueMainSemiBoldStyle.copyWith(color: ColorStyles.whiteColor, fontSize: 18)
                                    ),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 16,),
                          Center(child: Text('or sign in with' , style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.greyColor),)),
                          SizedBox(height: 13,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 87),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset('assets/icons/facebook.svg')
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset('assets/icons/google.svg')
                                ),
                                GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset('assets/icons/apple.svg')
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 19,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(!signUp ? 'Have an account?  ' : 'Don’t have account?  ', style: TextStyles.blueMainRegularStyle.copyWith(fontSize: 20, color: ColorStyles.greyTextColor),),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    signUp = !signUp;
                                  });
                                },
                                  child: Text( signUp ? 'Sign Up' : 'Sign In', style: TextStyles.blueMainRegularStyle.copyWith(fontSize: 20, color: ColorStyles.lightBlueColor))
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}

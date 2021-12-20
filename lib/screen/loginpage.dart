import 'package:api_demo_project/color/colors.dart';
import 'package:api_demo_project/screen/homepage.dart';
import 'package:api_demo_project/service/apiservices.dart';
import 'package:api_demo_project/widget/customtextformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  ApiServices apiServices = ApiServices();
  TextEditingController userName = TextEditingController(text: "mor_2314");
  TextEditingController password = TextEditingController(text: "83r5^_");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              "Log In to Api Demo Project",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.sp,
                color: CustomColor.dartTextColor,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Text(
                  "Don't have a Account!",
                  style: TextStyle(
                      fontSize: 14.h, color: CustomColor.lightTextColor),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 14.h, color: CustomColor.purpleColor),
                    ))
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            CustomTextFormField(
              controller: userName,
              hintText: "Email",
            ),
            CustomTextFormField(
              controller: password,
              hintText: "Password",
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CustomColor.purpleColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14))),
                  onPressed: () async {
                    final getToken = await apiServices.userLogin(
                        userName.text, password.text);
                    if (getToken["token"] != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Sucess! your token is $getToken"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("There is some problem !!!!!!"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Log In",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.h),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

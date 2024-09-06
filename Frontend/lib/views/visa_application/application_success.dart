import 'package:GOSL/components/button.dart';
import 'package:GOSL/views/home.dart';
import 'package:GOSL/views/login/login.dart';
import 'package:flutter/material.dart';

class ApplicationSuccessPage extends StatelessWidget {
  const ApplicationSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: width * 0.8,
              child: Text(
                'Your details have been successfully submitted!',
                style: TextStyle(
                  fontSize:  width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height*0.02,),
            Icon(
              Icons.check_circle,
              color: Theme.of(context).colorScheme.primary,
              size: 100,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: width * 0.8,
              child: Text(
                'Our people are still processing your application. You can hear back from us within 48 hours',
                style: TextStyle(
                  fontSize:  width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height*0.04,),
            AppButton(text: 'Home Page',onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ))
            })
          ],
        ),
      ),
    );
  }
}

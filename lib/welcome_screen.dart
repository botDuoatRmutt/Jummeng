import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/home_3.jpg'),
        fit: BoxFit.cover,
        opacity: 0.7, 
        )
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'จุ๊มเหม่งพาทัวร์',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),

                SizedBox(height: 12),
                Text(
                  'กรุงเทพมหานคร\nเป็นจังหวัดที่มีวัดสวยมากมายหลายแห่ง\nซึ่งวัดสำคัญๆส่วนใหญ่จะตั้งอยู่ที่กรุงเทพ\nเพราะฉะนั้น คนรักการถ่ายรูปสถาปัตยกรรมสวยๆ หรือเที่ยวชิลในกรุงเทพฉบับสายบุญ\nต้องนี่เลย กับ 9 วัดสวยในกรุงเทพ\nตามลิสต์นี้เลย',
                  style: TextStyle(
                    color: Colors.white10.withOpacity(0.7),
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/tabbar');
                  },
                  child: Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ) 
        ),
      ),
    );
  }
}
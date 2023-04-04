import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jummeng/temple_page.dart';
import 'package:jummeng/templedatamodel.dart';

class HomeScreen extends StatelessWidget {

    var category = [
    '9 วัดดังจังหวัดกรุงเทพมหานคร',
  ];

  static List tpic = [
    'images/image_1.jpg',
    'images/image_2.jpg',
    'images/image_3.jpg',
    'images/image_4.jpg',
    'images/image_5.jpg',
    'images/image_6.jpg',
    'images/image_7.jpg',
    'images/image_8.jpg',
    'images/image_9.jpg',
  ];

  static List<String> tname = [
    'วัดพระแก้ว',
    'วัดแจ้ง',
    'วัดโพธิ์',
    'วัดสระเกศ',
    'วัดราชบพิธ',
    'วัดบวช',
    'วัดราชนัดดาราม',
    'วัดเบญ',
    'วัดยานนาวา',
  ];

  static List<String> templename = [
    'วัดพระศรีรัตนศาสดาราม\n(วัดพระแก้ว)',
    'วัดอรุณราชวรารามราชวรมหา\nวิหาร (วัดแจ้ง)',
    'วัดพระเชตุพนวิมลมังคลาราม\n(วัดโพธิ์)',
    'วัดสระเกศราชวรมหาวิหาร\n(ภูเขาทอง)',
    'วัดราชบพิธสถิตมหาสีมาราม\nราชวรวิหาร',
    'วัดบวรนิเวศราชวรวิหาร\n(วัดใหม่)',
    'วัด​ราชนัดดารามวรวิหาร​\n(โลหะปราสาท)',
    'วัดเบญจมบพิตรดุสิตวนาราม\nราชวรวิหาร (วัดไทรทอง)',
    'วัดยานนาวา พระอารามหลวง\n(วัดคอกควาย)',
  ];

  static List<String> des = [
'วัดพระศรีรัตนศาสดาราม หรือที่เรียกกันทั่วไปว่า วัดพระแก้ว เป็นวัดที่พระบาทสมเด็จพระพุทธยอดฟ้าจุฬาโลกมหาราชโปรดเกล้าฯ ให้สร้างขึ้นพร้อมกับการสถาปนากรุงรัตนโกสินทร์ พ.ศ. 2325 เป็นวัดในพระบรมมหาราชวังเช่นเดียวกับวัดพระศรีสรรเพชญ์ ซึ่งเป็นวัดในพระราชวังหลวงในสมัยอยุธยา และมีพระราชประสงค์ให้วัดพระศรีรัตนศาสดารามเป็นที่ประดิษฐาน พระพุทธมหามณีรัตนปฏิมากร และเป็นสถานที่ทรงบำเพ็ญพระราชกุศล วัดพระศรีรัตนศาสดารามเป็นวัดที่ไม่มีพระสงฆ์จำพรรษาอยู่ เพราะมีแต่ส่วนพุทธาวาสไม่มีส่วนสังฆาวาส',
'วัดอรุณราชวราราม หรือที่นิยมเรียกกันในภาษาพูดว่า วัดแจ้ง หรือที่เรียกสั้น ๆ ว่า วัดอรุณ เป็นวัดโบราณ สร้างในสมัยอยุธยา ที่ชื่อวัดแจ้ง เพราะ พระเจ้าตากฯ ทำศึกเสร็จ แล้วยกทัพกลับมาเป็นเวลาเช้าพอดี ว่ากันว่าเดิมเรียกว่า วัดมะกอก และกลายเป็นวัดมะกอกนอกในเวลาต่อมา เพราะได้มีการสร้างวัดขึ้นอีกวัดหนึ่งในตำบลเดียวกัน แต่อยู่ในคลองบางกอกใหญ่ ชาวบ้านเรียกวัดที่สร้างใหม่ว่า วัดมะกอกใน (วัดนวลนรดิศ) แล้วจึงเรียกวัดมะกอกซึ่งอยู่ปากคลองบางกอกใหญ่ว่า วัดมะกอกนอก ส่วนเหตุที่มีการเปลี่ยนชื่อเป็นวัดแจ้งนั้น เชื่อกันว่า เมื่อสมเด็จพระเจ้ากรุงธนบุรีทรงตั้งราชธานีที่กรุงธนบุรีใน พ.ศ. 2310 ได้เสด็จมาถึงหน้าวัดนี้ตอนรุ่งแจ้ง จึงพระราชทานชื่อใหม่ว่าวัดแจ้ง แต่ความเชื่อนี้ไม่ถูกต้อง เพราะเพลงยาวหม่อมภิมเสน วรรณกรรมสมัยอยุธยาที่บรรยายการเดินทางจากอยุธยาไปยังเพชรบุรี ได้ระบุชื่อวัดนี้ไว้ว่าชื่อวัดแจ้งตั้งแต่เวลานั้นแล้ว',
'วัดพระเชตุพนวิมลมังคลาราม (คำอ่าน: [วัด-พฺระ-เชด-ตุ-พน-วิ-มน-มัง-คะ-ลา-ราม] หรือ [วัด-พฺระ-เชด-ตุ-พน-วิ-มน-มัง-คฺลา-ราม]) โดยทั่วไปเรียก วัดโพธิ์ เป็นพระอารามหลวงชั้นเอก ชนิดราชวรมหาวิหาร และเป็นวัดประจำรัชกาลพระบาทสมเด็จพระพุทธยอดฟ้าจุฬาโลกมหาราช ทั้งยังเปรียบเสมือนเป็นมหาวิทยาลัยแห่งแรกของประเทศด้วย เนื่องจากเป็นที่รวมจารึกสรรพวิชาหลายแขนง และทางยูเนสโกได้ขึ้นทะเบียนเป็นมรดกความทรงจำโลกของภูมิภาคเอเชียแปซิฟิก เมื่อ มีนาคม พ.ศ. 2551 และวันที่ 16 มิถุนายน พ.ศ. 2554 ทางยูเนสโก ได้ขึ้นทะเบียนจารึกวัดโพธิ์จำนวน 1,440 ชิ้น เป็นมรดกความทรงจำโลกในทะเบียนนานาชาติ',
'วัดสระเกศ เป็นพระอารามหลวงชั้นโท ชนิดราชวรมหาวิหาร ตั้งอยู่ริมคลองมหานาค เขตป้อมปราบศัตรูพ่าย มีจุดเด่นคือ พระบรมบรรพตหรือ ภูเขาทอง เป็นเจดีย์บนภูเขาจำลองตั้งอยู่ในวัดสระเกศราชวรมหาวิหาร',
'วัดราชบพิธสถิตมหาสีมาราม เป็นพระอารามหลวงชั้นเอก ชนิดราชวรวิหาร ที่พระบาทสมเด็จพระจุลจอมเกล้าเจ้าอยู่หัวโปรดเกล้าฯ ให้สร้างขึ้นเป็นวัดประจำรัชกาลเมื่อ พ.ศ. 2412 มีลักษณะผสมระหว่างสถาปัตยกรรมไทยกับสถาปัตยกรรมตะวันตก คือ ลักษณะภายนอกเป็นสถาปัตยกรรมไทย ส่วนภายในออกแบบตกแต่งอย่างตะวันตก และทรงพระกรุณาโปรดเกล้าฯ พระราชทานนามว่าวัดราชบพิธสถิตมหาสีมาราม หมายถึง วัดที่พระมหากษัตริย์ทรงสร้าง และมีมหาสีมาอันเป็นเสาศิลาจำหลักยอดเป็นรูปเสมาธรรมจักร 8 เสา ตั้งเป็นสีมาที่กำแพง 8 ทิศ “ราชบพิธ”',
'วัดบวรนิเวศวิหาร (เดิมชื่อว่า วัดใหม่) เป็นพระอารามหลวงชั้นเอก ชนิดราชวรวิหาร ตั้งอยู่ริมถนนบวรนิเวศและถนนพระสุเมรุ แขวงบวรนิเวศ เขตพระนคร กรุงเทพมหานคร สถาปนาขึ้นโดยสมเด็จพระบวรราชเจ้ามหาศักดิพลเสพ กรมพระราชวังบวรสถานมงคลในรัชกาลที่ 3 พระประธานในพระอารามนี้มีความแตกต่างจากวัดอื่น ๆ โดยทั่วไป คือ มีพระประธาน 2 องค์ และล้วนมีความสำคัญเนื่องจากเป็นพระพุทธรูปเก่าแก่โบราณ ได้แก่ พระพุทธชินสีห์ พระสุวรรณเขต หรือ "พระโต" หรือ หลวงพ่อเพชร',
'วัดราชนัดดารามวรวิหาร หรือ "วัดราชนัดดา" ตั้งอยู่ใกล้กับป้อมมหากาฬ ติดกับลานพลับพลามหาเจษฎาบดินทร์ ซึ่งเป็นพลับพลารับแขกเมือง เชิงสะพานผ่านฟ้าลีลาศ ใกล้กับวัดเทพธิดาราม ขึ้นทะเบียนโบราณสถานเมื่อวันที่ 22 พฤศจิกายน พ.ศ. 2492 ภายในวัดมี โลหะปราสาท ซึ่งเป็นโลหะปราสาทแห่งเดียวในประเทศไทยและแห่งเดียวในโลก',
'วัดเบญจมบพิตรดุสิตวนาราม เป็นพระอารามหลวงชั้นเอก ชนิดราชวรวิหาร ไม่ปรากฏหลักฐานว่าสร้างขึ้นเมื่อใด เดิมชื่อ วัดแหลม หรือ วัดไทรทอง ภายหลังได้รับพระราชทานนามจากพระบาทสมเด็จพระจอมเกล้าเจ้าอยู่หัวใหม่ว่า วัดเบญจบพิตร ซึ่งหมายถึง วัดของเจ้านาย 5 พระองค์ที่ทรงร่วมกันปฏิสังขรณ์วัดแห่งนี้ เมื่อพระบาทสมเด็จพระจุลจอมเกล้าเจ้าอยู่หัวทรงสร้างสวนดุสิตขึ้น พระองค์ทรงทำผาติกรรมสถาปนาวัดขึ้นใหม่และพระราชทานามว่า วัดเบญจมบพิตรดุสิตวนาราม อันหมายถึง วัดของพระเจ้าแผ่นดินรัชกาลที่ ๕',
'วัดยานนาวา ตั้งอยู่ริมแม่น้ำเจ้าพระยา ติดถนนเจริญกรุง แขวงยานนาวา เขตสาทร กรุงเทพมหานคร เป็นวัดโบราณมีมาตั้งแต่ครั้งกรุงศรีอยุธยา เดิมชื่อ "วัดคอกควาย" เนื่องจากมีชาวทวายมาลงหลักปักฐานอาศัยอยู่เป็นจำนวนมาก และชาวทวายจะนำกระบือที่เลี้ยงไว้มาทำการซื้อขายแลกเปลี่ยนกัน หมู่บ้านบริเวณนั้นจึงได้ชื่อเรียกกันต่อมาว่า "บ้านคอกควาย" ต่อมารัชกาลที่ 3 ทรงพระกรุณาโปรดเกล้าฯ ให้ปฏิสังขรณ์และสร้างเรือสำเภาพระเจดีย์แทนพระสถูปเจดีย์ทั่วไป เพื่อให้คนรุ่นหลังได้เห็นรูปแบบเรือสำเภาซึ่งกำลังจะหมดไปจากเมืองไทย จึงได้เปลี่ยนชื่อจากวัดคอกกระบือเป็น "วัดยานนาวา"',
  ];


  List<TempleDataModel> TempleData = List.generate(
    tname.length, 
       (index) 
    => TempleDataModel('${tpic[index]}', '${templename[index]}', '${des[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.lightBlueAccent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: HomeAppBar(),
        ), 
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                      height: 200,
                      child: 
                      ListView.builder(
                        itemCount: TempleData.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                          itemBuilder: (BuildContext context,int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TempleDetail(templeDataModel: TempleData[index],)));                    
                          },
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(TempleData[index].tpic),
                                fit: BoxFit.cover,
                                opacity: 0.7,
                                ),
                            ),
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    tname[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )),
                  ],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          category[0], 
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                        ),),
                      ),
                      ],
                    ),
                    ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: TempleData.length,
                  shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TempleDetail(templeDataModel: TempleData[index],)));
                          },
                          child: 
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(TempleData[index].tpic),
                                fit: BoxFit.cover,
                                opacity: 0.8,
                                ),
                          ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [ 
                                Text(
                                  templename[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  );
                }),
              ],
              ),
            ),
          ),
        ),
    );
  }

}





class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/welcome');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.temple_buddhist_rounded,
                size: 28,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.orangeAccent,
              ),
              Text(
                'กรุงเทพมหานคร',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          InkWell(
            onTap:() {
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.output_rounded,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
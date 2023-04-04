import 'package:flutter/material.dart';
import 'package:jummeng/templedatamodel.dart';


class TempleDetail extends StatelessWidget {
  final TempleDataModel templeDataModel;

  const TempleDetail({Key? key, required this.templeDataModel}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(templeDataModel.tpic),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(), 
        ),
        bottomNavigationBar: 
          PostBottomBar(
            name: templeDataModel.templename,
            des: templeDataModel.des),
      ),
    );

  }
}


class PostAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, '/tabbar');
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(Icons.arrow_back, size: 28),
            ),
          ),
        ],),
    );
  }

}


class PostBottomBar extends StatelessWidget {
    PostBottomBar({
    super.key, 
    required this.name, 
    required this.des, 
  });

  final String name, des;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color(0xFFEDF2F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context,int index) {
          return InkWell(
            onTap: (){},
        child: Column(
         children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                    
                    '$des',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/image_8.jpg',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 90,      
                          ),
                        ), 
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/image_7.jpg',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 90,      
                          ),
                        ), 
                      ),
                    ),
                    Expanded(
                      child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 90,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('images/image_9.jpg'),
                          fit: BoxFit.cover,
                          opacity: 0.4, 
                        ),
                      ),
                      child: Text(
                        '10+',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          )
        ]
        ),
    );
    }),
    );
  }
}

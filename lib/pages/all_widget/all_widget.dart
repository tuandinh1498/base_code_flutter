import 'package:dio_cache_flutter_test/core/configs/sizes.dart';
import 'package:flutter/material.dart';

class AllWidget extends StatefulWidget {
  const AllWidget({Key? key}) : super(key: key);

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {
  int index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'My Cart',
        style: TextStyle(fontSize: SizeConfig.displaySizeByWidth(context, 16)),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.displaySizeByHeight(context, 104),
              width: SizeConfig.displayWidth(context),
              padding:
                  EdgeInsets.all(SizeConfig.displaySizeByWidth(context, 5)),
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.displaySizeByHeight(context, 85),
                    width: SizeConfig.displaySizeByWidth(context, 87),
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                  Column(
                    children: [],
                  )
                ],
              ),
            ),

            ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 45),
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 10),
                                        blurRadius: 10),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "widget.title",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "widget.descriptions",
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "widget.text",
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 8,
                                right: 8,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 45,
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(45)),
                                      child: Icon(Icons.snapchat)),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text('click me')),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,currentIndex){
                return  InputChip(
                  onPressed: (){
                    setState(() {
                      index=currentIndex;
                    });

                  },

                  label: Text("this is chip"),
                  elevation: 3,
                  backgroundColor:index==currentIndex?Colors.cyan:Colors.white,

                );
              }),
            )

          ],
        ),
      ),
    );
  }
}

import 'package:horizon_time/home.dart';
import 'package:horizon_time/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gnav.dart';

var recentText = [];

var recentSearch = TextEditingController();

void add(str){
  recentText.add(str);
}



class search extends StatefulWidget{
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: InkWell(
                onTap: (){
                   varindex = 0 ;
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              title: TextField(
                controller: recentSearch,
                style: TextStyle(
                  fontSize: 22
                ),
                cursorColor: Colors.blueAccent[700],
                decoration: InputDecoration(
                  hintText: "Search on Wrist Wears",
                  hintStyle: TextStyle(
                    fontSize: 22
                  )
                ),
              ),
              trailing: InkWell(
                onTap: (){

                  add(recentSearch.text.toString());
                  setState(() {

                  });

                },
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: SizedBox(
                width: 23,
              ),
              title: Text(
                "Recent",
                style: TextStyle(
                  decoration: TextDecoration.underline,decorationColor: Colors.blueAccent[700],
                  color: Colors.blueAccent[700],
                  fontSize: 22
                ),

              ),

            ),
            Container(
              width: double.infinity,
              height: recentText.length * 60,
              child: ListView.builder(
                reverse: true,
                  itemCount: recentText.length,
                  itemBuilder: (contex,index){
                return ListTile(
                  leading: SizedBox(
                    width: 23,
                  ),
                  title: text(text: recentText[index], size: 20, color: Colors.grey.shade600),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: recentText.length>0,
              child: ListTile(
                leading: SizedBox(
                  width: 23,
                ),
                title: InkWell(
                  onTap: (){

                    recentText.clear();
                    setState(() {

                    });

                  },
                  child: text(text: "CLEAR RECENT SEARCHES", size: 22, color: Colors.blueAccent.shade700),
                ),
              ),
            ),
            Visibility(
                visible: recentText.length==0,
                child: Container(
              width: double.infinity,
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.search,
                    size: 90,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  text(text:"Search on Wrist Wears", size: 23,),
                  SizedBox(
                    height: 10,
                  ),
                  text(text: "Seach your next favorite things",size: 20,color: Colors.grey.shade600)
                ],
              ),
            ))

          ],
        ),
      ),
    );
  }
}
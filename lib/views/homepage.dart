import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_read/main.dart';
import 'package:intl/intl.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .55,
                    child: Image.asset(
                      'assets/cover.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height * .25,
              )
            ];
          },
          body: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //   print(snapshot.data);
                var mydata = json.decode(snapshot.data);
                return Container(
                  height: MediaQuery.of(context).size.height * .75,
                  child: ListView.builder(
                    itemCount: mydata.length,
                    itemBuilder: (BuildContext context, int index) {

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      color: Colors.red,
                                      child: Center(
                                          child: Text(
                                            mydata[index]["year"].toString(),
                                            style: TextStyle(
                                                fontSize: 25, color: Colors.white),
                                          ))),
                                  ListTile(
                                    leading: images('assets/preview.png'),
                                    title: Center(
                                        child: Text(
                                          '﻿Population',
                                          textScaleFactor: 1.5,
                                        )),
                                    subtitle: Center(
                                        child: Text(NumberFormat.compact()
                                            .format(mydata[index]["﻿Population"]))),
                                  ),
                                  ListTile(
                                    leading: images('assets/yearlychangee.png'),
                                    title: Center(
                                        child: Text(
                                          'Yearly Change',
                                          textScaleFactor: 1.5,
                                        )),
                                    subtitle: Center(
                                        child: Text(
                                          NumberFormat.compact()
                                              .format(mydata[index]["YearlyChange"]),
                                        )),
                                  ),

                                  ListTile(
                                    leading: images('assets/medianage.png'),
                                    title: Center(
                                        child: Text(
                                          'Median Age',
                                          textScaleFactor: 1.5,
                                        )),
                                    subtitle: Center(
                                        child: Text(
                                            mydata[index]["MedianAge"].toString())),
                                  ),
                                  ListTile(
                                    leading: images('assets/rank.png'),
                                    title: Center(
                                        child: Text(
                                          'Rank',
                                          textScaleFactor: 1.5,
                                        )),
                                    subtitle: Center(
                                        child: Text(mydata[index]["LibyaGRank"]
                                            .toString())),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                );
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),
        );
  }

  Widget images(String path) {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset(
        path,
        fit: BoxFit.fill,
      ),
    );
  }
}

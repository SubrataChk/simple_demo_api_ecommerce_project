// ignore: unused_import
import 'package:api_demo_project/screen/cartSection.dart';
import 'package:api_demo_project/screen/category.dart';
import 'package:api_demo_project/screen/productdetails.dart';
import 'package:api_demo_project/service/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartSection()));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => CategoryBottomSheet());
              },
              icon: Icon(
                Icons.list,
                size: 40,
                color: Colors.black,
              ))
        ],
        title: Text(
          "Home Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: apiServices.getAllProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.redAccent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  id: snapshot.data[index]["id"])));
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: ListTile(
                          title: Text(snapshot.data[index]["title"]),
                          leading: Image.network(
                            snapshot.data[index]["image"],
                            height: 50.h,
                            width: 60.w,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pirce: \$" +
                                    snapshot.data[index]["price"].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rating: " +
                                        snapshot.data[index]["rating"]["rate"]
                                            .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 30,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}

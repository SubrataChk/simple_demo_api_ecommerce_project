import 'package:api_demo_project/screen/productdetails.dart';
import 'package:api_demo_project/service/apiservices.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CategoryListProduct extends StatelessWidget {
  final String catName;

  CategoryListProduct({required this.catName});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black, size: 40),
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text(
            catName.toUpperCase(),
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: apiServices.categoryListProduct(catName),
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
                backgroundColor: Colors.redAccent,
              ),
            );
          },
        ));
  }
}

import 'package:api_demo_project/service/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartSection extends StatelessWidget {
  const CartSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: apiServices.cartAdd(1),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List product = snapshot.data["products"];
              return ListView.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: apiServices
                            .getSingleProduct(product[index]["productId"]),
                        builder: (context, AsyncSnapshot asyncSnapshot) {
                          if (asyncSnapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                elevation: 10,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: ListTile(
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.delete,
                                          size: 35,
                                          color: Colors.red,
                                        )),
                                    subtitle: Text(
                                      "Quantity: " +
                                          product[index]["quantity"].toString(),
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    title: Text(
                                      asyncSnapshot.data["title"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                    leading: Image.network(
                                        asyncSnapshot.data["image"]),
                                  ),
                                ),
                              ),
                            );
                          }
                          return Center(
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.amberAccent,
                            ),
                          );
                        });
                  });
            }
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
            ));
          }),
      bottomNavigationBar: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff30475E),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Center(
          child: Text(
            "Order Now",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:api_demo_project/service/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  ProductDetails({required this.id});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 60),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: apiServices.getSingleProduct(widget.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      snapshot.data["image"],
                      height: 150.h,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        "\$" + snapshot.data["price"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      snapshot.data["title"],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Chip(
                      label: Text(
                        snapshot.data["category"].toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Colors.amberAccent,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      snapshot.data["description"],
                      style: TextStyle(fontSize: 19.sp, color: Colors.blueGrey),
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff370665),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {},
        child: Icon(
          Icons.shopping_bag,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}

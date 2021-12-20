import 'package:api_demo_project/screen/categoryListProduct.dart';
import 'package:api_demo_project/service/apiservices.dart';
import 'package:flutter/material.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: FutureBuilder(
          future: apiServices.categoryList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoryListProduct(
                                    catName: snapshot.data[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Card(
                          color: Color(0xff30475E).withOpacity(0.9),
                          margin: EdgeInsets.all(10),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(35),
                            child: Center(
                              child: Text(
                                snapshot.data[index].toString().toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

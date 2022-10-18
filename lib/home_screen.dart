
import 'package:apiecomers/ecomers.dart';
import 'package:apiecomers/provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder<List>(
            future:
            Provider.of<HomeProvider>(context, listen: false).apicalling(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
              {
                return Text("${snapshot.hasError}");
              }
              else if (snapshot.hasData)
              {
                List list = snapshot.data!;
                return GridView.builder(
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: list.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Provider.of<HomeProvider>(context,listen: false).AlldataList=Ecomers(
                            id: list[index].id,image: list[index].image,title: list[index].title,rating: list[index].rating,price: list[index].price,description: list[index].description,category: list[index].category
                          );
                          Navigator.pushNamed(context, 'sd');
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 100,width: 100,
                                    child:Image.network(
                                      "${list[index].image}",height: 100,width: 100,)),
                                Text("${list[index].category}"),
                                Text("${list[index].price}") ,
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

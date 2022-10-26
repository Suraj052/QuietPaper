import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:quietpaper/provider/cat_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState()
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CatProvider>(context,listen: false).getProvider();
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    final provider = Provider.of<CatProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        leading: Icon(Icons.pets,color: HexColor("#FFB92D"),size: 27),
        title: Center(child: Text("Find your next Cat",style:
        TextStyle(fontSize: 18,color: HexColor("#25262d"),fontFamily: 'ProductSans',fontWeight: FontWeight.bold))),
        actions: [
          IconButton(
              onPressed: ()=> provider.getProvider(),
              icon: Icon(Icons.refresh_sharp,color: HexColor("#FFB92D"),size: 27,)
          )
        ],
      ),
      body:Consumer<CatProvider>(
        builder: (context,value,child){
          if(value.isLoading)
            {
              return const Center(child: CircularProgressIndicator(color: Colors.orange));
            }

          final data = value.catmodels;
          return ListView.builder(
            itemCount: data.length,
              itemBuilder: (context,index)
              {
                final display = data[index];
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.all(8.0),
                        height: size.height*0.50,
                        width: size.width*0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black,width: 8),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(display.url),
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    Container(
                        height: size.height*0.10,
                        width: size.width*0.95,
                        decoration: BoxDecoration(
                            color: HexColor("#FFB92D"),
                            borderRadius: BorderRadius.all(Radius.circular(8.0),
                        ),
                    ),
                    child : Padding(
                      padding: const EdgeInsets.fromLTRB(30, 12, 30, 5),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text('Height',style:
                                TextStyle(fontFamily: 'ProductSans',fontSize: 15,color: HexColor("#FFFFFF"))),
                                SizedBox(height: 7),
                                Text(display.height.toString(),style:
                                TextStyle(color: HexColor("#25262d"),fontFamily: 'ProductSans',fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          VerticalDivider(thickness: 1.5,indent: 10,endIndent: 14),
                          Container(
                            child: Column(
                              children: [
                                Text('Id',style:
                                TextStyle(fontFamily: 'ProductSans',fontSize: 15,color: HexColor("#FFFFFF"))),
                                SizedBox(height: 7),
                                Text(display.id,style:
                                TextStyle(color: HexColor("#25262d"),fontFamily: 'ProductSans',fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          VerticalDivider(thickness: 1.5,indent: 10,endIndent: 14),
                          Container(
                            child: Column(
                              children: [
                                Text('Width',style:
                                TextStyle(fontFamily: 'ProductSans',fontSize: 15,color: HexColor("#FFFFFF"))),
                                SizedBox(height: 7),
                                Text(display.width.toString(),style:
                                TextStyle(color: HexColor("#25262d"),fontFamily: 'ProductSans',fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "There are few things in life more heartwarming than to be welcomed by a cat",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'ProductSans',fontSize: 15,color: HexColor("#25262d")),
                      ),
                    )
                  ],
                );
              }
          );
        },
      )

    );
  }
}

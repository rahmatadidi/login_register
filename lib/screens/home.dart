import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            title: const Text(
              "LARA STORE",
            ),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: const TextField(
                        decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Looking For Shoes",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

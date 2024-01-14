import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery App'),
        backgroundColor: Colors.blue,
      ),
      body: RestaurantList(),
      drawer: Drawer(
        elevation: 8.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('Srinivas'), accountEmail: Text('srinivas@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('Profile'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('XY'),
                )
              ],
            ),
            ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.house_rounded),
            ),
            Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_bag_outlined),
            ),
            Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text('Offers'),
              leading: Icon(Icons.local_offer_outlined),
            ),
            Divider(
              height: 1.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar_rounded),
            label: 'Dining',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Money',
          ),
        ],
        onTap: (int index){
          print(index.toString());
        },
      ),
    );
  }
}

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return RestaurantCard(
          name: 'Restaurant ${index + 1}',
          cuisine: 'Cuisine Type',
          imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.K5oPANhOIUj8GshR-XzztAHaD5&pid=Api&P=0&h=160',
          onTap: () {
            // Navigate to the restaurant details screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailsScreen(),
              ),
            );
          },
        );
      },
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String cuisine;
  final String imageUrl;
  final VoidCallback onTap;

  RestaurantCard({
    required this.name,
    required this.cuisine,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    cuisine,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Types of cuisine'),
      ),
    );
  }
}

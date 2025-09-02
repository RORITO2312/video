// Necesitarás crear un archivo data.dart y los modelos correspondientes,
// o puedes copiar la data de prueba directamente aquí para simplificar.
// Para este ejemplo, la data estará implícita en la construcción de los widgets.

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Aquí irían los datos, pero los crearemos directamente en los constructores.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cart (5)', // Dato de ejemplo
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildSearchBar(),
          _buildRecentOrders(),
          _buildNearbyRestaurants(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0.8,
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: 'Search Food or Restaurants',
          prefixIcon: Icon(Icons.search, size: 30.0),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildRecentOrders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: 5, // 5 órdenes de ejemplo
            itemBuilder: (BuildContext context, int index) {
              return _buildRecentOrderItem(); // Reutilizamos un widget de ejemplo
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentOrderItem() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: NetworkImage('https://via.placeholder.com/150'), // Placeholder
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Burger', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4.0),
                        Text('Restaurant Name', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4.0),
                        Text('Nov 10, 2023', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyRestaurants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        _buildRestaurantItem(),
        _buildRestaurantItem(),
        _buildRestaurantItem(),
      ],
    );
  }

  Widget _buildRestaurantItem() {
    return InkWell(
        onTap: () {},
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200]!),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 150.0,
                width: 150.0,
                image: NetworkImage('https://via.placeholder.com/150'), // Placeholder
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Restaurant Name', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.0),
                  Text('Rating: 4.5', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4.0),
                  Text('0.2 miles away', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
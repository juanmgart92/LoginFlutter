import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Windows Shopper"),
        actions: [
          IconButton(
              onPressed: () => closeSession(),
              icon: Icon(Icons.exit_to_app, color: Colors.white))
        ],
        centerTitle: true,
        backgroundColor: Colors.red[400],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Marines"),
              accountEmail: Text("marines@cod.org"),
              decoration: BoxDecoration(color: Colors.red[400]),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Bienvenido"),
      ),
    );
  }

  closeSession() {}
}

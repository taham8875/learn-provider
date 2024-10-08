import 'package:flutter/material.dart';
import 'package:project_1/home/counter/counter_page.dart';
import 'package:project_1/home/settings/settings_page.dart';
import 'package:project_1/home/user/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text(
        'Learning Provider',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _getBody() {
    return TabBarView(
      controller: _tabController,
      children: const [
        UserPage(),
        SettingsPage(),
        CounterPage(),
      ],
    );
  }

  Widget _getBottomNavigationBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          icon: Icon(Icons.home),
          text: 'Home',
        ),
        Tab(
          icon: Icon(Icons.settings),
          text: 'Settings',
        ),
        Tab(
          icon: Icon(Icons.numbers),
          text: 'Counter',
        ),
      ],
    );
  }
}

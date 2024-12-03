import 'package:flutter/material.dart';
import 'package:home/screens/home.dart';
import 'package:me/me.dart';

/// 底部导航栏
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late final PageController _controller = PageController(initialPage: 0);

  final List<Widget> _screens = [const HomeIndexScreen(), const MeIndexScreen()];

  void _onTap(int index) {
    _controller.jumpToPage(index);
  }

  void _onPageChange(int index) {
    if (index != _selectedIndex) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _screens.length,
        itemBuilder: (BuildContext context, int index) {
          return _screens[index];
        },
        onPageChanged: _onPageChange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xFF0D0D0D)),
        unselectedLabelStyle: const TextStyle(fontSize: 12, color: Color(0xFF7A7D82)),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: NavigationIcon(icon: 'community', selected: _selectedIndex == 0),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: NavigationIcon(icon: 'me', selected: _selectedIndex == 1),
            label: '我的',
          ),
        ],
        onTap: _onTap,
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({super.key, required this.selected, required this.icon});

  final bool selected;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return selected
        ? Image.asset(
            'assets/icons/icon_tab_${icon}_active.png',
            width: 24,
            height: 24,
            package: 'home',
          )
        : Image.asset(
            'assets/icons/icon_tab_$icon.png',
            width: 24,
            height: 24,
            package: 'home',
          );
  }
}

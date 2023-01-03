import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/ui/shared/navBar.dart';
import 'package:admin_dashbuard/ui/shared/siderbar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuControler = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffedf1f2),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                //
                if (size.width >= 700) Sidebar(),
                Expanded(
                    child: Column(
                  children: [
                    //navbar
                    //Navbar(),
                    //View
                    Expanded(
                      child: widget.child,
                    )
                  ],
                ))
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                  animation: SideMenuProvider.menuControler,
                  builder: (context, _) => Stack(
                        children: [
                          if (SideMenuProvider.isOpen)
                            AnimatedOpacity(
                              opacity: SideMenuProvider.opacity.value,
                              duration: Duration(milliseconds: 200),
                              child: GestureDetector(
                                onTap: () => SideMenuProvider.closeMenu(),
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          Transform.translate(
                              child: Sidebar(),
                              offset:
                                  Offset(SideMenuProvider.movement.value, 0))
                        ],
                      ))
            // Sidebar(),
          ],
        ),
      ),
    );
  }
}

import 'package:admin_dashbuard/ui/layout/auth/widgets/backgroundAuth.dart';
import 'package:admin_dashbuard/ui/layout/auth/widgets/customTitle.dart';
import 'package:admin_dashbuard/ui/layout/auth/widgets/linksBar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(title: Text('asdasd')),
        body: SafeArea(
          child: Scrollbar(
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                (size.width > 1000)
                    ? _DesktopBody(child: child) // diseño para Desktop

                    : _MobileBody(child: child), // diseño para Mobile
                //LinksBar
                Linksbar(),
              ],
            ),
          ),
        ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundAuth(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.99,
      color: Colors.black,
      child: Row(
        children: [
          //Background
          Expanded(child: BackgroundAuth()),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomTitle(),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://raw.githubusercontent.com/Aric-Mirray-Capistran-Tenorio/imagenes-Act5/main/imgs/Buils.jpg";
  List<String> miImages = [
    "https://raw.githubusercontent.com/Aric-Mirray-Capistran-Tenorio/imagenes-Act5/main/imgs/Buils.jpg",
    "https://raw.githubusercontent.com/Aric-Mirray-Capistran-Tenorio/imagenes-Act5/main/imgs/autop.jpg",
    "https://raw.githubusercontent.com/Aric-Mirray-Capistran-Tenorio/imagenes-Act5/main/imgs/Local.jpg",
    "https://raw.githubusercontent.com/Aric-Mirray-Capistran-Tenorio/imagenes-Act5/main/imgs/ofe.jpeg",
  ];
  String textos = "Ferreteria Y Refaccionaria";
  List<String> mitextos = [
    "Ferreteria Y Refaccionaria",
    "Auto Partes",
    "Locales",
    "Ofertas",
  ];
  void _TabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
      textos = mitextos[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_TabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_TabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Color(0xff5e615c),
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              textos,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            background: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Colors.deepOrange,
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.white,
              labelColor: Color(0xff000000),
              unselectedLabelColor: Color(0xffffffff),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              isScrollable: true,
              tabs: const [
                Tab(text: "Herramientas"),
                Tab(text: "Auto Partes"),
                Tab(text: "Locales"),
                Tab(text: "Ofertas")
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: TabBarView(
                controller: tabController,
                children: const [
                  Text(
                    "Nuestro objetivo es ofrecerte las herramientas mas adecuadas para tus necesidades, con la calidad y el rendimiento que esperas.",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Tu mejor opción para encontrar las partes de auto que necesitas! En nuestro apartado de partes de autos, te ofrecemos una selección de productos de calidad para mantener tu vehículo en óptimas condiciones.",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Con varios locales establecidos, somos tu mejor opción para productos de calidad y un servicio excepcional. Descubre nuestros locales destacados",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Descubre las mejores ofertas en herramientas y productos para el hogar en nuestra ferretería! En nuestro apartado de ofertas, te ofrecemos descuentos exclusivos en una amplia gama de productos.",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

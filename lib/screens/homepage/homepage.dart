// ignore_for_file: prefer_const_constructors

import '../../utilities/exports.dart';

//final TabController controller = TabController(length: newsLabel.length, vsync: null);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('images/Vector (1).png'),
                    Icon(FeatherIcons.bell)
                  ],
                ),
              ),
              vHeight,
              Frame(title: 'Trending'),
              vHeight,
              BigNewsCard(),
              vHeight,
              Frame(title: 'Latest'),
              Expanded(child: ListView(
                
              ))

              
            ],
          ),
        ),
      ),
    );
  }
}

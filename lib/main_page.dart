import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> dropDownOptions = ['Date modified', 'Date created'];

  late String dropDownValue = dropDownOptions.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticky Hub 📒'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.solidCircleUser),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: FaIcon(FontAwesomeIcons.plus),
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search notes...',
              prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.arrowDown),
              ),
              DropdownButton(
                value: dropDownValue,
                items: dropDownOptions
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(
                    () {
                      dropDownValue = newValue!;
                    },
                  );
                },
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.bars),
              ),
            ],
          ),
          Expanded(
            child: MasonryGridView.count(
              itemCount: 15,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              itemBuilder: (BuildContext context, int index) => Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Text('This is going to be a title'),
                    Row(
                      children: [
                        Container(
                          child: Text('First chip'),
                        ),
                      ],
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lacinia at diam eget commodo. Duis pellentesque eget erat at semper. Aenean condimentum elit id massa laoreet euismod. Proin aliquet ante id sapien ullamcorper dignissim. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras sodales egestas metus ac semper.'),
                    Row(
                      children: [
                        Text('DD MMM, YYYY'),
                        FaIcon(FontAwesomeIcons.trash),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

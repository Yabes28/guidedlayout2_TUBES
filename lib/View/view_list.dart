import 'package:flutter/material.dart';
import 'package:guidedlayout2_1748/data/people.dart';

class ListNamaView extends StatelessWidget {
  const ListNamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Trainer"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Layar Lebar
            return const WideLayout();
          } else {
            // Layar Horizontal
            return const NarrowLayout();
          }
        }),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return PeopleList(
      onPersonTap: (person) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: PersonDetail(person),
          ),
        ),
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => WideLayoutState();
}

class WideLayoutState extends State<WideLayout> {
  Person? _person;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: PeopleList(
              onPersonTap: (person) => setState(() => _person = person),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: _person == null ? const Placeholder() : PersonDetail(_person!),
        ),
      ],
    );
  }
}

class PeopleList extends StatelessWidget {
  final void Function(Person) onPersonTap;
  const PeopleList({super.key, required this.onPersonTap});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
        for (var person in people)
          ListTile(
            leading: Image.network(person.picture),
            // leading: const HtmlElementView(viewType: "<img>"),
            title: Text(person.name),
            onTap: () => onPersonTap(person)),
      ]);
  }
}

class PersonDetail extends StatelessWidget {
  final Person person;
  const PersonDetail(this.person, {super.key}); // masalah penyusunan

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, boxConstraints) {
        return Center(
          child: boxConstraints.maxHeight > 200 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      onHover: (_) => {print("Hello World!")}, // ignore: avoid_print
                      child: Text(person.name),
                    ),
                    Text(person.age),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Contact Me"),
                    ),
                  ],
              ) :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MouseRegion(
                          onHover: (_) => {print("Hello World!")}, // ignore: avoid_print
                          child: Text(person.name),
                        ),
                        Text(person.age),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Contact Me"),
                        ),
                      ],
                    ),);
  }
  );
}
}
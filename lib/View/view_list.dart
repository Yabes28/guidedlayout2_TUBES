import 'package:flutter/material.dart';
import 'package:guidedlayout2_1748/data/people.dart';

class ListNamaView extends StatelessWidget {
  const ListNamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Trainer"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Layout untuk layar lebar
            return const WideLayout();
          } else {
            // Layout untuk layar sempit
            return const NarrowLayout();
          }
        },
      ),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: PeopleList(
        onPersonTap: (person) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text("Trainer Details"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              body: PersonDetail(person),
            ),
          ),
        ),
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Person? _selectedPerson;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Daftar Trainer
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: PeopleList(
              onPersonTap: (person) {
                setState(() {
                  _selectedPerson = person;
                });
              },
            ),
          ),
        ),
        // Detail Trainer
        Expanded(
          flex: 3,
          child: _selectedPerson == null
              ? const Center(
                  child: Text(
                    "Select a Trainer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                )
              : PersonDetail(_selectedPerson!),
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
    return ListView.separated(
      itemCount: people.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final person = people[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(12.0),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(person.picture),
            ),
            title: Text(
              person.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => onPersonTap(person),
          ),
        );
      },
    );
  }
}

class PersonDetail extends StatelessWidget {
  final Person person;

  const PersonDetail(this.person, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture and Stats
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(person.picture),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Fitness and Nutrition Trainer • 15+ years of experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _StatCard(label: "Clients", value: "110"),
                      _StatCard(label: "Sessions", value: "568"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Specializes In
            const Text(
              "Specializes in:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                _SpecializationChip(label: "Fitness Training"),
                _SpecializationChip(label: "Muscle Building"),
                _SpecializationChip(label: "Cardio"),
              ],
            ),
            const SizedBox(height: 30),

            // Provides
            const Text(
              "Provides:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const _ServiceRow(
              service: "Personal Training",
              price: "starts @ Rs. 200/- per session",
            ),
            const _ServiceRow(
              service: "Online Training",
              price: "starts @ Rs. 200/- per session",
            ),
            const _ServiceRow(
              service: "Small Group Training",
              price: "starts @ Rs. 200/- per session",
            ),
            const SizedBox(height: 30),

            // Book Session Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Handle Book Session Action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Book Session",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _SpecializationChip extends StatelessWidget {
  final String label;

  const _SpecializationChip({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final String service;
  final String price;

  const _ServiceRow({required this.service, required this.price, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              service,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

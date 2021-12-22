import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_detail_view.dart';
import 'contact_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Barron Breezy",
      "phone": "233 24 526 5987",
      "email": "breezy25@gmail.com",
      "country": "Ghana",
      "region": "Volta",
      "picture":"assets/ivana.jpg"
    },
    {
      "name": "Carl Riverz",
      "phone": "+1 258 5952 2365",
      "email": "riverzcarl@gmail.com",
      "country": "USA",
      "region": "California",
      "picture":"assets/ali.jpg"
    },
    {
      "name": "Areeba GetMoni",
      "phone": "+233 26 231 8569",
      "email": "getmoni@gmail.com",
      "country": "Jamaica",
      "region": "Kingston",
      "picture":"assets/huston.jpg"
    },
    {
      "name": "Dela Lee",
      "phone": "+233 24 236 6654",
      "email": "delaleewan@gmail.com",
      "country": "Spain",
      "region": "Madrid",
       "picture":"assets/ben.jpg"
    },
    {
      "name": "Learn Life",
      "phone": "+233 24 365 8546",
      "email": "learnlife@gmail.com",
      "country": "China",
      "region": "Hong Kong",
       "picture":"assets/cagle.jpg"
    },
    {
      "name": "Baba CJB Crimson",
      "phone": "233 54 254 3211",
      "email": "babacjb.com",
      "country": "Spain",
      "region": "Marbella",
       "picture":"assets/elevate.jpg"
    },
    {
      "name": "Sterling Jay",
      "phone": "233 24 214 2241",
      "email": "sterlingJ@yahoo.com",
      "country": "France",
      "region": "Paris",
       "picture":"assets/ayo.jpg"
    },
    {
      "name": "Kris Baller Jay",
      "phone": "233 24 632 8854",
      "email": "krisbjay@yahoo.com",
      "country": "USA",
      "region": "Atlanta,Gorgia",
       "picture":"assets/ian.jpg"
    },
    {
      "name": "Paula Splendour",
      "phone": "233 54 231 2547",
      "email": "splendourp@gmail.com",
      "country": "Israel",
      "region": "Tel Aviv",
       "picture":"assets/aiony.jpg"
    },
    {
      "name": "Fearless Edudzie",
      "phone": "233 24 321 4215",
      "email": "fearlessE@yahoo.com",
      "country": "Worldwide",
      "region": "everywhere",
       "picture":"assets/melissa.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/nicholas.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'WorldWide',
                                email: 'bless@mrworld.com',
                                name: 'Efo Godbless',
                                phone: '+233 20 241 3258',
                                region: 'All Over the World',
                                picture: 'assets/sherrold.jpg'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/sherrold.jpg'),
                    ),
                    title: const Text(
                      'Efo Godbless',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 20 241 3258'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('${element['picture']}'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order:  GroupedListOrder.ASC,// optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
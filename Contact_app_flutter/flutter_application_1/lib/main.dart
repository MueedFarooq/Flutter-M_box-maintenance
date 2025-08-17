import 'package:flutter/material.dart';

void main() => runApp(const RedditChatApp());

class RedditChatApp extends StatelessWidget {
  const RedditChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reddit Chat',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFFF4500),
        scaffoldBackgroundColor: const Color(0xFF1A1A1B),
      ),
      home: const ChatHomePage(),
    );
  }
}

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({super.key});

  @override
  ChatHomePageState createState() => ChatHomePageState();
}

class ChatHomePageState extends State<ChatHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const ChatsPage(),
    CallsPage(),
    ContactsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit Chat'),
        backgroundColor: const Color(0xFFFF4500),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF272729),
        selectedItemColor: const Color(0xFFFF4500),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  ChatsPageState createState() => ChatsPageState();
}

class ChatsPageState extends State<ChatsPage> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add(_controller.text.trim());
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_messages[index]),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFF4500),
                  child: Text('U'),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    filled: true,
                    fillColor: Colors.white12,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Color(0xFFFF4500)),
                onPressed: _sendMessage,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CallsPage extends StatelessWidget {
  final List<Map<String, String>> callHistory = [
    {'name': 'Ali Khan', 'time': 'Today, 3:45 PM'},
    {'name': 'Sana Raza', 'time': 'Yesterday, 10:12 AM'},
    {'name': 'John Smith', 'time': 'Monday, 7:30 PM'},
  ];

  CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callHistory.length,
      itemBuilder: (context, index) {
        final call = callHistory[index];
        return ListTile(
          leading: const Icon(Icons.call, color: Color(0xFFFF4500)),
          title: Text(call['name']!),
          subtitle: Text(call['time']!),
          trailing: const Icon(Icons.info_outline, color: Colors.grey),
        );
      },
    );
  }
}

class ContactsPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'Ali Khan', 'number': '0300-1234567'},
    {'name': 'Sana Raza', 'number': '0321-7654321'},
    {'name': 'John Smith', 'number': '0312-4567890'},
    {'name': 'Nadia Malik', 'number': '0345-6789012'},
    {'name': 'Hamza Yousaf', 'number': '0333-2345678'},
    {'name': 'Maria Iqbal', 'number': '0301-9876543'},
    {'name': 'Usman Tariq', 'number': '0311-5555555'},
    {'name': 'Zara Sheikh', 'number': '0322-3333333'},
    {'name': 'Bilal Aslam', 'number': '0340-1111222'},
    {'name': 'Hina Shah', 'number': '0365-4444555'},
  ];

  ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFFF4500),
            child: Text(contact['name']![0]),
          ),
          title: Text(contact['name']!),
          subtitle: Text(contact['number']!),
          trailing: const Icon(Icons.message, color: Color(0xFFFF4500)),
        );
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 80, color: Colors.grey),
          const SizedBox(height: 10),
          const Text('Your Username', style: TextStyle(fontSize: 20)),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Edit Profile clicked')),
              );
            },
            style: ElevatedButton.styleFrom(
              iconColor: const Color(0xFFFF4500),
            ),
            child: const Text('Edit Profile'),
          )
        ],
      ),
    );
  }
}

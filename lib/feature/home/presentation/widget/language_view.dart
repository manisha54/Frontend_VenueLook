import 'package:flutter/material.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  Map<String, bool> suggestedLanguages = {
    'English (UK)': true, // Setting English (UK) as default
    'English (US)': false,
  };
  Map<String, bool> otherLanguages = {
    'French': false,
    'Hindi': false,
    'Spanish': false,
    
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: const Text('Chat'),
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildLanguageCategory('Suggested', suggestedLanguages),
          _buildLanguageCategory('Other', otherLanguages),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<String> selected = [];
          suggestedLanguages.forEach((key, value) {
            if (value) {
              selected.add(key);
            }
          });
          otherLanguages.forEach((key, value) {
            if (value) {
              selected.add(key);
            }
          });
          // Do something with the selected languages
         // print('Selected languages: $selected');
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  Widget _buildLanguageCategory(String category, Map<String, bool> languages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: languages.length,
          itemBuilder: (BuildContext context, int index) {
            final language = languages.keys.elementAt(index);
            return ListTile(
              title: Text(language),
              trailing: languages[language] == true
                  ? const Icon(Icons.check_circle)
                  : IconButton(
                      icon: const Icon(Icons.circle_outlined),
                      onPressed: () {
                        setState(() {
                          languages.forEach((key, value) {
                            languages[key] = key == language;
                          });
                        });
                      },
                    ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LanguageView(),
  ));
}

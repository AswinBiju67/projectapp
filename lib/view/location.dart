import 'package:flutter/material.dart';
import 'package:projectapp/controller/locationcontroller.dart';
import 'package:projectapp/model/locationmodel.dart';
import 'package:projectapp/view/homescreen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocationAutocomplete extends StatefulWidget {

  const LocationAutocomplete({Key? key,}) : super(key: key);

  @override
  State<LocationAutocomplete> createState() => _LocationAutocompleteState();
}

class _LocationAutocompleteState extends State<LocationAutocomplete> {
  final TextEditingController _controller = TextEditingController();
  final ControlClass _controlClass = ControlClass();
  List<ModelClass> _suggestions = [];
  String? _savedPlace;

  void _onSearchChanged(String input) async {
    if (input.isNotEmpty) {
      try {
        final suggestions = await _controlClass.getPlaceSuggestions(input);
        setState(() {
          _suggestions = suggestions;
        });
      } catch (e) {
        print(e);
      }
    } else {
      setState(() {
        _suggestions = [];
      });
    }
  }

  Future<void> _savePlaceName(String placeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedPlace', placeName);
    setState(() {
      _savedPlace = placeName;
    });
  }

  Future<void> _loadSavedPlace() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedPlace = prefs.getString('savedPlace');
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onSearchChanged(_controller.text);
    });
    _loadSavedPlace(); // Load saved place on initialization
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Autocomplete')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search location',
                border: OutlineInputBorder(),
              ),
            ),
            if (_savedPlace != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Saved Place: $_savedPlace',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = _suggestions[index];
                  return ListTile(
                    title: Text(suggestion.description),
                    onTap: () {
                      _savePlaceName(suggestion.description);
                      setState(() {
                        _controller.text = suggestion.description;
                        _suggestions.clear();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homescreen(location: suggestion.description,),), (route) => false,);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

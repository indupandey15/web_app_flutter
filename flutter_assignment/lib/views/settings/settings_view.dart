import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // List to store notes
  List<String> notes = [];

  // Controller for managing input in the note text field
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: <Widget>[
          // Expanded ListView to display existing notes
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        // Remove the note when the delete button is pressed
                        notes.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    // Trigger edit when tapping on a note
                    _editNote(index);
                  },
                );
              },
            ),
          ),
          // Text field for adding new notes
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Add a note',
              ),
              onSubmitted: (note) {
                // Call _addNote when the user submits a new note
                _addNote();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to add a new note
  void _addNote() {
    String newNote = noteController.text.trim();
    if (newNote.isNotEmpty) {
      setState(() {
        // Add the new note to the list and clear the text field
        notes.add(newNote);
        noteController.clear();
      });
    }
  }

  // Function to edit an existing note
  void _editNote(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Note'),
          // Text field inside the dialog for editing the note
          content: TextField(
            controller: TextEditingController(text: notes[index]),
            onChanged: (editedNote) {
              // Update the note when the user edits it
              notes[index] = editedNote;
            },
          ),
          actions: <Widget>[
            // Cancel button to close the dialog without saving changes
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            // Save button to save the edited note
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  // Save changes (optional: you can add a function here to save changes to storage)
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

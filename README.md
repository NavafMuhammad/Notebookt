
# Notebookt

A basic Flutter application for managing notes. This app allows users to add, edit, update, and delete notes. It uses Dio to make HTTP requests to a local server.



## Features

- ___Add Note:___ Create a new note.
- ___GetAll Notes:___ Retrieve a list of notes.
- ___Update Note:___ Edit and save changes to existing notes.
- ___Delete Note:___ Remove notes.
- ___Local Server Communication:___ Uses Dio for HTTP requests to interact with a local server.


## Prerequisites

- Flutter SDK installed
- A local server set up to handle HTTP requests (for example, using a tool like JSON Server or a custom backend)
## Getting Started

### 1. Clone Repository

Clone this repository to your local machine

```bash
  git clone https://github.com/mohammed-nawaf/Notebookt.git
  cd Notebookt
```

### 2. Install Dependencies

Navigate to the project directory and install the required dependencies:

```bash
  flutter pub get
```
### 3. Update API Configuration

Ensure that your local server is running and accessible. Update the base URL in the Dio configuration located in ___'lib/data/url.dart'___:

```bash
  class Url {
    String baseUrl = 'http://10.0.2.2:3000'; // Replace with your local server URL
  }
```
####  Define your methods for HTTP requests in   
___'lib/data/data.dart'___:

### 4. Run the App

Run the Flutter application using:

```bash
  flutter run
```

### 5. App Structure

- ___lib/main.dart___ : Entry point of the application.
- ___lib/data/note_model/note_model.dart___ : Model class for the note.
- ___lib/data/get_all_notes_resp_model/get_all_notes_resp_model.dart___ : Model class for the get all notes.
- ___lib/data/data.dart___ : Service class using Dio for API calls.
- ___lib/view/screen_all_notes/screen_all_notes.dart___ : Main screen displaying the list of notes.
- ___lib/view/screen_add_note/screen_add_note.dart___ : Screen for adding and editing notes.

### 6. HTTP Endpoints

The app interacts with the following endpoints on the local server:

- ___GET /note/getAll___: Retrieve a list of notes.
- ___POST /note/create___: Add a new note.
- ___PUT /note/update___: Update an existing note.
- ___DELETE /note/delete/{id}___: Delete a note.

### 7. Contributing

If you want to contribute to the development of this app:

 - Fork the repository.
 - Create a feature branch (git checkout -b feature/YourFeature).
 - Commit your changes (git commit -am 'Add new feature').
 - Push to the branch (git push origin feature/YourFeature).
 - Create a new Pull Request.

 
## Screenshots

<img src="https://github.com/user-attachments/assets/4fd3ed36-ea45-4b24-b3de-103e160324b6" width="200" height="400" />

<img src="https://github.com/user-attachments/assets/61293e5f-1a5c-43ff-99bc-352362582eac" width="200" height="400" />

<img src="https://github.com/user-attachments/assets/c7f122d5-8c48-435c-b6c2-d61f5e819f94" width="200" height="400" />




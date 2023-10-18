# MyNotes App
MyNotes is a notes app built using Dart, Flutter and Firebase, utilizing the BLoC state management pattern. This app allows users to create, edit, and delete notes, which are stored securely in Firebase.

## Features
- Create, edit, and delete notes
- Firebase authentication for user login and registration
- Real-time synchronization of notes across devices
- BLoC (Business Logic Component) state management for efficient data handling
- Exception handling for possible authentication errors
- Localization for both English and Polish languages

## Views

The MyNotes app encompasses several key views that cater to various functionalities:

### 1. **Login View**

- Allows existing users to authenticate by entering their registered email and password.
- Includes a button that allows users to navigate to the **Register View** in order to create a new account.
- Provides an option for users to reset their password if needed (Forgot Password).
<img src="test/screenshots/login_view.jpg" alt="loginView" width="400"/>

### 2. **Register View**

- Enables new users to create an account by providing necessary registration details (email and password).
<img src="test/screenshots/register_view.jpg" alt="registerView" width="400"/>

### 3. **Forgot Password View**

- Allows users to request a password reset link by entering their registered email.
- Sends an email with instructions for resetting the password.
<img src="test/screenshots/forgot_password_view.jpg" alt="forgotPasswordView" width="400"/>

### 4. **Verify Email View**

- Prompts users to verify their email address after successful registration.
- Instructs users to check their email for a verification link.
<img src="test/screenshots/verify_email_view.jpg" alt="verifyEmailView" width="400"/>

### 5. **Notes List View**

- Displays a list of all the user's notes in a scrollable view.
- Allows users to select a note to view its details or initiate editing.
- Provides option to log out current user.
<img src="test/screenshots/notes_view.jpg" alt="notesListView" width="400"/>

### 6. **Create/Update Note View**

- Enables users to create new and update existing notes by entering a content.
- Provides a Share button to share a note with others.
<img src="test/screenshots/create_update_note_view.jpg" alt="createUpdateNoteView" width="400"/>


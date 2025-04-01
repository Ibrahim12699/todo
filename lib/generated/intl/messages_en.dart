// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(number) =>
      "Description must be at least ${number} characters";

  static String m1(number) => "Name must be at least ${number} characters";

  static String m2(name) => "No tasks with status \"${name}\" found";

  static String m3(number) => "Password must be at least ${number} characters";

  static String m4(number) => "Title must be at least ${number} characters";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "agree_terms": MessageLookupByLibrary.simpleMessage(
      "By continuing, you agree to our Terms of Service and Privacy Policy.",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "anErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "authHint": MessageLookupByLibrary.simpleMessage(
      "Collaborate effortlessly on tasks",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create account"),
    "createNewTask": MessageLookupByLibrary.simpleMessage("Create New Task"),
    "createTask": MessageLookupByLibrary.simpleMessage("Create Task"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionIsRequired": MessageLookupByLibrary.simpleMessage(
      "Description is required",
    ),
    "descriptionMustBeAtLeastCharacters": m0,
    "dueDate": MessageLookupByLibrary.simpleMessage("Due Date"),
    "editTask": MessageLookupByLibrary.simpleMessage("Edit Task"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailIsRequired": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "emailMustContainAtSign": MessageLookupByLibrary.simpleMessage(
      "Email must contain @ sign",
    ),
    "enterDescription": MessageLookupByLibrary.simpleMessage(
      "Enter description",
    ),
    "enterTitle": MessageLookupByLibrary.simpleMessage("Enter title"),
    "enterYourEmail": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "enterYourName": MessageLookupByLibrary.simpleMessage("Enter your name"),
    "enterYourPassword": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
    "hi": MessageLookupByLibrary.simpleMessage("Hi"),
    "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "nameIsRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "nameMustBeAtLeastCharacters": m1,
    "newTask": MessageLookupByLibrary.simpleMessage("New Task"),
    "noTasksFound": MessageLookupByLibrary.simpleMessage("No tasks found"),
    "noTasksWithStatusFound": m2,
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordIsRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordMustBeAtLeastCharacters": m3,
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "tasks": MessageLookupByLibrary.simpleMessage("Tasks"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "titleCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Title cannot be empty",
    ),
    "titleMustBeAtLeastCharacters": m4,
    "todo": MessageLookupByLibrary.simpleMessage("To Do"),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "updateTask": MessageLookupByLibrary.simpleMessage("Update Task"),
    "whatAreYouPlanningToday": MessageLookupByLibrary.simpleMessage(
      "What are you planning today?",
    ),
    "youHaventCreatedAnyTasksYet": MessageLookupByLibrary.simpleMessage(
      "You haven\'t created any tasks yet",
    ),
  };
}

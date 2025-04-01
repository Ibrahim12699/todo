// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `An error occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Title cannot be empty`
  String get titleCannotBeEmpty {
    return Intl.message(
      'Title cannot be empty',
      name: 'titleCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Title must be at least {number} characters`
  String titleMustBeAtLeastCharacters(Object number) {
    return Intl.message(
      'Title must be at least $number characters',
      name: 'titleMustBeAtLeastCharacters',
      desc: '',
      args: [number],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message('Sign in', name: 'signIn', desc: '', args: []);
  }

  /// `Collaborate effortlessly on tasks`
  String get authHint {
    return Intl.message(
      'Collaborate effortlessly on tasks',
      name: 'authHint',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message('Full name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to our Terms of Service and Privacy Policy.`
  String get agree_terms {
    return Intl.message(
      'By continuing, you agree to our Terms of Service and Privacy Policy.',
      name: 'agree_terms',
      desc: '',
      args: [],
    );
  }

  /// `Create New Task`
  String get createNewTask {
    return Intl.message(
      'Create New Task',
      name: 'createNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message('Edit Task', name: 'editTask', desc: '', args: []);
  }

  /// `Title`
  String get title {
    return Intl.message('Title', name: 'title', desc: '', args: []);
  }

  /// `Enter title`
  String get enterTitle {
    return Intl.message('Enter title', name: 'enterTitle', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Enter description`
  String get enterDescription {
    return Intl.message(
      'Enter description',
      name: 'enterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Create Task`
  String get createTask {
    return Intl.message('Create Task', name: 'createTask', desc: '', args: []);
  }

  /// `Update Task`
  String get updateTask {
    return Intl.message('Update Task', name: 'updateTask', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Due Date`
  String get dueDate {
    return Intl.message('Due Date', name: 'dueDate', desc: '', args: []);
  }

  /// `New Task`
  String get newTask {
    return Intl.message('New Task', name: 'newTask', desc: '', args: []);
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `No tasks found`
  String get noTasksFound {
    return Intl.message(
      'No tasks found',
      name: 'noTasksFound',
      desc: '',
      args: [],
    );
  }

  /// `You haven't created any tasks yet`
  String get youHaventCreatedAnyTasksYet {
    return Intl.message(
      'You haven\'t created any tasks yet',
      name: 'youHaventCreatedAnyTasksYet',
      desc: '',
      args: [],
    );
  }

  /// `No tasks with status "{name}" found`
  String noTasksWithStatusFound(Object name) {
    return Intl.message(
      'No tasks with status "$name" found',
      name: 'noTasksWithStatusFound',
      desc: '',
      args: [name],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `To Do`
  String get todo {
    return Intl.message('To Do', name: 'todo', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Email is required`
  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email must contain @ sign`
  String get emailMustContainAtSign {
    return Intl.message(
      'Email must contain @ sign',
      name: 'emailMustContainAtSign',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least {number} characters`
  String passwordMustBeAtLeastCharacters(Object number) {
    return Intl.message(
      'Password must be at least $number characters',
      name: 'passwordMustBeAtLeastCharacters',
      desc: '',
      args: [number],
    );
  }

  /// `Name is required`
  String get nameIsRequired {
    return Intl.message(
      'Name is required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least {number} characters`
  String nameMustBeAtLeastCharacters(Object number) {
    return Intl.message(
      'Name must be at least $number characters',
      name: 'nameMustBeAtLeastCharacters',
      desc: '',
      args: [number],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `What are you planning today?`
  String get whatAreYouPlanningToday {
    return Intl.message(
      'What are you planning today?',
      name: 'whatAreYouPlanningToday',
      desc: '',
      args: [],
    );
  }

  /// `Description is required`
  String get descriptionIsRequired {
    return Intl.message(
      'Description is required',
      name: 'descriptionIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Description must be at least {number} characters`
  String descriptionMustBeAtLeastCharacters(Object number) {
    return Intl.message(
      'Description must be at least $number characters',
      name: 'descriptionMustBeAtLeastCharacters',
      desc: '',
      args: [number],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

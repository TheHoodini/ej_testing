// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/authentication/signup.dart';
import 'package:f_testing_template/ui/pages/content/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets(
      'Widget login validación @ email', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            key: Key("LoginScreen"), 
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.text("Enter valid email address"), findsOneWidget);
      });
    
  testWidgets('Widget login validación campo vacio email',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            key: Key("LoginScreen"), 
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.text("Enter email"), findsOneWidget);
      });

  testWidgets('Widget login validación número de caracteres password',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            key: Key("LoginScreen"), 
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "a@a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "12345");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.text("Password should have at least 6 characters"), findsOneWidget);
      });

  testWidgets('Widget login validación campo vacio password',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            key: Key("LoginScreen"), 
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "a@a.com");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.text("Enter password"), findsOneWidget);
      });

  testWidgets(
      'Widget login autenticación exitosa', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "a@a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.byKey(const Key("LoginScreen")), findsNothing);
      });

  testWidgets(
      'Widget login autenticación no exitosa', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: LoginScreen(
            key: Key("LoginScreen"), 
            email: "blank",
            password: "blank",)
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldLoginEmail")), "a@a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldLoginPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonLoginSubmit")));
        await tester.pump();
        expect(find.byKey(const Key("LoginScreen")), findsOneWidget);
      });

  testWidgets(
      'Widget signUp validación @ email', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: SignUpPage()
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
        await tester.pump();
        expect(find.text("Enter valid email address"), findsOneWidget);
      });

  testWidgets('Widget signUp validación campo vacio email',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: SignUpPage()
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "123456");
        await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
        await tester.pump();
        expect(find.text("Enter email"), findsOneWidget);
      });

  testWidgets('Widget signUp validación número de caracteres password',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: SignUpPage()
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "a@a.com");
        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpPassword")), "12345");
        await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
        await tester.pump();
        expect(find.text("Password should have at least 6 characters"), findsOneWidget);
      });

  testWidgets('Widget signUp validación campo vacio password',
      (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: SignUpPage()
        ));

        await tester.enterText(find.byKey(const Key("TextFormFieldSignUpEmail")), "a@a.com");
        await tester.tap(find.byKey(const Key("ButtonSignUpSubmit")));
        await tester.pump();
        expect(find.text("Enter password"), findsOneWidget);
      });

  testWidgets(
      'Widget home visualización correo', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
          home: HomePage(loggedEmail: "a@a.com", loggedPassword: "123456")
        ));

        expect(find.text("TextHomeHello"), findsNothing);
      });



  testWidgets(
      'Widget home nevegación detalle', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
            home: HomePage(loggedEmail: "a@a.com", loggedPassword: "123456")
          ));

          expect(find.text("ButtonHomeDetail"), findsNothing);
  });

  testWidgets(
     'Widget home logout', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(
            home: HomePage(loggedEmail: "a@a.com", loggedPassword: "123456")
          ));

          expect(find.text("ButtonHomeLogOff"), findsNothing);
  });
}

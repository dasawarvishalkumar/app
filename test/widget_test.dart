import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:it_school_see/main.dart'; // Ensure this import matches your file structure
import 'package:it_school_see/dashboard_screen.dart'; // Import DashboardScreen
import 'package:it_school_see/registration.dart'; // Import RegistrationPage
import 'package:it_school_see/forgetpassword.dart'; // Import ForgotPasswordPage

void main() {
  group('SchoolSeeApp Widget Tests', () {
    testWidgets('Login page renders correctly', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const SchoolSeeApp());

      // Verify that the login page is displayed.
      expect(find.text('Parent Login'), findsOneWidget);
      expect(find.text('Enroll ID'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget); // Login button
      expect(find.text('Register'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);

      // Verify the logo is displayed.
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('Login button navigates to DashboardScreen', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const SchoolSeeApp());

      // Tap the login button.
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(); // Wait for navigation to complete.

      // Verify that the DashboardScreen is displayed.
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('Register button navigates to RegistrationPage', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const SchoolSeeApp());

      // Tap the register button.
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle(); // Wait for navigation to complete.

      // Verify that the RegistrationPage is displayed.
      expect(find.byType(RegistrationPage), findsOneWidget);
    });

    testWidgets('Forgot Password button navigates to ForgotPasswordPage', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const SchoolSeeApp());

      // Tap the forgot password button.
      await tester.tap(find.text('Forgot Password?'));
      await tester.pumpAndSettle(); // Wait for navigation to complete.

      // Verify that the ForgotPasswordPage is displayed.
      expect(find.byType(ForgotPasswordPage), findsOneWidget);
    });

    testWidgets('Password visibility toggle works', (WidgetTester tester) async {
      // Build the app and trigger a frame.
      await tester.pumpWidget(const SchoolSeeApp());

      // Find the password field using the text field semantics or a more reliable method.
      final passwordFieldFinder = find.byType(TextField).first;
      expect(passwordFieldFinder, findsOneWidget);

      // Initially, the password should be obscured.
      final passwordField = tester.widget<TextField>(passwordFieldFinder);
      expect(passwordField.obscureText, true);

      // Tap the visibility toggle icon (typically an icon in the password field).
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump(); // Rebuild the widget tree after state change.

      // Verify the password field is now visible.
      final updatedPasswordField = tester.widget<TextField>(passwordFieldFinder);
      expect(updatedPasswordField.obscureText, false);
    });
  });
}

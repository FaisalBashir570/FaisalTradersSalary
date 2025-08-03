
import 'package:flutter/material.dart';

void main() => runApp(FaisalTradersSalaryApp());

class FaisalTradersSalaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faisal Traders Salary',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == 'admin' && password == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      setState(() {
        errorMessage = 'Invalid login';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(errorMessage, style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final _employeeController = TextEditingController();
  final _salaryController = TextEditingController();
  final _bonusController = TextEditingController();
  final _deductionController = TextEditingController();
  final _notesController = TextEditingController();

  void _saveRecord(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Salary record saved (not stored in this demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now().toLocal().toString().split(' ')[0];
    return Scaffold(
      appBar: AppBar(title: Text('Faisal Traders - Dashboard')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Date: $currentDate'),
            TextField(
              controller: _employeeController,
              decoration: InputDecoration(labelText: 'Employee Name'),
            ),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(labelText: 'Salary Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bonusController,
              decoration: InputDecoration(labelText: 'Bonus'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _deductionController,
              decoration: InputDecoration(labelText: 'Deduction'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(labelText: 'Notes (optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveRecord(context),
              child: Text('Save Salary Entry'),
            ),
          ],
        ),
      ),
    );
  }
}

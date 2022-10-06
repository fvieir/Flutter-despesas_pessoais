import 'dart:io';
import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'models/trasanctions.dart';

void main() => runApp(Expenses());

class Expenses extends StatelessWidget {
  Expenses({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      home: const MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.purple,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          labelLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de água',
      value: 711.3,
      date: DateTime.now().subtract(
        const Duration(
          days: 1,
        ),
      ),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _removeList(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  void _setShowChart() {
    setState(() {
      _showChart = !_showChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final appBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text('Despesas Pessoais'),
      actions: [
        if (isLandscape)
          IconButton(
            onPressed: () => _setShowChart(),
            icon: Icon(_showChart ? Icons.list : Icons.area_chart),
          ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    final avaibleHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    // mediaQuery.padding.top obtem altura do statusBar

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // if (isLandscape)
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Exibir gráfico?',
            //         style: TextStyle(
            //           fontSize:
            //               Theme.of(context).textTheme.titleLarge!.fontSize,
            //         ),
            //       ),
            //       Switch.adaptive(
            //           activeColor: Theme.of(context).colorScheme.secondary,
            //           value: _showChart,
            //           onChanged: (newValue) {
            //             setState(() {
            //               _showChart = newValue;
            //             });
            //           }),
            //     ],
            //   ),
            if (_showChart || !isLandscape)
              SizedBox(
                height: avaibleHeight * (isLandscape ? 0.65 : 0.3),
                child: Chart(recentTransaction: _recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: avaibleHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                  transactions: _transactions,
                  onRemove: _removeList,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

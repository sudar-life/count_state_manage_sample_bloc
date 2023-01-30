import 'package:count_state_manage_sample/src/cubit/count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitHome extends StatelessWidget {
  const CubitHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cubit상태관리')),
      body: Center(
        child: BlocBuilder<CountCubit, int>(builder: (context, state) {
          return Text(
            state.toString(),
            style: TextStyle(fontSize: 80),
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: context.read<CountCubit>().addCount,
            child: Icon(Icons.add),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            onPressed: context.read<CountCubit>().substractCount,
            backgroundColor: Colors.red,
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}

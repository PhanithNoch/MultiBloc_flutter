import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/random/random_bloc.dart';


class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<CounterBloc,CounterState>(
              listener: (context,state){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('CounterBloc got Press'),));
              }
            ),
            BlocListener<RandomBloc,RandomState>(
                listener: (context,state){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('RandomBloc got Press'),));
                }
            )
          ],
          child: Column(
            children: [
              BlocBuilder<RandomBloc, RandomState>(
                  builder: (context, state) {
                    return Text(state.random.toString());
                  }
              ),
              RaisedButton(
                child: Text("Random"),
                onPressed: (){
                  BlocProvider.of<RandomBloc>(context).add(GenerateEvent());
                },
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: (){
                  BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
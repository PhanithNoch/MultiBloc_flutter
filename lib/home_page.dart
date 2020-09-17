import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/counter_bloc.dart';
import 'package:multi_bloc/randome_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc'),
        actions: [
          FlatButton(child: Text('Next'),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RandomPage()));
          },)
        ],
      ),
      body:Center(
        child:BlocConsumer<CounterBloc,CounterState>(
          listener: (context,state){
            if(state.counter == 0){
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('do not press Decrement'),));
            }
          },
          builder: (context,state){

            return Center(
              child: Column(
                children: [
              Text(state.counter.toString()),

                  RaisedButton(
                    child: Text('Increment'),
                    onPressed: (){
                      BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                    },
                  ),

                  RaisedButton(
                    child: Text('Increment'),
                    onPressed: (){
                      BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                    },
                  ),
                ],
              ),
            );
      }
        ),
      ),

      // BlocListener<CounterBloc,CounterState>(
      //   listener: (context, state) {
      //     if(state.counter == 0){
      //       Scaffold.of(context).showSnackBar(SnackBar(content: Text('do not press decrement again '),duration: Duration(milliseconds: 200),));
      //     }
      //   },
      //   child:
      //       BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(state.counter.toString()),
      //           RaisedButton(
      //             child: Text('Increment'),
      //             onPressed: () {
      //               BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
      //             },
      //           ),
      //           RaisedButton(
      //             child: Text('Decrement'),
      //             onPressed: () {
      //               BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
      //             },
      //           ),
      //         ],
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}

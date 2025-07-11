import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scatter_smileys/bloc/counter_bloc.dart';
import 'package:scatter_smileys/bloc/counter_event.dart';
import 'package:scatter_smileys/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return 
    
     Scaffold(
       body:  BlocBuilder<CounterBloc,CounterState>(
         builder: (context,state){
           return Stack(
            //  alignment: Alignment.center,
             clipBehavior: Clip.none,
             children: [
               for(int i = 0; i<state.count; i++)
               Positioned(
                 left: Random().nextInt(250).toDouble(),
                 top:Random().nextInt(700).toDouble(),
                 child:SizedBox(
                   height: 50,
                   width: 50,
                   child: Image.asset('assets/smiley.png')
                 )
               )
               
             ],
           );
         }
         ),
           floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(onPressed:()=> counterBloc.add(IncrementCounter()), child: Text('+')),
                SizedBox(height: 10,),
                 FloatingActionButton(onPressed:()=>counterBloc.add(DecrementCounter()), child: Text('_')),
                          SizedBox(height: 10,),
                 FloatingActionButton(onPressed:()=>counterBloc.add(ResetCounter()), child: Text('Reset')),
              ],
           ),
     );
  }
}
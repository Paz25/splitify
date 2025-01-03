// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:splitify/utils/theme/elevated_button_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 48,
            bottom: 24,
            start: 24,
            end: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: TElevatedButtonTheme.primaryElevatedButton.style,
                child: const Text(
                  'Add new bills',
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recent Bills',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              const Column(
                children: [
                  BillsCard(),
                  SizedBox(height: 16),
                  BillsCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BillsCard extends StatelessWidget {
  const BillsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: const Color(0xFFD08728),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                print('Update action pressed');
              },
              icon: Icons.update,
              label: 'Update',
            ),
            SlidableAction(
              onPressed: (BuildContext context) {
                print('Delete action pressed');
              },
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: const ListTile(
          title: Text('Bill 1'),
          subtitle: Text('Due: 2023-02-20'),
        ),
      ),

      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: 64,
      //       height: 64,
      //       decoration: ShapeDecoration(
      //         image: const DecorationImage(
      //           image: NetworkImage(
      //               "https://i.pinimg.com/736x/26/c0/23/26c023e833ca1b08a20176868996f7d1.jpg"),
      //           fit: BoxFit.cover,
      //         ),
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(4),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(width: 16),
      //     const Expanded(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             "Bill 1",
      //             textAlign: TextAlign.left,
      //             style: TextStyle(
      //               fontFamily: 'Poppins',
      //               fontSize: 16,
      //               fontWeight: FontWeight.w600,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

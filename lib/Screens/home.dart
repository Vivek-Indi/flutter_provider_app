import 'package:flutter/material.dart';
import 'package:flutter_provider_app/Model/todo.dart';
import 'package:flutter_provider_app/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getList();
    });
  }

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (value) =>
                  context.read<TodoProvider>().search(controller.text),
            ),
            Expanded(
              child: Consumer<TodoProvider>(
                builder: ((context, value, child) {
                  var data =
                      controller.text == "" ? value.todo : value.todofiltered;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        if (value.isLoading) {
                          return const CircularProgressIndicator();
                        }
                        return ListTile(
                          title: Text(
                            data[index].id.toString(),
                          ),
                          subtitle: Text(
                            data[index].title.toString(),
                          ),
                        );
                      });
                }),
              ),
            ),
          ],
        ));
  }
}

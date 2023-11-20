import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:despedida/app/controller/home_controller.dart';


class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
              Icons.location_on,
          size: 40,
          color: Colors.white,
          ),
              const SizedBox(height: 4,),
              const Text("Location",
              style: TextStyle(
                fontSize: 25,
                color:  Colors.white,
                fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                controller.latitude.value,
                style: const TextStyle(
                ),
              )
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                controller.latitude.value,
                style: const TextStyle(
                  fontSize:  20,
                  color: Colors.white,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
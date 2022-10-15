import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/modules/login/login_screen.dart';
import 'package:shopping_tranning/modules/rigester/cubit/rigester_cubit.dart';
import 'package:shopping_tranning/modules/rigester/cubit/rigester_states.dart';
import 'package:shopping_tranning/shared/components/components.dart';

class RigesterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RigesterCubit() ,
      child: BlocConsumer<RigesterCubit,RigesterStates>(
        listener: (BuildContext context, state) {
          if(state is RigesterSuccessStateState)
            {
              if(state.loginAndRigesterModel.status!)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }
            }
        },
        builder: (BuildContext context, Object? state) {
          var formKey=GlobalKey<FormState>();
          var emailController=TextEditingController();
          var passwordController=TextEditingController();
          var phoneController=TextEditingController();
          var nameController=TextEditingController();
          var fireController=TextEditingController();
          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultFormField
                        (
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'name',
                          prefix: Icons.person,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'name must be not empty';
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultFormField
                        (
                          controller: phoneController,
                          type: TextInputType.number,
                          label: 'phone',
                          prefix: Icons.phone_outlined,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'phone must be not empty';
                            }
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultFormField
                        (
                          controller: fireController,
                          type: TextInputType.number,
                          label: 'fire',
                          prefix: Icons.fiber_dvr_outlined,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'fire must be not empty';
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultFormField
                        (
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'email',
                          prefix: Icons.email_outlined,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'email must be not empty';
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultFormField
                        (
                          controller: passwordController,
                          type: TextInputType.text,
                          label: 'password',
                          prefix: Icons.password_outlined,
                          suffix: RigesterCubit.get(context).suffix,
                          suffixPressed: (){
                            RigesterCubit.get(context).changeIconPassword();
                          },
                          isPassword: RigesterCubit.get(context).ispassword,
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'password must be not empty';
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ConditionalBuilder(
                        condition:state is !RigesterLoadingState ,
                        builder:(context)=> MaterialButton(
                            onPressed: (){
                              if(formKey.currentState!.validate())
                              {
                                RigesterCubit.get(context).Rigester(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  fire: fireController.text
                                );
                              }
                            },
                          child: Text('Rigester'),
                          minWidth: double.infinity,
                          color: Colors.blue,
                        ),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

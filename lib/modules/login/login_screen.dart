import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/layout/home_layout.dart';
import 'package:shopping_tranning/modules/login/cubit_login/cubit_login.dart';
import 'package:shopping_tranning/modules/login/cubit_login/states_login.dart';
import 'package:shopping_tranning/modules/rigester/rigester%20screen.dart';
import 'package:shopping_tranning/shared/components/components.dart';
import 'package:shopping_tranning/shared/network/local/sharedprefrence.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, state) {
          if(state is LoginSuccessState)
          {
            if(LoginCubit.get(context).login!.status!)
            {
              CachHelper.saveData(key: 'token', value: LoginCubit.get(context).login!.token).
              then((value)
              {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
              });
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          var formkey=GlobalKey<FormState>();
          var emailController=TextEditingController();
          var passwordController=TextEditingController();
          var fireController=TextEditingController();
          return Scaffold(
            appBar: AppBar(),
            body:  Center(
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Text(
                        'LOGIN',
                        style:Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 30
                        ) ,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                          'LOGIN To Shopping',
                          style:Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 20
                          )
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultFormField(
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
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultFormField(
                            controller: passwordController,
                            type: TextInputType.text,
                            label: 'password',
                            prefix: Icons.password,
                            validate: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Password must be not empty';
                              }
                            }
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultFormField(
                            controller: fireController,
                            type: TextInputType.text,
                            label: 'fire',
                            prefix: Icons.face,
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
                          child: ConditionalBuilder(
                            condition: state is ! LoginLoadingState ,
                            builder: (context)=>MaterialButton(
                                onPressed: (){
                                  if(formkey.currentState!.validate())
                                  {
                                    LoginCubit.get(context).LoginUser(
                                        email: emailController.text,
                                        pass: passwordController.text,
                                        fire: fireController.text);
                                  }
                                },
                               child: Text('LOGIN'),
                              minWidth: double.infinity,
                              color: Colors.blue,
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Donn\'t have an account'),
                          TextButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute
                                      (builder: (context)=>RigesterScreen()
                                    )
                                );
                              },
                              child: Text('Rigester Now'))
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}

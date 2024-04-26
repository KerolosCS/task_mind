import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mind/Features/auth/presentation/views/widgets/custom_elevated_btn.dart';
import 'package:task_mind/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:task_mind/Features/home/presentation/views/home_veiw.dart';
import 'package:task_mind/core/utils/my_functions.dart';
import 'package:task_mind/core/utils/widgets/TextInputFeild.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  GlobalKey<FormState> formKeyLog = GlobalKey();
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Login Succesfully'),
              ));
              MyFunctions.navigation(context, const HomeView());
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) => SingleChildScrollView(
            child: (state is LoginLoading || state is LoginSuccess)
                ? Center(
                    child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .5 - 20,
                        ),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  ))
                : Form(
                    key: formKeyLog,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * .015),
                        const Image(
                          height: 85,
                          width: 85,
                          image: AssetImage('assets/images/logo_h.png'),
                        ),
                        Text(
                          'welcome'.tr(),
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * .05),
                        InputWidget(
                          controller: emailCont,
                          validation: (s) =>
                              s!.isEmpty ? 'Please enter your email' : null,
                          txt: 'البريد الالكتروني ',
                          icon: Icons.email,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InputWidget(
                          obs: true,
                          controller: passCont,
                          validation: (s) =>
                              s!.isEmpty ? 'Please enter your password' : null,
                          txt: 'كلمه المرور',
                          icon: Icons.lock_outline,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'نسيت كلمه المرور',
                                style: TextStyle(color: Color(0xff999999)),
                              ),
                            )
                          ],
                        ),
                        CustomElevatedBtn(
                          onPressed: () {
                            if (formKeyLog.currentState!.validate()) {
                              context
                                  .read<HomeCubit>()
                                  .login(emailCont.text, passCont.text);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ليس لديك حساب ؟',
                              style: TextStyle(
                                color: Color(0xff999999),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {},
                              child: const Text(
                                'سجل الآن',
                                style: TextStyle(
                                  color: Color(0xff38D39F),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .13,
                        ),
                        const Text(
                          'or sign in with ',
                          style: TextStyle(
                            color: Color(0xff38D39F),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.apple_outlined,
                                color: Colors.black,
                                size: 40,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook_outlined,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Image.asset(
                              'assets/images/google.png',
                              height: 32,
                              width: 32,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

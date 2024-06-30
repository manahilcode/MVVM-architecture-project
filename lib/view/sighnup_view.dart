import"package:flutter/material.dart";
import "package:mvvm_archi_provider/res/components/round_button.dart";
import "package:mvvm_archi_provider/utils/routes/routes_name.dart";
import "package:mvvm_archi_provider/utils/utils.dart";
import "package:mvvm_archi_provider/view_model/auth_viewmodel.dart";
import "package:provider/provider.dart";
class SighnUpView extends StatefulWidget {
  const SighnUpView({Key? key}) : super(key: key);

  @override
  State<SighnUpView> createState() => _SighnUpViewState();
}

class _SighnUpViewState extends State<SighnUpView> {
  ValueNotifier _obsecurePasword=ValueNotifier<bool>(true);

  TextEditingController _emailController=TextEditingController();
  TextEditingController _PasswordController=TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final authViewModel =Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
          centerTitle:true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
                onFieldSubmitted: (value){
                  Utils.feildFocusChange(context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(valueListenable: _obsecurePasword, builder: (context,value,child){
                return   TextFormField(
                    controller: _PasswordController,
                    obscureText: _obsecurePasword .value,
                    obscuringCharacter: "*",
                    focusNode:passwordFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecurePasword.value=!_obsecurePasword.value;
                        },
                        child: Icon(
                            _obsecurePasword.value?Icons.visibility_off_outlined:
                            Icons.visibility
                        ),
                      ),
                    )
                );
              }
              ),
              SizedBox(
                height: height*.1,
              ),
              RoundButton(
                title: "SignUp", onPress: () {
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please enter email", context);
                }else if(_PasswordController.text.isEmpty){
                  Utils.flushBarErrorMessage("Please enter password", context);
                }
                else if(_PasswordController.text.length<6){
                  Utils.flushBarErrorMessage("Please enter 6 digit  password", context);
                }else{
                  Map data={
                    'email':_emailController.text.toString(),
                    'password':_PasswordController.text.toString(),

                  };
                  authViewModel.SignUpApi(data,context);
                  print('api hit');
                }
              },
              ),
              SizedBox(height:height* .02,),
              InkWell(
                  onTap: (){Navigator.pushNamed(context, RoutesName.login);},
                  child:Text("Already have an account ? login")
              )
            ],

          ),
        )

    );
  }
}

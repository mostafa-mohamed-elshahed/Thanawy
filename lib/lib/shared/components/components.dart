import 'package:flutter/material.dart';
import 'package:thanawy_programming/lib/modules/web_view_screen.dart';
import 'package:thanawy_programming/lib/shared/styles/icon_broken.dart';


Widget defaultButton({
  String? url,
  BuildContext? context,
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  Function ?function,
  required String ?text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed:(){
         Navigator.push(context!, MaterialPageRoute(builder: (context)=>WebScreenView(url)));
        },
        child: Text(
          isUpperCase ? text!.toUpperCase() : text!,
          style: Theme.of(context!).textTheme.bodyText2
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  required Function ?function,
  required String? text,
}) =>
    TextButton(
      onPressed:()=> function,
      child: Text(
        text!.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
   required Function? validate,
   required String? label,
   required IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (e)=>onSubmit,
      onChanged:(e)=> onChange,
      onTap:()=> onTap,
      validator:(e)=> validate!(e),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed:()=> suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

PreferredSizeWidget defaultAppBar({
  required BuildContext? context,
  String? title,
  List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context!);
    },
    icon: Icon(
      IconBroken.Arrow___Left_2,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title!,
  ),
  actions: actions,
);


Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );


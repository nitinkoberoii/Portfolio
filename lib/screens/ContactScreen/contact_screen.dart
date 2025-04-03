import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<TextEditingController> controllers = [
    TextEditingController(), // Name
    TextEditingController(), // Email
    TextEditingController(), // Contact
    TextEditingController(), // Message
  ];

  ValueNotifier<String?> selectedFileName = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "REACH OUT TO ME",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontFamily: "Poppins",
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(height: height * 0.055),
                  Text(
                    Constants.phoneNumber,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    Constants.email,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: height * 0.055),
                  Row(
                    children: [
                      _socialIcons("svgs/instagram.svg", isDarkMode,
                          Constants.instagramUrl),
                      SizedBox(width: width * 0.008),
                      _socialIcons("svgs/linkedin.svg", isDarkMode,
                          Constants.linkedInUrl),
                      SizedBox(width: width * 0.008),
                      _socialIcons(
                          "svgs/github.svg", isDarkMode, Constants.githubUrl),
                      SizedBox(width: width * 0.008),
                      _socialIcons(
                          "svgs/twitter.svg", isDarkMode, Constants.twitterUrl),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              // ---------------------- contact form ------------------------
              contactForm(height, width, theme, controllers, selectedFileName),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}

Widget contactForm(
  double height,
  double width,
  ThemeData theme,
  List<TextEditingController> controllers,
  ValueNotifier<String?> fileName,
) {
  return Container(
    height: height * 0.50,
    width: width * 0.40,
    padding: EdgeInsets.symmetric(
      horizontal: width * 0.03,
      vertical: height * 0.03,
    ),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFFAA50F8), // Purple
          Color(0xFFFD7D7D), // Coral
          Color(0xFFFFA567), // Orange
        ],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ANY PROJECTS?",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: "Poppins",
            fontSize: 34,
            color: Colors.white,
          ),
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customTextFields(height, width, theme, "Name", controllers[0]),
            customTextFields(height, width, theme, "Email", controllers[1]),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextFields(height, width, theme, "Contact", controllers[2]),
            customTextFields(height, width, theme, "Message", controllers[3]),
          ],
        ),
        SizedBox(height: height * 0.01),
        attachFileButton(height, width, theme, fileName),
        SizedBox(height: height * 0.01),
        submitButton(
            height, width, theme, controllers, () => sendEmail(controllers)),
      ],
    ),
  );
}

Widget attachFileButton(
  double height,
  double width,
  ThemeData theme,
  ValueNotifier<String?> selectedFileName,
) {
  return ValueListenableBuilder<String?>(
    valueListenable: selectedFileName,
    builder: (context, fileName, child) {
      return Row(
        children: [
          SizedBox(
            width: width * 0.085,
            child: IconButton(
              onPressed: () async {
                try {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null && result.files.isNotEmpty) {
                    selectedFileName.value = result.files.single.name;
                  }
                } catch (e) {
                  debugPrint("File picker error: $e");
                }
              },
              icon: Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_up_doc,
                    size: height * 0.02,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Text(
                    fileName != null && fileName.length > 12
                        ? "${fileName.substring(0, 9)}..." // Truncate if >12 chars
                        : fileName ?? "Attach File",
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget customTextFields(double height, double width, ThemeData theme,
    String label, TextEditingController controller,
    {int maxLines = 1}) {
  return SizedBox(
    height: height * 0.08,
    width: label.contains("Message") ? width * 0.34 : width * 0.15,
    child: TextField(
      controller: controller,
      cursorHeight: height * 0.02,
      cursorColor: Colors.white,
      maxLines: label.contains("Message") ? null : maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.bodySmall?.copyWith(
          fontSize: 15,
          color: Colors.white,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      style: theme.textTheme.bodySmall?.copyWith(fontSize: 15),
    ),
  );
}

void sendEmail(List<TextEditingController> controllers) async {
  final name = controllers[0].text;
  final email = controllers[1].text;
  final contact = controllers[2].text;
  final message = controllers[3].text;

  const String recipientEmail = Constants.email;
  final String subject = Uri.encodeComponent("New Contact Form Submission");
  final String body = Uri.encodeComponent(
      "Name: $name\nEmail: $email\nContact: $contact\nMessage: $message");

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: recipientEmail,
    query: 'subject=$subject&body=$body',
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    debugPrint("Could not launch email client.");
  }
}

Widget submitButton(double height, double width, ThemeData theme,
    List<TextEditingController> controllers, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      height: height * 0.052,
      width: width * 0.11,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Submit now ",
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFA567), // Orange
                  Color(0xFFFD7D7D), // Coral
                  Color(0xFFAA50F8), // Purple
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, 0.5, 1.0],
                tileMode: TileMode.repeated,
              ),
            ),
            child: SvgPicture.asset("svgs/arrow.svg"),
          ),
        ],
      ),
    ),
  );
}

void _openLink(String? linkUrl) async {
  final Uri url = Uri.parse(linkUrl!);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not launch $linkUrl";
  }
}

Widget _socialIcons(String assetPath, bool isDarkMode, String linkUrl) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () => _openLink(linkUrl),
      icon: SvgPicture.asset(
        assetPath,
        height: 18,
        color: isDarkMode ? Colors.white70 : Colors.black,
      ),
    ),
  );
}

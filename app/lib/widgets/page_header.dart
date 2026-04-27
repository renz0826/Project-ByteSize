import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/theme.dart';

// VARIANTS (PageHeaderType):
//   plain     — already handled globally in main_layout.dart
//               via the pages list so do NOT add it manually inside screen files
//   withBack  — shows a back arrow + title and used on detail or form screens
//               that are pushed on top of the main layout (e.g. Navigator.push)
//
// REQUIRED PARAMETERS:
//   title     — the text displayed as the page heading
//
// OPTIONAL PARAMETERS:
//   type      — PageHeaderType.plain (default) or PageHeaderType.withBack
//   onBack    — custom callback when the back arrow is tapped; if not provided,
//               defaults to Navigator.of(context).pop()
// USAGE — withBack (detail or form screens pushed via Navigator):
//
//   // basic — back arrow auto-calls Navigator.pop()
//   PageHeader(
//     title: 'Back to Records',
//     type: PageHeaderType.withBack,
//   )
//   // with a custom back action (e.g. show discard dialog before popping)
//   PageHeader(
//     title: 'Back to Records',
//     type: PageHeaderType.withBack,
//     onBack: () {
//       // your custom logic here
//       Navigator.of(context).pop();
//     },
//   )

enum PageHeaderType { plain, withBack }

class PageHeader extends StatelessWidget {
  final String title;
  final PageHeaderType type;
  final VoidCallback? onBack;

  const PageHeader({
    super.key,
    required this.title,
    this.type = PageHeaderType.plain,
    this.onBack,
  });

  BoxDecoration get _containerDecoration => BoxDecoration(
  color: AppTheme.white500,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(24),     
    bottomLeft: Radius.circular(24),
  ),
  boxShadow: AppTheme.floatShadow,
);

  @override
  Widget build(BuildContext context) {
    if (type == PageHeaderType.plain) {
      return Container(
        height: 108,  
        margin: const EdgeInsets.only(left: 24, bottom: 40),
        padding: const EdgeInsets.only(left: 32),
        decoration: _containerDecoration,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: GoogleFonts.beVietnamPro(
            fontSize: 20,
            fontWeight: FontWeight.w700, 
            color: AppTheme.black500,
            letterSpacing: 0.2,
          ),
          ),
        ),
        );
    }

    // withBack
    return Container(
      height: 108,
      margin: const EdgeInsets.only(left: 24, bottom: 40),
      padding: const EdgeInsets.only(left: 32),
      decoration: _containerDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back_rounded, color: AppTheme.black500, size: 32),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.beVietnamPro(
            fontSize: 20,
            fontWeight: FontWeight.w700, 
            color: AppTheme.black500,
            letterSpacing: 0.2,
          ),
          ),
        ],
      ),
    );
  }
}
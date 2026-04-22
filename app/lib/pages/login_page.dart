import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import '../widgets/horizontal_logo.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() =>
      _LoginPageState(); // create a login state
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;
    final errorMessage = authState.maybeWhen(
      error: (error, stack) => error.toString(),
      orElse: () => null,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  const Color(0xFF388037),
                ],
                stops: const [0.8, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ShaderMask(
              blendMode: BlendMode.dstIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.8],
                ).createShader(bounds);
              },
              child: const InfiniteScrollingIcons(
                  svgPath: 'assets/icons/bg-icons.svg'),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 12),
                      const HorizontalLogo(
                        logoHeight: 68,
                      )
                    ],
                  ),
                  const SizedBox(height: 34),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Enter your PIN to continue',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 24),

                        TextField(
                          controller: _pinController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: Color(0xFFB5B5B5)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color(0xFFB5B5B5), width: 2),
                            ),
                          ),
                        ),
                        if (errorMessage != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            errorMessage,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const SizedBox(height: 24),
                        // login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _submitPin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF388037),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 10,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Login',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(width: 12),
                                      Icon(Icons.arrow_forward, size: 18),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitPin() {
    // this function runs when the "enter pin" button is clicked
    final enteredPin = _pinController.text.trim();
    if (enteredPin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your PIN.')),
      );
      return;
    }
    if (enteredPin.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PIN must be exactly 4 digits.')),
      );
      return;
    }

    ref.read(authControllerProvider.notifier).login(
          // send pin to auth_controller
          enteredPin,
          () => Navigator.pushReplacementNamed(context, '/dashboard'),
        );
  }
}

//for the icons animation & loop
class InfiniteScrollingIcons extends StatefulWidget {
  final String svgPath;
  const InfiniteScrollingIcons({super.key, required this.svgPath});

  @override
  State<InfiniteScrollingIcons> createState() => _InfiniteScrollingIconsState();
}

class _InfiniteScrollingIconsState extends State<InfiniteScrollingIcons> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
        initialScrollOffset:
            5000); //start at a high offset to allow scrolling left
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollLoop());
  }

  void _scrollLoop() async {
    //ensure the widget is still in the tree and controller is attached
    if (!mounted || !_scrollController.hasClients) return;

    final double currentOffset = _scrollController.offset;
    final double targetOffset =
        currentOffset - 500; //subtract from offset to scroll left

    await _scrollController.animateTo(
      targetOffset,
      duration: const Duration(seconds: 20), // slow efect
      curve: Curves.linear,
    );

    if (mounted) {
      //reset to a high offset to create an infinite loop effect
      if (_scrollController.offset <= 1000) {
        _scrollController.jumpTo(5000);
      }
      _scrollLoop();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1000, //to ensure it scrolls indefinitely
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              widget.svgPath,
              height: 200,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}

import 'package:dentcity_management_system/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/app_providers.dart'; 
import '../widgets/horizontal_logo.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/main_buttons.dart';
import 'dart:async';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() =>
      _LoginPageState(); // create a login state
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _pinController = TextEditingController();
  bool _isNavigating = false;
  String? _localValidationError; // add local error variable

  // Visibility state matching your security account settings cards
  bool _isPinObscured = true;

  // Timer Variable
  Timer? _countdownTimer;
  int _secondsRemaining = 0;
  
  // so the error disappears
  @override
  void initState() {
    super.initState();
    _pinController.addListener(() {
      if (_localValidationError != null) {
        setState(() => _localValidationError = null);
      }
    });
  }

  void _startTimer(DateTime lockoutUntil) {
    _countdownTimer?.cancel(); // Cancel any existing timer to avoid duplicates
    
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (now.isBefore(lockoutUntil)) {
        if (mounted) {
          setState(() {
            _secondsRemaining = lockoutUntil.difference(now).inSeconds;
          });
        }
      } else {
        timer.cancel(); // timer hit zero here
        ref.read(authControllerProvider.notifier).refreshLockoutStatus();
        if (mounted) {
          _pinController.clear(); 
        }
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel(); // Prevent memory leaks
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final staffAsync = ref.watch(currentStaffProvider); // Watch the database

    // Listen to the database and start the timer if locked out
    ref.listen(currentStaffProvider, (previous, next) {
      final staff = next.value;
      if (staff != null && staff.lockoutUntil != null) {
        final now = DateTime.now();
        if (now.isBefore(staff.lockoutUntil!)) {
          _startTimer(staff.lockoutUntil!);
        }
      }
    });

    // Check if currently locked out based on database
    final staff = staffAsync.value;
    final isLockedOut = staff != null && 
        staff.lockoutUntil != null && 
        DateTime.now().isBefore(staff.lockoutUntil!);

    final isLoading = authState.isLoading;
    final showLoading = isLoading || _isNavigating;
    
    // Get generic error from auth controller
    final errorMessage = _localValidationError ?? authState.maybeWhen(
      error: (error, stack) => error.toString(),
      orElse: () => null,
    );

    // Show the timer counting down
    if (isLockedOut) {
      final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
      final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
      setState(() {
        _localValidationError = "Too many failed attempts. Locked out for $minutes:$seconds.";
      });  
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFF01FF01),
                ],
                stops: [0.8, 1.5],
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 12),
                      HorizontalLogo(
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
                      boxShadow: AppTheme.floatShadow,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24),
                        Text('Enter your PIN to continue',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.normal)),
                        const SizedBox(height: 24),

                        TextField(
                          controller: _pinController,
                          // Controlled via your dynamic local state token parameter
                          obscureText: _isPinObscured,
                          enabled: !isLockedOut, // Completely disables typing when locked out
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          decoration: InputDecoration(
                            filled: isLockedOut, 
                            fillColor: isLockedOut ? Colors.grey.shade200 : Colors.white,
                            contentPadding:
                                const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 48.0), // Extra left padding added to center digits properly while keeping icon aligned
                            // ─── ✅ NEW: INJECTED VISIBILITY ICON HANDLER PATH WITH SPACING ───
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: IconButton(
                                  icon: Icon(_isPinObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                  color: const Color(0xFFB5B5B5),
                                  onPressed: () => setState(() => _isPinObscured = !_isPinObscured),
                                ),
                              ),
                            ),
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
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
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
                        Button(
                          onPressed: (isLoading || isLockedOut) ? null : _submitPin,
                          label: "Login",
                          width: double.infinity,
                          icon: Icons.arrow_forward_rounded,
                          iconPlacement: IconPlacement.right,
                          isLoading: showLoading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
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

    //to clear any pervious local error before running validation
    setState(() => _localValidationError = null);

    if (enteredPin.isEmpty) {
      setState(() => _localValidationError = 'Please enter your PIN.');
      return;
    }
    if (enteredPin.length != 4) {
      setState(() => _localValidationError = 'PIN must be exactly 4 digits.');
      return;
    }

    ref.read(authControllerProvider.notifier).login(
        // send pin to auth_controller
        enteredPin, () {
      if (mounted) {
        setState(() {
          _isNavigating = true; // Lock the button in the loading state!
        });
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    });
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
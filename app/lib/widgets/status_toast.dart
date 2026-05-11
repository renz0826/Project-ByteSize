import 'package:flutter/material.dart';
import '/../style/theme.dart';

class StatusToast extends StatefulWidget {
  final bool isSuccess; // Determines if it's green/check or red/x
  final String title;
  final String message;
  final VoidCallback? onClose;

  const StatusToast({
    super.key,
    required this.isSuccess,
    required this.title,
    required this.message,
    this.onClose,
  });

  // --- THE NEW GLOBAL TRIGGER FUNCTION ---
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    bool isSuccess = true,
  }) {
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => StatusToast(
        isSuccess: isSuccess,
        title: title,
        message: message,
        onClose: () {
          overlayEntry.remove(); // Removes it from the screen when done
        },
      ),
    );

    // Inserts the toast floating on top of the entire app
    Overlay.of(context).insert(overlayEntry);
  }

  @override
  State<StatusToast> createState() => _StatusToastState();
}

class _StatusToastState extends State<StatusToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(curve);

    _controller.forward();

    // ---> THE 3-SECOND AUTO HIDE MOVED HERE <---
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _closeToast();
      }
    });
  }

  // Helper method to gracefully reverse the animation before destroying
  void _closeToast() {
    _controller.reverse().then((_) {
      if (widget.onClose != null) {
        widget.onClose!();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.isSuccess ? AppTheme.green300 : AppTheme.red600,
        shape: BoxShape.circle,
      ),
      child: Icon(
        widget.isSuccess ? Icons.check : Icons.close,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      right: 32,
      child: Material(
        color: Colors.transparent, // Required to keep text styling normal inside Overlays
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                  color: AppTheme.white500,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: AppTheme.cardShadow),
              child: Row(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIcon(),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.title,
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Text(widget.message,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: _closeToast, // Tap to close early!
                    child: const Icon(
                      Icons.close,
                      color: AppTheme.gray500,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
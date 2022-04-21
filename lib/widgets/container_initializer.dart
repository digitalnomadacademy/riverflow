// class SyncContainerInitializer extends StatefulWidget {
//   final Widget loader;
//   final Widget child;
//   final ProviderContainer Function(ProviderContainer parent) init;
//   final ProviderContainer? parent;
//
//   const SyncContainerInitializer(
//       {Key? key,
//       this.parent,
//       required this.loader,
//       required this.child,
//       required this.init})
//       : super(key: key);
//
//   @override
//   State<SyncContainerInitializer> createState() => _SyncContainerInitializerState();
// }
//
// class _SyncContainerInitializerState extends State<SyncContainerInitializer> {
//   bool initialized = false;
//   ProviderContainer? container;
//
//   @override
//   Widget build(BuildContext context) {
//     return initialized
//         ? UncontrolledProviderScope(
//             container: container ?? ProviderContainer(parent: widget.parent),
//             child: widget.child)
//         : widget.loader;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     widget.init().then((pc) {
//       setState(() {
//         initialized = true;
//         container = pc;
//       });
//     });
//   }
// }

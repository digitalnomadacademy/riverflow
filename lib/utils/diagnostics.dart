import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ProviderContainerSignature {
  final ProviderContainer providerContainer;

  ProviderContainerSignature(this.providerContainer);
}

mixin ModuleDiagnosticMixin on DiagnosticableTreeMixin
    implements ProviderContainerSignature {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.sparse;

    properties.add(DiagnosticableTreeNode(
        name: '$runtimeType Diagnostic',
        value: ModuleDiagnosticTree(providerContainer, runtimeType.toString()),
        style: DiagnosticsTreeStyle.sparse));
  }
}

class ModuleDiagnosticTree extends DiagnosticableTree {
  final ProviderContainer providerContainer;
  final String moduleName;

  ModuleDiagnosticTree(this.providerContainer, this.moduleName);

  @override
  String toStringShort() {
    return moduleName;
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    var properties = <DiagnosticsNode>[];
    properties.add(StringProperty('name', moduleName));

    if (providerContainer.debugChildren.isNotEmpty) {
      properties.add(DiagnosticableTreeNode(
          name: 'children',
          value: ModuleChildrenDiagnosticTree(providerContainer.debugChildren),
          style: DiagnosticsTreeStyle.sparse));
    }

    var elements = providerContainer.getAllProviderElements();

    properties.add(
      DiagnosticableTreeNode(
          name: 'elements',
          style: DiagnosticsTreeStyle.dense,
          value: ProviderElementsDiagnostic(elements)),
    );

    return properties;
  }
}

/// This diagnostics are used to add all children as a separate entry to a scope
class ModuleChildrenDiagnosticTree extends DiagnosticableTree {
  ModuleChildrenDiagnosticTree(this.children);

  final List<ProviderContainer> children;

  @override
  String toStringShort() {
    return '${children.length}';
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    return children
        .map((providerContainer) => DiagnosticableTreeNode(
            name: '_',
            value: ModuleDiagnosticTree(providerContainer, 'gotta implement'),
            style: DiagnosticsTreeStyle.sparse))
        .toList();
  }
}

/// this class groups mappings into a tree
class ProviderElementsDiagnostic extends DiagnosticableTree {
  final Iterable<ProviderElementBase> elements;

  ProviderElementsDiagnostic(this.elements);

  @override
  String toStringShort() {
    return elements.length.toString();
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    var properties = elements.map<DiagnosticsNode>((element) {
      if (element.getState() is DiagnosticableTree) {
        /// This way you can group things by implementing [DiagnosticableTreeNode]
        return (DiagnosticableTreeNode(
            name: element.getState().runtimeType.toString(),
            value: element.getState() as DiagnosticableTree,
            style: DiagnosticsTreeStyle.dense));
      } else if (element.getState() is Diagnosticable) {
        return (element.getState() as Diagnosticable).toDiagnosticsNode();
      } else {
        return (DiagnosticsProperty(element.getState().runtimeType.toString(),
            element.getState().toString()));
      }
    }).toList();

    return properties;
  }
}

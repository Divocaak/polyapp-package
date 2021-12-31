#import "PolyAppPlugin.h"
#if __has_include(<polyapp/polyapp-Swift.h>)
#import <polyapp/polyapp-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "polyapp-Swift.h"
#endif

@implementation PolyAppPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPolyAppPlugin registerWithRegistrar:registrar];
}
@end

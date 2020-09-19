#import "FullscreenPlugin.h"
#if __has_include(<fullscreen/fullscreen-Swift.h>)
#import <fullscreen/fullscreen-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "fullscreen-Swift.h"
#endif

@implementation FullscreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFullscreenPlugin registerWithRegistrar:registrar];
}
@end

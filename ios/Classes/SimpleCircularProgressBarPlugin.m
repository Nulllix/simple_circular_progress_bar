#import "SimpleCircularProgressBarPlugin.h"
#if __has_include(<simple_circular_progress_bar/simple_circular_progress_bar-Swift.h>)
#import <simple_circular_progress_bar/simple_circular_progress_bar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "simple_circular_progress_bar-Swift.h"
#endif

@implementation SimpleCircularProgressBarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimpleCircularProgressBarPlugin registerWithRegistrar:registrar];
}
@end

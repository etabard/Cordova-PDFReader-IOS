#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "ReaderViewController.h"
#import <UIKit/UIKit.h>

@interface PDFReader : CDVPlugin <ReaderViewControllerDelegate>
{

}
- (void)open: (CDVInvokedUrlCommand*)command;
@end
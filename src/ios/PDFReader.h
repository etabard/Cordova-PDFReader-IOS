#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "ReaderViewController.h"
#import <UIKit/UIKit.h>

@interface PDFReader : CDVPlugin <ReaderViewControllerDelegate>
{
    ReaderViewController* readerViewController;
}

@property (nonatomic, retain) ReaderViewController *readerViewController;

- (void)open: (CDVInvokedUrlCommand*)command;
- (void)closePDFReader;
@end
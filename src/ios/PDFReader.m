#import "PDFReader.h"
#import "ReaderViewController.h"
#import "ReaderConstants.h"
#import "ReaderThumbCache.h"
#import "ReaderColors.h"


@implementation PDFReader
@synthesize readerViewController;
@synthesize callbackId;

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)start: (CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;
}
- (void)open: (CDVInvokedUrlCommand*)command
{
    NSString* filePath = [command.arguments objectAtIndex:0];
    NSString* password = [command.arguments objectAtIndex:1];
    BOOL flatUI = [[command.arguments objectAtIndex:2]  isEqual: [NSNumber numberWithInt:1]];
    BOOL showShadows = [[command.arguments objectAtIndex:3]  isEqual: [NSNumber numberWithInt:1]];
    BOOL enableThumbs = [[command.arguments objectAtIndex:4]  isEqual: [NSNumber numberWithInt:1]];
    BOOL disableRetina = [[command.arguments objectAtIndex:5]  isEqual: [NSNumber numberWithInt:1]];
    BOOL enablePreview = [[command.arguments objectAtIndex:6]  isEqual: [NSNumber numberWithInt:1]];
    BOOL bookmarks = [[command.arguments objectAtIndex:7]  isEqual: [NSNumber numberWithInt:1]];
    NSString* toolbarBackgroundColor = [command.arguments objectAtIndex:10];
    NSString* textColor = [command.arguments objectAtIndex:11];
    BOOL enableShare = [[command.arguments objectAtIndex:12]  isEqual: [NSNumber numberWithInt:1]];
    NSInteger pageNumber = [[command.arguments objectAtIndex:13] intValue];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:password];

    if (pageNumber > 1) {
        document.pageNumber = [NSNumber numberWithInteger:pageNumber];
    }

    ReaderConstants *readerConstants = [ReaderConstants sharedReaderConstants];
    readerConstants.flatUI = flatUI;
    readerConstants.showShadows = showShadows;
    readerConstants.enableThumbs = enableThumbs;
    readerConstants.disableRetina = disableRetina;
    readerConstants.enablePreview = enablePreview;
    readerConstants.bookmarks = bookmarks;
    readerConstants.enableShare = enableShare;
    
    ReaderColors *readerColors = [ReaderColors sharedReaderColors];

    if ((NSNull *)toolbarBackgroundColor != [NSNull null] && [[ReaderConstants sharedReaderConstants] flatUI]) {
        readerColors.toolbarBackgroundColor = @[[PDFReader colorFromHexString:toolbarBackgroundColor]];
    }
    
    if ((NSNull *)textColor != [NSNull null]) {
        readerColors.textColor = [PDFReader colorFromHexString:textColor];
    }
    
    [self.commandDelegate runInBackground:^{
        CDVPluginResult *pluginResult;
        if ([fileManager fileExistsAtPath:filePath]){
            
            if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
            {
                self.readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
                
                self.readerViewController.delegate = self; // Set the ReaderViewController delegate to self
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.viewController presentViewController:readerViewController animated:YES completion:nil];
                });
            }
            else // Log an error so that we know that something went wrong
            {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"filepath error"];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"filepath error"];
        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

-(void) closePDFReader
{
    if (self.callbackId) {
        CDVPluginResult* pluginResult = nil;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"closed"];
        [pluginResult setKeepCallback:[NSNumber numberWithBool:YES]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.callbackId];
    }
    [self.readerViewController dismissViewControllerAnimated:YES completion:nil];
    self.readerViewController.delegate = nil;
    self.readerViewController = nil;
}

#pragma mark - ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
    [self closePDFReader];
}



//#pragma mark Delegate methods

- (void)clearCacheForPdfFile:(CDVInvokedUrlCommand*)command
{

  NSString* filePath = [command.arguments objectAtIndex:0];
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:nil];


    NSFileManager *fileManager = [NSFileManager new]; // File manager instance

  NSURL *applicationSupportPath = [fileManager URLForDirectory:NSApplicationSupportDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:NULL];

    NSString *archivePath =  [applicationSupportPath path]; // Application's "~/Library/Application Support" path

  NSString *archiveName = [[document.fileName stringByDeletingPathExtension] stringByAppendingPathExtension:@"plist"];

  NSString *plistPath = [archivePath stringByAppendingPathComponent:archiveName];

    NSLog(@"Clearing cache for document guid %@", document.guid);
    NSLog(@"Remove also archived plist %@", plistPath );

    NSError *error = nil;
    [fileManager removeItemAtPath:plistPath error:&error];
    [ReaderThumbCache removeThumbCacheWithGUID:document.guid];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}
@end

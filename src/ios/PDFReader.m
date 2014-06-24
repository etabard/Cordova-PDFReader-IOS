#import "PDFReader.h"
#import "ReaderThumbCache.h"



@implementation PDFReader

- (void)open: (CDVInvokedUrlCommand*)command
{
	NSString* filePath = [command.arguments objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    CDVPluginResult *pluginResult;
    
    if ([fileManager fileExistsAtPath:filePath]){
        ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:nil];

        if (!document) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"filepath document type error"];
        } else {
            ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
            readerViewController.delegate = self;
            readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:readerViewController];
        
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navigationController animated:YES completion:nil];
        
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"OK"];
        }
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"filepath error"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}



#pragma mark Delegate methods

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
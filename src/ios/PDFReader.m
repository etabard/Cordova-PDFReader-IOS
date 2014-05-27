#import "PDFReader.h"

@implementation PDFReader


- (void)open: (CDVInvokedUrlCommand*)command
{
		NSString* filePath = [command.arguments objectAtIndex:0];
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:nil];

    ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
    readerViewController.delegate = self;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:readerViewController];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navigationController animated:YES completion:nil];
}



#pragma mark Delegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{

	[[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:NULL];

}
@end
//
//	ReaderConstants.h
//	Reader v2.8.6
//
//	Created by Julius Oklamcak on 2011-07-01.
//	Copyright © 2011-2015 Julius Oklamcak. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//	of the Software, and to permit persons to whom the Software is furnished to
//	do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#if !__has_feature(objc_arc)
	#error ARC (-fobjc-arc) is required to build this code.
#endif

#import <Foundation/Foundation.h>

// #define READER_FLAT_UI TRUE
// #define READER_SHOW_SHADOWS TRUE
// #define READER_ENABLE_THUMBS TRUE
// #define READER_DISABLE_RETINA FALSE
// #define READER_ENABLE_PREVIEW TRUE
// #define READER_DISABLE_IDLE FALSE
// #define READER_STANDALONE FALSE
// #define READER_BOOKMARKS TRUE

@interface ReaderConstants : NSObject;

+ (ReaderConstants *)sharedReaderConstants;

/**
 *  If TRUE, follows the Fuglyosity of Flat Fad (flattens the UI).
 *
 *  Default YES if iOS version is equal or greater than 7.0.
 */
@property (nonatomic, assign) BOOL flatUI;

/**
 *  If TRUE, a shadow is shown around each page and page thumbnail.
 *
 *  Default YES.
 */
@property (nonatomic, assign) BOOL showShadows;

/**
 *  If TRUE, a thumbs button is added to the main toolbar enabling page thumbnail document navigation.
 *
 *  Default YES.
 */
@property (nonatomic, assign) BOOL enableThumbs;

/**
 *  If TRUE, sets the CATiledLayer contentScale to 1.0f. This effectively disables retina support and results in non-retina device rendering speeds on retina display devices at the loss of retina display quality.
 *
 *  Default NO.
 */
@property (nonatomic, assign) BOOL disableRetina;

/**
 *  If TRUE, a medium resolution page thumbnail is displayed before the CATiledLayer starts to render the PDF page.
 *
 *  Default YES.
 */
@property (nonatomic, assign) BOOL enablePreview;

/**
 *  If TRUE, the iOS idle timer is disabled while viewing a document (beware of battery drain).
 *
 *  Default NO.
 */
@property (nonatomic, assign) BOOL disableIdle;

/**
 *  If FALSE, a "Done" button is added to the toolbar and the -dismissReaderViewController: delegate method is messaged when it is tapped.
 *
 *  Default NO.
 */
@property (nonatomic, assign) BOOL standalone;

/**
 *  If TRUE, enables page bookmark support.
 *
 *  Default YES.
 */
@property (nonatomic, assign) BOOL bookmarks;

/**
 *  If TRUE, enables share toolbar.
 *
 *  Default YES.
 */
@property (nonatomic, assign) BOOL enableShare;

@end

//
//  ReaderColors.m
//	Reader vX.X.X
//
//	Created by Guillermo Sáenz Urday on 2014-10-20.
//	Copyright © 2011-2014 Julius Oklamcak. All rights reserved.
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

#import "ReaderColors.h"
#import "ReaderConstants.h"

@implementation ReaderColors

+ (ReaderColors *)sharedReaderColors{
    static ReaderColors *_sharedReaderColors = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedReaderColors = [[self alloc] init];
    });
    
    return _sharedReaderColors;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        // Default Values
        
        if ([[ReaderConstants sharedReaderConstants] flatUI]) {
            self.toolbarBackgroundColor = @[[UIColor colorWithWhite:0.94f alpha:0.94f]];
        } else {
            self.toolbarBackgroundColor = @[[UIColor colorWithWhite:0.92f alpha:0.8f],
                                            [UIColor colorWithWhite:0.32f alpha:0.8f]];
            ;
        }
        
        self.textColor = [UIColor blackColor];
    }
    
    return self;
}

@end

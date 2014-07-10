Cordova-PDFReader-IOS
==================

PDF Reader plugin for IOS 7 (based on Reader https://github.com/KiranPanesar/Reader)

![iPod Page](http://i.imgur.com/GPL2Gn2.png)
![iPod Page](http://i.imgur.com/551VLUx.png)
![iPod Page](http://i.imgur.com/0nrtfWd.png)

Installation
------------

To install from **command line**:

    cordova plugin add com.lesfrancschatons.cordova.plugins.pdfreader

or:

    phonegap local plugin add com.lesfrancschatons.cordova.plugins.pdfreader


Documentation
-------------

Supported URI scheme: file
For other schemes, please download it first with cordova plugin fileTransfer.

    //Open a pdf
    PDFReader.open('absolutepath.pdf', success, error);

    //Clear PDF Reader cache
    PDFReader.clearCache(filePath, finishedCallback);


You can also configure a few options here : https://github.com/etabard/Cordova-PDFReader-IOS/blob/master/src/ios/ReaderFramework/src/ReaderConstants.h#L32-L41

```
#define READER_BOOKMARKS FALSE
#define READER_ENABLE_MORE_BUTTON FALSE
#define READER_ENABLE_MAIL TRUE
#define READER_ENABLE_PRINT TRUE
#define READER_ENABLE_THUMBS TRUE
#define READER_ENABLE_PREVIEW TRUE
#define READER_DISABLE_RETINA FALSE
#define READER_DISABLE_IDLE FALSE
#define READER_SHOW_SHADOWS TRUE
#define READER_STANDALONE FALSE
```

----------
----------
----------

[![Buy me a coffee](http://ko-fi.com/img/button-1.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WJP9FB4YJKXZ2)
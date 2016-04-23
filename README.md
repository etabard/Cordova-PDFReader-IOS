Cordova-PDFReader-IOS
==================

PDF Reader cordova plugin for IOS 7+ (based on Reader https://github.com/vfr/Reader)

Introduction
------------

I've crafted this open source PDF reader code for fellow iOS
developers struggling with wrangling PDF files onto iOS device
screens.

The code is universal and does not require any XIBs (as all UI
elements are code generated, allowing for greatest flexibility).
It runs on iPad, iPhone and iPod touch with iOS 6.0 and up. Also
supported are the Retina displays in all new devices and is ready
to be fully internationalized. The idea was to provide a complete
project template that you could start building from, or, just pull
the required files into an existing project to enable PDF
reading/viewing in your app(s).

![iPad Page](http://i.imgur.com/jaeCPz1.png)

![iPad Thumbs](http://i.imgur.com/1b4kY9s.png)

![iPod Page](http://i.imgur.com/y8wWRDN.png)

![iPod Thumbs](http://i.imgur.com/nddT2RP.png)


Features
------------

Multithreaded: The UI is always quite smooth and responsive.

Supports:

 - iBooks-like document navigation.
 - Device rotation and all orientations.
 - Encrypted (password protected) PDFs.
 - PDF links (URI and go to page).
 - PDFs with rotated pages.
 - PDFs with landscape double page feature

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
    PDFReader.open('absolutepath.pdf', options, success, error);

    //Available options
    {
        password: null,
        flatUI: true,
        showShadows: true,
        enableThumbs: true,
        disableRetina: false,
        enablePreview: true,
        bookmarks: true,
        toolbarBackgroundColor: null,
        textColor: null,
        enableShare: false,
        page: 2
    }

    //Event when PDF Reader is closed
    document.addEventListener('PDFReaderClosed', function() {console.log('closed');})

    //Clear PDF Reader cache
    PDFReader.clearCache(filePath, finishedCallback);




----------
----------
----------

[![Buy me a coffee](http://ko-fi.com/img/button-1.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WJP9FB4YJKXZ2)
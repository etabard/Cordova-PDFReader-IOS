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
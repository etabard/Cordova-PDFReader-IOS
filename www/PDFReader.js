/** 
 * Cordova PDF reader for IOS (based on Reader https://github.com/KiranPanesar/Reader) 
 *
 * Copyright (c) Emmanuel Tabard 2014
 */

var PDFReader = (function () {

});
var exec = function (methodName, options, success, error) {
    cordova.exec(success, error, "PDFReader", methodName, options);
};

PDFReader.prototype.open = function (filePath) {
    
    var setupOk = function () {
        log('setup ok');
    };
    var setupFailed = function () {
        log('setup failed');
    };
    exec('open', [filePath], setupOk, setupFailed);
};

PDFReader.prototype.clearCache = function (filePath, finishedCallback) {
    var setupFailed = function () {
        log('setup failed');
    };
    exec('clearCacheForPdfFile', [filePath], finishedCallback, setupFailed);
};

var PDFReaderInstance = new PDFReader();

module.exports = PDFReaderInstance;
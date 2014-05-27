/** 
 * Cordova PDF reader for IOS (based on Reader https://github.com/KiranPanesar/Reader) 
 *
 * Copyright (c) Emmanuel Tabard 2014
 */

var Reader = (function () {

});
var exec = function (methodName, options, success, error) {
    cordova.exec(success, error, "Reader", methodName, options);
};

Reader.prototype.openPDF = function (filePath) {
    
    var setupOk = function () {
        log('setup ok');
    };
    var setupFailed = function () {
        log('setup failed');
    };
    exec('openPDF', [filePath], setupOk, setupFailed);
};

var ReaderInstance = new Reader();

module.exports = ReaderInstance;
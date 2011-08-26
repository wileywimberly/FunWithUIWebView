
var Logger = function () {
    self.queue = [];
}

Logger.prototype.log = function (msg) {
    self.queue.push(msg);
}

Logger.prototype.dequeue = function () {
    return self.queue.shift();
}

var logger = new Logger();


document.getElementById('output').innerHTML = 'hello, world';

logger.log(document.getElementById('output').innerHTML);


document.getElementById('hello').onclick = function () {
    
    var msg = 'hello from JavaScript';
    
    document.getElementById('output').innerHTML = msg;
    
    document.location = 'js2objc:///' + encodeURIComponent(msg);
    
}
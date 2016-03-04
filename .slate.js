// アプリにフォーカスする。アプリが起動していなければ起動する。
var launch_and_focus = function(app_name) {
    var launch = function(app_names, win) {
        if( _.any(app_names, function(name){ return name == app_name; }) ) {
            return;
        }
 
        win.doOperation(
            slate.operation('shell', {
                'command' : '/usr/bin/open -a ' + app_name,
                'waitForExit' : true
            })
        );
    };
 
    return function(win){
        var app_names = [];
        slate.eachApp(function(app_obj){ app_names.push(app_obj.name()); });
        launch(app_names, win);
        win.doOperation( slate.operation('focus', {'app' : app_name}) );
    };
};
 
var key_binds = {};
key_binds['a:ctrl;cmd'] = launch_and_focus('Google Chrome');
key_binds['q:ctrl;cmd'] = launch_and_focus('iTerm');
key_binds['m:ctrl;cmd'] = launch_and_focus('MacVim');
key_binds['o:ctrl;cmd'] = launch_and_focus('Atom');
key_binds['s:ctrl;cmd'] = launch_and_focus('Slack');
key_binds['c:ctrl;cmd'] = launch_and_focus('CotEditor');
key_binds['z:ctrl;cmd'] = launch_and_focus('Finder');
slate.bindAll(key_binds);

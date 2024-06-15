//Thanks, YellowAfterlife ;)

global.isclickable_var = 0
global.emulatelite = 0

for ({var i;i = 1}; i <= parameter_count(); i += 1) {
    var p; p = parameter_string(i);
    switch (p) {
        case "-nointro":
            room_goto(Main_Title_2)
            break;

        case "-newicon":
            newicon = temp_directory + "\icon2.ico"
            icon_add(newicon)
            window_set_icon(newicon)
            window_set_taskbar_icon(newicon)
            window_set_alttab_icon(newicon)
            room_goto(Techron_Title)
            break;

        case "-nomenu":
            room_goto(Techron_Title)
            break;

        case "-clickablemenu":
            global.isclickable_var = 1
            break;

        case "-lite":
            global.emulatelite = 1
            break;
    }
}

if global.emulatelite = 0 {
    instance_deactivate_object(obj_lite_persist)
}

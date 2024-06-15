//Thanks, YellowAfterlife ;)
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
            room_goto(Techron_Title_1)
            break;

            case "-clickablemenu":
            isclickable_var = 1
            break;
    }
}

isclickable_var = 0

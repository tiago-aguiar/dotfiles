-- install devilspie2
-- put this file at ~/.config/devilspie2/
-- run devilspie2 --bug

print(get_application_name())
print(get_window_geometry())
if (string.find(get_application_name(), "fps")) then
	make_always_on_top()
	undecorate_window()
	xywh(1455, 1836, 432, 270)

end

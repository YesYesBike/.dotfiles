mp.add_key_binding("ctrl+[", "jump_to_a", function()
    local a = mp.get_property_number("ab-loop-a")
    if a then
        mp.commandv("seek", a, "absolute")
        mp.osd_message("Jumped to A: " .. mp.format_time(a))
    else
        mp.osd_message("A point not set")
    end
end)

mp.add_key_binding("ctrl+]", "jump_to_b", function()
    local b = mp.get_property_number("ab-loop-b")
    if b then
        mp.commandv("seek", b, "absolute")
        mp.osd_message("Jumped to B: " .. mp.format_time(b))
    else
        mp.osd_message("B point not set")
    end
end)

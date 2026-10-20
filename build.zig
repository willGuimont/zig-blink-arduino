const std = @import("std");
const microzig = @import("microzig");

const MicroBuild = microzig.MicroBuild(.{ .atmega = true });

pub fn build(b: *std.Build) void {
    const mb = MicroBuild.init(b, b.dependency("microzig", .{})) orelse return;
    const firmware = mb.add_firmware(.{
        .name = "zig-blink-arduino",
        .target = mb.ports.atmega.boards.arduino.uno_rev3,
        .optimize = .ReleaseSmall,
        .root_source_file = b.path("src/main.zig"),
    });
    mb.install_firmware(firmware, .{});
    mb.install_firmware(firmware, .{ .format = .elf });
}

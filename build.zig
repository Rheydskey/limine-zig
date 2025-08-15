const std = @import("std");

pub fn build(b: *std.Build) void {
    const no_pointers = b.option(bool, "no_pointers", "Whether to expose pointers as addresses");

    const config = b.addOptions();
    config.addOption(bool, "no_pointers", no_pointers orelse false);

    const module = b.addModule("limine", .{
        .root_source_file = b.path("src/root.zig"),
    });
    module.addImport("config", config.createModule());
}

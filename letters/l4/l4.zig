const std = @import("std");

export fn print_l4() void {
    var buf: [16]u8 = undefined;

    var writer_impl = std.fs.File.stdout().writer(&buf);
    const writer = &writer_impl.interface;

    writer.writeAll("l") catch {};
    writer.flush() catch {};
}

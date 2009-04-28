local p = {}; p[1] = "foo";


io.write(#p)
p[0] = "bar";

io.write(#p)
p[3] = "fnord";

io.write(#p)
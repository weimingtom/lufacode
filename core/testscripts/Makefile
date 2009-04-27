TESTSCRIPTS = call.luac close.luac closure.luac concat.luac eq.luac forloop.luac global.luac table.luac math.luac math2.luac getupval.luac le.luac len.luac loadbool.luac loadbool2.luac loadk.luac loadnil.luac loadnil2.luac lt.luac move.luac not.luac return.luac self.luac setlist.luac tailcall.luac test.luac testset.luac tforloop.luac unm.luac vararg.luac
LUAC = luac
MAKE = make

all: $(TESTSCRIPTS)
	
clean: 
	rm -f luac/*

$(TESTSCRIPTS): %.luac: %.lua
	$(LUAC) -o luac/$@ $<  

-- whack a mole implementation

function initialise()
	lufa.assets.load("assets.swf") -- should show loading spinner until loaded (although hidden by slime)
	
	showMenu()
	
	lufa.control.ready() -- after loading, bring up slime
end

function showMenu()
	-- hide visible?
	lufa.graphics.clear()

	-- new image using linkage ID
	menuBackground = lufa.graphics.newImage("menu_background")
	menuBackground.position = Point(0, 0)

	-- start button and exit button
	menuButtons = {}
	for i=0,2 do
		menuButtons[i] = lufa.graphics.newImage("menu_button_" .. i)
		menuButtons[i].position = Point(250, 100+i*200)
	end
	
	-- add mouse handlers
	menuButtons[0].addEvent("MOUSE_LEFT_DOWN", startGame);
	menuButtons[1].addEvent("MOUSE_LEFT_DOWN", lufa.control.exit);
end

function startGame(event)
	-- play sound
	lufa.sound.play("click")
	
	lufa.graphics.clear()
	gameBackground = lufa.graphics.newImage("game_background");
	
	createMoles();
	
	-- call updateMoles every 500ms
	updateTimer = lufa.timer.add(updateMoles, 500)
end

function createMoles()	
	-- create grid of 3x3 moles
	moles = {}
	for x=0,3 do
		moles[x] = {}
		for y=0,3 do
			moles[x][y] = lufa.Actor()
			mole = moles[x][y]
			
			-- attach animation name -> linkage
			mole.attachAnimation("idle", "mole_idle")
			mole.attachAnimation("die", "mole_die")
			mole.attachAnimation("dig", "mole_digging")
			
			mole.position = Point(200+x*150, 200+y*150)
			
			mole.play("idle", -1) -- loop idle animation
			
			mole.addEvent("MOUSE_LEFT_DOWN", clickedMole)
			
			mole.alive = true
		end
	end
end

function updateMoles()
	for x=0,3 do
		for y=0,3 do
			mole = moles[x][y]
			
			if not mole.alive then
				if lufa.random.number(0, 100) == 1 then
					mole.alive = true
					mole.visible = true
				end
			else
				if lufa.random.number(0, 200) == 1 then
					mole.alive = false
					mole.play("dig")
					mole.visible = false
				end
			end
		end
	end
end

function clickedMole(event)
	-- passes through clicked object
	mole_clicked = event.object
	
	-- adds one to score
	if mole_clicked.alive then
		mole_clicked.alive = false
		score = score + 1
		
		-- show mole dying then make mole invisible
		mole_clicked.play("die")
		mole_clicked.visible = false
	end
end

initialise()

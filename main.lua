require "ddr"

function love.load()
	arrow.add(10,10,80)
	perfect = false
end

function love.update(dt)
	arrow:move(dt)
	arrow:collision()
	print(s)
	s = s + .10
end

function love.draw()
	board()
	arrow:draw()	
end

math.randomseed(os.time())

function love.keypressed(key)
	perfect = false
	if key == "escape" then
		love.event.quit()
	end
	for j=1, 4 do
		for i,v in ipairs(arrow) do
			if v.lane == j and key == keys[j] then
				if v.y >= bar.y and v.y + v.h <= bar.y + bar.h then
					v.status = 'perfect'
					score = score + 10
				end
				if v.y >= bar.y - 20 and v.y + v.h <= bar.y + bar.h + 20 and v.status == 'miss' then
					v.status = 'good'
					score = score + 5
				end
			end
		end
	end
end
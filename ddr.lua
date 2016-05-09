arrow = {}
bar = {x=0,y=620,w=370,h=50}
keys = {"left","up","down","right"}
score = 0
s = 250
r=255
g=0
b=0

function board()
	for i=0, 3 do
		love.graphics.setColor(81,81,81,255)
		love.graphics.rectangle("fill",10+(i*100),0,50,720)
	end
		love.graphics.setColor(255,255,255,100)
		love.graphics.rectangle("fill",bar.x,bar.y,bar.w,bar.h)
end

function arrow.add(x,y,num,speed)
	for i=0, num-1 do
		table.insert(arrow,{x=x,y=-i*100,lane=math.ceil(math.random(1, 4)),h=50, status='miss'})
	end
end

function gradient()
	if r >= 255 and g <= 0 then
		b = b + 5
	end
	if b >= 255 and g <= 0 then
		r = r - 5
	end
	if b >= 255 and r <= 0 then
		g = g + 5
	end
	if g >= 255 and r <= 0 then
		b = b - 5
	end
	if g >= 255 and b <= 0 then
		r = r + 5
	end
	if r >= 255 and b <= 0 then
		g = g - 5
	end 
end

function arrow:draw()
	for i,v in ipairs(arrow) do
		love.graphics.setColor(r,g,b)
		if v.lane == 1 then
			love.graphics.polygon("fill",v.x,v.y+25,v.x+50,v.y,v.x+50,v.y+50)
			love.graphics.setColor(255,255,255)
			love.graphics.print(v.status, v.x, v.y)
		elseif v.lane == 2 then
			love.graphics.polygon("fill",v.x+100,v.y+50,v.x+125,v.y,v.x+150,v.y+50)
			love.graphics.setColor(255,255,255)
			love.graphics.print(v.status, v.x+100, v.y)
		elseif v.lane == 3 then
			love.graphics.polygon("fill",v.x+200,v.y,v.x+250,v.y,v.x+225,v.y+50)
			love.graphics.setColor(255,255,255)
			love.graphics.print(v.status, v.x+200, v.y)
		elseif v.lane == 4 then
			love.graphics.polygon("fill",v.x+300,v.y,v.x+350,v.y+25,v.x+300,v.y+50)
			love.graphics.setColor(255,255,255)
			love.graphics.print(v.status, v.x+300, v.y)
		end
	end
end

function arrow:move(dt)
	for i,v in ipairs(arrow) do
		v.y = v.y + s*dt
	end
end

function arrow:collision()
	for i,v in ipairs(arrow) do
		if (v.y > bar.y + bar.h) then
			v.status = 'miss'
		end
	end
end

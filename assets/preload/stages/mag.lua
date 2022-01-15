function onCreate()

makeLuaSprite('bg','magbg',-611, -363.9)
addLuaSprite('bg',false)

end


local u = 0

local beettween = 1
local beet = false
function onUpdate(elapsed)
	if u == 2 then
		scaleObject('gf',0.5,0.5)
		updateHitbox('gf')
	end

	u = u + 1



	if beet then
		setProperty('camGame.zoom',beettween)
		setProperty('camHUD.zoom',((beettween/3)-1/3)+1)
	end

	if beettween > 1 then
		beettween = beettween - 0.02
	end
	
end
function goodNoteHit(id,data,type,sus)

	if type == 'No Animation' then

		if data == 0 then
			anim = 'singLEFT'
		end
		if data == 1 then
			anim = 'singDOWN'
		end
		if data == 2 then
			anim = 'singUP'
		end
		if data == 3 then
			anim = 'singRIGHT'
		end



		triggerEvent('Play Animation',anim,'1')

	end

end
function opponentNoteHit(id,data,type,sus)

	if type == 'No Animation' then

		if data == 0 then
			anim = 'singLEFT-dm'
		end
		if data == 1 then
			anim = 'singDOWN-dm'
		end
		if data == 2 then
			anim = 'singUP-dm'
		end
		if data == 3 then
			anim = 'singRIGHT-dm'
		end



		triggerEvent('Play Animation',anim,'0')

	else

		triggerEvent('Screen Shake','0.1,0.005','')

	end

end

function onBeatHit()

	if beet then
		beettween = 1.2
	end
end

function onMoveCamera(c)

	if c == 'dad' then
		setProperty('defaultCamZoom',0.8)
	else
		setProperty('defaultCamZoom',1.2)
	end

end

function onEvent(n,v1,v2)
if n == "Trigger BG Ghouls" then

beet = v1 == ''

end

end
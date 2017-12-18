p = peripheral.wrap("top")

function start()
	local h = fs.open("combinaison","r")
	while true do
		adresse = h.readLine()
		state = p.stargateState()
		if state[0] ~= Offline then
			p.disconnect()
		end
		if p.dial(adresse) == true then
			print(adresse)
		end
		sleep(0)
	end
	h.close()
end

start()

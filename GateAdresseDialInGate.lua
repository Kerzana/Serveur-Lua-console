p = peripheral.wrap("top")

function start()
	local h = fs.open("combinaison","r")
	while true do
		adresse = h.readLine()
		state = p.stargateState()
		if state[0] ~= Offline then
			p.disconnect()
		end
		if p.dial(adresse.."-00") == true then
			print(adresse.."-00")
		end
		sleep(0)
	end
	h.close()
end

start()

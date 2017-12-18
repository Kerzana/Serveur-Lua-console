p = peripheral.wrap("top")

function start()
	i = 0
	while true do
		local h = fs.open("combinaison","r")
		adresse = h.readLine(i)
		state = p.stargateState()
		if state[0] ~= Offline then
			p.disconnect()
		end
		if p.dial(adresse.."-00") == true then
			print(adresse.."-00")
		end
		sleep(0)
		i = i + 1
		h.close()
	end
end

start()

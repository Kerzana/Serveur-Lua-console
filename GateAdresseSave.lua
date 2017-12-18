function saveAdresse(tableauP,column)
	if column == 3 then
		nb = nb + 1
	end
	local h = fs.open("combinaison"..nb,"a")
	for i = 1, #tableauP+1 do
		if i == 5 then
			h.write("-")
		end
		h.write(tableauP[i])
		if i == 5 then
			i = i + 1
		end
	end
	h.write("\n")
	h.close()
end

function checkValid(tableauP,column)
tmp = 0
	for i = 1, #tableauP do
		if tableauP[column] == tableauP[i] then
			if tmp == 2 then
				return false
			end
			tmp = 2
		end
	end
	return true
end

function combinaison(c,tableauP)
	for c = c, 7 do
		if c == 6 then
			sleep(0)
		end
		for symbole = 1, 37 do
			tableauP[c] = string.char(symbole+64)
			if checkValid(tableauP,c) == true then
				saveAdresse(tableauP,c)
				resolv = combinaison(c+1,tableauP)
			end
		end
	end
end

function start()
	term.setCursorPos(1,1)
	term.clear()
	i = 1
	for j = 1, 100 do
		local h = fs.open("combinaison"..j,"w")
		h.close()
	end
	tableauP = {
		[0] = {}
	}
	combinaison(1,tableauP)
end

nb = 0
start()

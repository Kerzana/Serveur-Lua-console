function saveAdresse(tableauP,column)
	if column == 4 then
		nb = nb + 1
		print("combinaison"..nb)
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
tmp = tonumber(0)
	for i = 1, #tableauP do
	tmp1 = string.byte(tableauP[column])
	tmp2 = string.byte(tableauP[i])
		if tonumber(tmp1) == tonumber(tmp2) then
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
		for symbole = 1, 38 do
			if symbole == 37 then
				symbole = 1
				return false
			end
			tableauP[c] = string.char(symbole+64)
			if checkValid(tableauP,c) == true then
				saveAdresse(tableauP,c)
				resolv = combinaison(c+1,tableauP)
			end
		end
	end
end

function start()
term.clear()
	term.setCursorPos(1,1)
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

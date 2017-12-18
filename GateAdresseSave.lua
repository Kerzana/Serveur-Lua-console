function saveAdresse(tableauP)
	local h = fs.open("combinaison","a")
	for i = 1, #tableauP do
		h.write(tableauP[i])
	end
	h.write("0")
	h.write("\n")
	h.close()
	sleep(0)
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

function combinaison(column,tableauP)
	for column = column, 6 do
		for case = 1, 37 do
			tableauP[column] = string.char(case+64)
			if checkValid(tableauP,column) then
				saveAdresse(tableauP)
				relosv = combinaison(column+1,tableauP)
				if relosv == true then
					return false
				end
				if case == 9 then
					tableauP[column] = string.char(65)
					return false
				end
			end
		end
		return true
	end
end

function start()
	term.setCursorPos(1,1)
	term.clear()
	i = 1
	local h = fs.open("combinaison","w")
	h.close()
	tableauP = {
		[0] = {}
	}
	combinaison(1,tableauP)
end

start()

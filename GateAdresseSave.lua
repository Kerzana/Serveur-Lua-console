function saveAdresse(tableauP)
	local h = fs.open("combinaison","a")
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

function combinaison(column,tableauP)
	for column = column, 7 do
		if column == 6 then
			sleep(0)
		end
		for case = 1, 36 do
			tableauP[column] = string.char(case+64)
			if checkValid(tableauP,column) then
				saveAdresse(tableauP)
				relosv = combinaison(column+1,tableauP)
				if relosv == true then
					return false
				end
				if case == 36 then
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

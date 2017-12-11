tableau = {
	[0]={}
}

list = fs.list("Data/")
h=fs.open("savedir","w")

for index = 1, 100 do
	if list[index] then
		h.write(list[index].."\n")
	end
end
h.close()
h=fs.open("savedir","r")

for index = 1, 100 do
	a = h.readLine()
	if a then
	table.insert(tableau, a)
	end
end
h.close()

for index = 1, 100 do
	filename = tableau[index]
	if filename then
	h = fs.open("Data/"..filename,"r")
		for indexx = 1, 100 do
			a = h.readLine()
			if a then
				print(a)
			end	
		end
	h.close()
	end
end

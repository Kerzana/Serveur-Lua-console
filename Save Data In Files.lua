tableautmp = {id=tostring("1"),name= string.lower("kerzana"),perm= tonumber(150),password= "112342123"}
tableautmp2 = {id=tostring("4"),name= string.lower("AtomSauron"),perm= tonumber(40),password= "test-4"}

tableau = {
	[1]={id=tostring("2"),name= string.lower("zalyrys"),perm= tonumber(50),password= "test"},
	[2]={id=tostring("3"),name= string.lower("fantom_wolf"),perm= tonumber(50),password= "test2"}
}

table.insert(tableau, tableautmp)
table.insert(tableau, tableautmp2)

local function lengthtableau()
	for index = 1, 100 do
		tmp = tableau[index].id	
		if tmp then
			lentableau = index
		end
		return index;
	end
end

maxindex = lengthtableau()
for index = 1, maxindex do
	namefile = tableau[index].id
	if namefile then
	h=fs.open("Data/id"..namefile,"w")
	if tableau[index] then
	h.write(tableau[index].name)
	h.write("\n")
	h.write(tableau[index].perm)
	h.write("\n")
	h.write(tableau[index].password)
	h.write("\n")
	h.close("Data/")
	end
	end
end
os.reboot()

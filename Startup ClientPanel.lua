--rednet.open("top")
idsl = "Id du serveur Login"
name = "Kerzana"
perm = 150
request = 1

termXi, termYi = term.getSize()
while true do
local function entete()
	term.clear()
	term.setCursorPos(1,1)
	term.setTextColor(colors.orange)
    for i=1, termXi do
		term.write("~")
	end
	term.setCursorPos(3,2)
	term.write("  >>> Session de "..name..", "..perm.." de permissions.")
	term.setCursorPos(1,4)

	for i=1, termXi do
		term.write("~")
	end	
end

local function enbas(selector)
	term.setCursorPos(1,termYi-3)
	term.setTextColor(colors.orange)
    for i=1, termXi do
		term.write("~")
	end
	term.setCursorPos(3,termYi-2)
	if selector == 5 then
		term.write(">>> Syntaxe <login> <number 0-150> <Card>.")
	elseif selector == 6 then
		term.write(">>> Syntaxe <login> <#PassWord> <Card>.")
	else
		term.write("   >>> Pas de Syntaxe de command.")
	end
	term.setCursorPos(1,termYi)
	for i=1, termXi do
		term.write("~")
	end	
end

while true do
	
	term.clear()
	term.setCursorPos(1,1)
	termXi, termYi = term.getSize()
	term.setTextColor(colors.yellow)
		
	for i=1, termXi do
		term.write("~")
	end
	term.setCursorPos(1,2)
	term.setTextColor(colors.orange)
	term.write(">>> Serveur en attente d'une authentification ...")
	term.setCursorPos(3,4)
	term.write(">>> Inserez votre carte.")
		term.setCursorPos(1,6)
	term.setTextColor(colors.yellow)	
	for i=1, termXi do
		term.write("~")
	end
	
	term.setTextColor(colors.orange)
	term.setCursorPos(3,8)
	event = tonumber(read())
	if event then
		term.setCursorPos(3,8)
		term.setTextColor(colors.yellow)
		term.write(">> Request d'acces au serveur en cours ...")
		sleep(2)
		--rednet.send(idsl, event, "SendPassWordToBaseKerzana")
		--Nan, request = rednet.receive("ReceiveRequestToBaseKerzana")
		--Nan, perm = rednet.receive("ReceivePermToBaseKerzana")
		--Nan, name = rednet.receive("ReceiveNameToBaseKerzana")
		term.setCursorPos(3,10)
		if request == 1 then
			term.setTextColor(colors.green)
			term.write(">> Acces Autoriser.")
		else
			term.setTextColor(colors.red)
			term.write(">> Acces Refuser.")
		end
		sleep(2)
		break
	end
end
	
	
local menu_options = { 
  [1] = {text="Info Player", color=colors.green},
  [2] = {text="Gate Info", color=colors.green},
  [3] = {text="Reactor Info", color=colors.green},
  [4] = {text="Stargate Info", color=colors.green},
  [5] = {text="Change Permission", color=colors.green},
  [6] = {text="Change Password Card", color=colors.orange},
  [7] = {text="Logout Session", color=colors.red}
}

local termX, termY = term.getSize()

local function menuDraw(selected)
	local yPos = termY/2 - #menu_options+3
  for index, data in ipairs(menu_options) do
    menu_options[index].bounds = {
      x1 = 1;
      x2 = 1 + (#data.text+5)+5;
      y = yPos + 3;
    }
    term.setTextColor(data.color)
    term.setCursorPos(1, data.bounds.y)
	
	if index==selected and index == 1 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Infos du joueur logger.")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("                          ")
		 term.setCursorPos(1, data.bounds.y)
		 term.setTextColor(colors.cyan)
	elseif index == selected and index == 2 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Recupere les Etats         ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("  Des portes de la base.     ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	elseif index == selected and index == 3 then
		term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Recupere les Infos         ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("  Des reacteurs de la base.  ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	elseif index == selected and index == 4 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Recupere les Etats         ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("  De la Stargate.            ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	elseif index == selected and index == 5 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Redefinir les perms.        ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("                           ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	elseif index == selected and index == 6 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Modifier Mot de passe. ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("                            ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	elseif index == selected and index == 7 then
		 term.setTextColor(colors.yellow)
		 term.setCursorPos(termXi/3*1.40,8)
		 term.write(" Description : ")
		 term.setCursorPos(termXi/3*1.50,10)
		 term.write("  Se Deconnecter.            ")
		 term.setCursorPos(termXi/3*1.50,11)
		 term.write("                           ")
		 term.setTextColor(colors.cyan)
		 term.setCursorPos(1, data.bounds.y)
	end
	
    local text =
      index==selected and ">> "..data.text.." <" or
      "    "..data.text.."    "
    term.write(text)
    yPos = yPos+1 
  end
end

local function checkClick(x,y)
  for index, data in pairs(menu_options) do
    if x>= data.bounds.x1 and x<= data.bounds.x2 and y==data.bounds.y-0.5 then
      return index 
    end
  end
  return false
end

local function commandsend(selector,perm)
	--rednet.send(idsl, selector, "selectorCommandBaseKerzana")
    --Nan, selectorReturn = rednet.receive("selectorReturnCommandBaseKerzana")
    entete()
    enbas(selector)
    term.setCursorPos(1,6)
    final = 0
    selectorReturn = tonumber(read())
    if selectorReturn then
		if selector == 7 then
			final = 1
			term.setTextColor(colors.yellow)
			term.write("   >> Session en cours de Deconnection...")
		elseif selector == 6 then
			term.setTextColor(colors.yellow)
			term.setCursorPos(1,6)
			term.write("   >> Enter oldPassword :")
			term.setCursorPos(1,7)
			term.write("   >> Enter newPassword :")
			term.setCursorPos(1,8)
			term.write("   >> Repeat newPassword :")
			term.setCursorPos(27,6)
			oldpassword = read("-")
			term.setCursorPos(27,7)
			newpassword = read("*")
			term.setCursorPos(28,8)
			rnewpassword = read("-")
			if newpassword ~= rnewpassword then
				term.setCursorPos(1,10)
				term.setTextColor(colors.red)
				term.write("    >> Les 2 mot de passes ne corresponde pas. ")
				term.setTextColor(colors.yellow)
			else
				term.setCursorPos(1,10)
				term.write("    >> Envoye de la request au serveur. ")
				--rednet.send(idsl,oldpassword, "oldpasswordBaseKerzana")
				--rednet.send(idsl,newpassword, "newpasswordBaseKerzana")
				--Nan, statusoldpassword = rednet.receive("returnoldpasswordBaseKerzana")
				if statusoldpassword == 0 then
					term.setCursorPos(1,11)
					term.setTextColor(colors.red)
					term.write("    >> L'ancien Password est mauvais. ")
					term.setTextColor(colors.yellow)
				else
					term.setCursorPos(1,11)
					--Nan, statusnewpassword = rednet.receive("returnnewpasswordBaseKerzana")
					if statusnewpassword == 1 then
						term.setTextColor(colors.green)
					term.write("    >> Le mot de passe a bien ete modifier. ")
					term.setTextColor(colors.yellow)
				else
					term.setTextColor(colors.red)
					term.write("    >> Erreur est survenue contacter un admin. ")
					term.setTextColor(colors.yellow)
					end
				end
		end
		elseif selector == 5 then
			term.setTextColor(colors.yellow)
			term.setCursorPos(1,6)
			term.write("   >> Enter Pesudo :")
			term.setCursorPos(1,7)
			term.write("   >> Enter newPerm :")
			term.setCursorPos(22,6)
			pseudoperm = read()
			term.setCursorPos(23,7)
			newperm = read()
				term.setCursorPos(1,10)
				term.write("    >> Envoye de la request au serveur. ")
				--rednet.send(idsl,pseudoperm, "pseudopermBaseKerzana")
				--Nan, pseudopermreturn = rednet.receive("returnpseudopermdBaseKerzana")
				if pseudopermreturn == 0 then
					term.setCursorPos(1,11)
					term.setTextColor(colors.red)
					term.write("    >> Le Pseudo n'existe pas. ")
					term.setTextColor(colors.yellow)
				else
					term.setCursorPos(1,11)
					--rednet.send(idsl,newperm, "newpasswordBaseKerzana")
					--Nan, statusnewperm = rednet.receive("returnpermpasswordBaseKerzana")
					if statusnewpassword == 1 then
						term.setTextColor(colors.green)
						term.write("    >> La perm a bien ete modifier. ")
						term.setTextColor(colors.yellow)
					else
						term.setTextColor(colors.red)
						term.write("    >> Erreur est survenue contacter un admin. ")
						term.setTextColor(colors.yellow)
					end
				end
	end
	term.setCursorPos(1,13)
	term.write("Appuyer sur une touche pour continuer.")
	read()
else
	term.setTextColor(colors.yellow)
	term.setCursorPos(1,7)
    term.write("  >> Vous ne posseder pas")
    term.setCursorPos(1,8)
    term.write("     L'accreditation pour executer la commande")
    sleep(2)
    	
end
    sleep(2)
    term.clear()
    entete()
    return final
end

term.clear()
term.setCursorPos(1,1)
term.setTextColor(colors.orange)

entete()

term.write("")
term.setTextColor(colors.orange)
term.setCursorPos(1,6)

local selector = 1 
while true do
final = 0
  menuDraw(selector)
  local e = {os.pullEvent()} 
  if e[1] == "key" then 
    if e[2] == keys.down then 
      selector = selector < #menu_options and selector+1 or 1 
    elseif e[2] == keys.up then
      selector = selector > 1 and selector-1 or #menu_options 
    elseif e[2] == keys.enter then
      final = commandsend(selector)
    end
  elseif e[1] == "mouse_click" then
    local value = checkClick(e[3],e[4])
   	if value then 
      selector = value
      final = commandsend(selector)
    end
  end
  if final == 1 then
  	break
  end
end

term.clear()
term.setCursorPos(1,1)
end

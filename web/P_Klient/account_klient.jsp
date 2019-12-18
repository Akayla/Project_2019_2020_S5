<%@ page import="myPage.basicObjects.Klient" %>
<%@ page import="myPage.data.dataBase.KlientData" %>
<%@ page import="myPage.data.others.ErrorMessage" %>
<%@ page import="myPage.data.others.SessionData" %>
<%@ page import="myPage.exceptions.NoResultsException" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: ppisk
  Date: 18.12.2019
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<% SessionData sessionData = (SessionData)session.getAttribute("userData"); %>

<section style="margin-bottom:30px;">
    <div class="jumbotron" style="background-color:rgba(0,0,0,0.11);color:#ffffff;padding-bottom:20px;padding-top:20px;max-width:800px;margin-right:auto;margin-left:auto;">
    <h2 class="text-center" style="height:79px;">Dane Konta</h2>
        <table id="tablica_ogloszen" class="table" cellspacing="0" width="100%" style="text-align: center; gmargin-bottom: 0;border: 0px solid #FFFFFF;width: 60%;max-width: 98%;margin: auto;background-color: transparent;border-collapse: collapse;">
            <tbody>
                <%
                    Klient user = null;
                    KlientData data;
                    try {
                        user = new Klient(sessionData.getId());

                        data = user.getData();
                        if(data == null)
                            throw new NoResultsException();
                    } catch (SQLException | NoResultsException e) {
                        ErrorMessage errorMessage = new ErrorMessage(e);
                        session.setAttribute("errorMessage", errorMessage);
                        response.sendRedirect("errorPage.jsp");
                        return;
                    }
                %>
                <tr><td><span style="color: black; ">Imie</span></td><td><%out.print(data.getImie());%></td></tr>
                <tr><td><span style="color: black; ">Nazwisko</span></td><td><%out.print(data.getNazwisko());%></td></tr>
                <tr><td><span style="color: black; ">Ulica</span></td><td><%out.print(data.getUlica());%></td></tr>
                <tr><td><span style="color: black; ">Kod Pocztowy</span></td><td><%out.print(data.getKod_pocztowy());%></td></tr>
                <tr><td><span style="color: black; ">Miejscowosc</span></td><td><%out.print(data.getMiejscowosc());%></td></tr>
                <tr><td><span style="color: black; ">Data Urodzenia</span></td><td><%out.print(data.getData_urodzenia());%></td></tr>
                <tr><td><span style="color: black; ">Telefon</span></td><td><%out.print(data.getTelefon());%></td></tr>
                <tr><td><span style="color: black; ">E-mail</span></td><td><%out.print(data.getE_mail());%></td></tr>
                <tr><td><span style="color: black; ">ID Klienta</span></td><td><%out.print(data.getId());%></td></tr>
                <tr><td><span style="color: black; ">ID Konta</span></td><td><%out.print(data.getId_konta());%></td></tr>
                <tr><td></td><td></td></tr>
                <tr><td><span style="color: black; ">Ilosc Punktow</span></td><td><%out.print(data.getIlosc_punktow());%></td></tr>
                <tr><td><span style="color: black; ">ID Karty</span></td><td><%out.print(data.getId_karty());%></td></tr>
                <tr><td><span style="color: black; ">ID Statusu</span></td><td><%out.print(data.getId_statusu());%></td></tr>
                <tr><td></td><td></td></tr>
            </tbody>
        </table>
    </div>
</section>

</html>

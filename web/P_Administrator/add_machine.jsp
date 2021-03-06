<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <section id="add_absence" class="bg-light-gray" style="margin:0;background-color:rgba(0,0,0,0.11);color:#ffffff;padding-bottom:20px;padding-top:20px;max-width:800px;margin-right:auto;margin-left:auto;border-radius:20px;margin-bottom:30px;">
        <form action="${pageContext.request.contextPath}/ControllerAddMachine" method="post">
            <h2 class="text-center" style="height:79px;">Dodaj sprzęt</h2>
            <h5 class="text-center" style="height:21px;margin-right:50px;margin-left:50px;">Wprowadź dane dotyczące dodawanego sprzętu.</h5>
            <h6 class="text-center" id="Informacja_Upload" style="font-weight:300;height:44px;margin-right:50px;margin-left:50px;">Następnie upewnij się, czy dane zostały wypełnione prawidłowo i zatwierdź sprzęt.</h6>
            <div class="form-group">
                <label style="font-size:17px;margin-left:101px;margin-top:17px;margin-bottom: 15px;">Dane dotyczące sprzętu</label>
                <input class="form-control" type="text" name="nazwa" required="" placeholder="Nazwa sprzętu" maxlength="255" minlength="2" style="margin:0;width:500px;margin-left:145px;">
                <input class="form-control" type="text" name="opis" required="" placeholder="Opis sprzętu" maxlength="5000" minlength="2" style="margin:0;width:500px;margin-left:145px;margin-top: 15px;">
                <input class="form-control" type="text" name="uwagi" required="" placeholder="Uwagi dotyczące sprzętu" maxlength="5000" minlength="10" style="margin:0;width:500px;margin-left:145px;margin-top: 15px;">
                <label style="font-size:17px;margin-left:101px;margin-top:17px;margin-bottom: 15px;">Data zakupu</label>
                <input class="form-control" type="date" name="data_buy" required="" style="margin:0;width:500px;margin-left:145px;margin-top:-7px;">
                <label style="font-size:17px;margin-left:101px;margin-top:17px;margin-bottom: 15px;">Data upływu gwarancji</label>
                <input class="form-control" type="date" name="gwarancja" required="" style="margin:0;width:500px;margin-left:145px;margin-top:-7px;">
                <div class="form-group"><button class="btn btn-primary" type="submit" style="margin:0;width:265px;margin-left:267px;margin-top: 59px;">Dodaj sprzęt</button></div>
            </div>
        </form>
    </section>
</html>
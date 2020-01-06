package myPage.basicObjects;

import myPage.data.dataBase.KontoData;
import myPage.data.dataBase.PracownikData;
import myPage.data.others.TypKonta;
import myPage.dataSourceDB.DataSource;
import myPage.exceptions.DBReadWriteException;
import myPage.others.DateTransformer;

import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.LinkedList;

public class Pracownik extends User {

    public Pracownik(int idPracownika) {
        super(idPracownika);
    }

    public Pracownik() {
        super();
    }

    private LinkedList<PracownikData> lista_pracownikow = new LinkedList<>();

    @Override
    public PracownikData getData() throws SQLException {


        ResultSet resultQuery = dataSource.getPracownikDB(id);
        PracownikData pracownikData = null;

        if (resultQuery.next()) {
            pracownikData = new PracownikData(
                    resultQuery.getInt("id_pracownika"),
                    resultQuery.getString("imie"),
                    resultQuery.getString("nazwisko"),
                    resultQuery.getString("ulica"),
                    resultQuery.getString("kod_pocztowy"),
                    resultQuery.getString("miejscowosc"),
                    DateTransformer.getJavaDate(resultQuery.getDate("data_urodzenia")),
                    resultQuery.getInt("telefon"),
                    resultQuery.getString("e_mail"),
                    resultQuery.getInt("id_konta"),
                    resultQuery.getLong("pesel"),
                    DateTransformer.getJavaDate(resultQuery.getDate("data_zatrudnienia")),
                    resultQuery.getString("certyfikaty"),
                    resultQuery.getInt("id_ksiazeczki")
            );
        }
        return pracownikData;
    }

    @Override
    public KontoData getAccount() throws SQLException, DBReadWriteException {
        ResultSet resultQuery = dataSource.getPracownikAccountDB(id);
        KontoData kontoData = null;

        //sprawdzanie ilosci wierszy wyniku (musi byc 1 inaczej error)
        resultQuery.last();
        if (resultQuery.getRow() != 1)
            throw new DBReadWriteException();
        resultQuery.beforeFirst();

        //pobieranie danych
        if (resultQuery.next()) {
            kontoData = new KontoData(
                    resultQuery.getInt("id_konta"),
                    resultQuery.getString("haslo"),
                    TypKonta.getTypKonta(resultQuery.getString("typ_konta"))
            );
        }

        return kontoData;
    }

    public void addEvent(HashMap<String, String> parameters) throws DBReadWriteException, SQLException, ParseException {
        DataSource dataSource = new DataSource();
        dataSource.createEventDB(parameters);
    }

    public void getAllData() {
        try {

        ResultSet resultQuery = dataSource.getAllPracownicyDB();

        while (resultQuery.next()) {

            lista_pracownikow.push(new PracownikData(
                    resultQuery.getInt("id_pracownika"),
                    resultQuery.getString("imie"),
                    resultQuery.getString("nazwisko"),
                    resultQuery.getString("ulica"),
                    resultQuery.getString("kod_pocztowy"),
                    resultQuery.getString("miejscowosc"),
                    DateTransformer.getJavaDate(resultQuery.getDate("data_urodzenia")),
                    resultQuery.getInt("telefon"),
                    resultQuery.getString("e_mail"),
                    resultQuery.getInt("id_konta"),
                    resultQuery.getLong("pesel"),
                    DateTransformer.getJavaDate(resultQuery.getDate("data_zatrudnienia")),
                    resultQuery.getString("certyfikaty"),
                    resultQuery.getInt("id_ksiazeczki")
            ));
        }} catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void createPracownik (HashMap<String, String> parameters) throws SQLException, ParseException, DBReadWriteException {
        dataSource.CheckUserDB(parameters.get("e_mail"));
        dataSource.createWorkerDB(parameters);
    }

    public PracownikData popPracownik(){
        return lista_pracownikow.pop();
    }
    public boolean emptyPracownik(){
        return lista_pracownikow.isEmpty();
    }

    public void removePracownik(int a) throws SQLException {
        dataSource.removePracownikID(a);
    }

    public void addServiceWorker(int id_prac, int id_usl) throws SQLException {
        dataSource.checkServiceWorkerDB(id_prac, id_usl);
        dataSource.addServiceWorkerDB(id_prac, id_usl);
    }

    public void editPracownik (HashMap<String, String> parameters) throws SQLException, ParseException, DBReadWriteException {
        dataSource.CheckUserDB(parameters.get("e_mail"));
        dataSource.editWorkerDB(parameters);
    }
    public void  editKsiazeczkaPracownika (HashMap<String, String> parameters) throws SQLException, ParseException, DBReadWriteException {
        dataSource.editWorkersBookDB(parameters);
    }
}
package Datos;

import Modelo.Alumnos;
import Modelo.Tutores;

import java.sql.*;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class Main {
    public static void main(String[] args) {
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                System.out.println("Hola mundo");
            }
        }, 0, 2000);
    }
}

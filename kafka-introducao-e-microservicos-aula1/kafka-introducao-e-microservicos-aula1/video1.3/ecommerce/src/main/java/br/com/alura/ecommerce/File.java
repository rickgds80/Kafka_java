package br.com.alura.ecommerce;



import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class File {

    public static void main(String[] args) throws IOException {

        String content = "Hello World \r\nJava!\r\n";
        String path = "C:\\Users\\User\\Desktop\\app.log";

        FileWriter writer = new FileWriter(path, true);
             BufferedWriter bw = new BufferedWriter(writer);

            bw.write(content);



    }

}

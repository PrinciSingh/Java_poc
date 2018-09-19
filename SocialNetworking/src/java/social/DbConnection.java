/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package social;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Asit
 */
public class DbConnection
{
    public static Connection getConnect()throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/socialdb","root","");
        return con;
    }
}

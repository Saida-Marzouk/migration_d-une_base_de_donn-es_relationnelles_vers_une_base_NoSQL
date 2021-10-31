

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.*;
import org.apache.hadoop.hbase.client.*;
import org.apache.hadoop.hbase.util.*;
import java.io.IOException;
import java.util.*;
public class HbaseTest {

    private static java.sql.Connection connection;
    static String nameDBase = "projetbi";

    public static java.sql.Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection= java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/"+
                    nameDBase+"?autoReconnect=true&useSSL=false","root","root");
            System.out.println("Nice Connection");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }


    public static void createOrOverwrite(Admin admin, HTableDescriptor table) throws IOException {
        if (admin.tableExists(table.getTableName())) {
            admin.disableTable(table.getTableName());
            admin.deleteTable(table.getTableName());
        }
        admin.createTable(table);
    }

    public static void main(String[] args) throws java.sql.SQLException, IOException {
        java.sql.Connection connect = getConnection();
        java.sql.DatabaseMetaData md = connect.getMetaData();
        java.sql.ResultSet rs = md.getTables(null, null, "%", null);
        ArrayList<ArrayList<String>> fColmn = new ArrayList<ArrayList<String>>();
        ArrayList<Integer> fait = new ArrayList<Integer>();
        while (rs.next()) {
            ArrayList<String> col = new ArrayList<String>();
            col.add(rs.getString("Table_NAME"));
            java.sql.Statement statement = connection.createStatement();
            java.sql.ResultSet results = statement.executeQuery("SELECT * FROM "+rs.getString("Table_NAME"));
            java.sql.ResultSetMetaData metadata = results.getMetaData();
            int columnCount = metadata.getColumnCount();
            for (int i=1; i<=columnCount; i++) {
                String columnName = metadata.getColumnName(i);
                col.add(columnName);
            }
            fColmn.add(col);
            if(rs.getString("Table_NAME").contains("fait")) {
                fait.add(fColmn.size())
            }
        }
        //------------------------Tables des faits---------------------------------------------
        java.sql.DatabaseMetaData metaData = connect.getMetaData();
        for(int i=0;i<fait.size();i++) {
            //------------------declaration------------------
            ArrayList<ArrayList<String>> newFait = new ArrayList<ArrayList<String>>();
            ArrayList<ArrayList<String>> keyFait = new ArrayList<ArrayList<String>>();
            String whereText = "",createtable = "",importCSV = "",tables="",attr="",query="",f="";
            //-------------------------getForeignkey--------------------------------------
            java.sql.ResultSet resultSet = metaData.getImportedKeys(connect.getCatalog(), null,
                    fColmn.get(fait.get(i)-1).get(0));
            System.out.println("---------------------table fait name : "+fColmn.get(fait.get(i)-1).get(0));
            newFait.add(fColmn.get(fait.get(i)-1));
            //---------------------------resultat---------------------------
            ArrayList<String> preKey = new ArrayList<String>();
            while (resultSet.next()) {
                //foreignKeyTableName means the table name of the table which used columns as foreign keys in that table.
                String fkTableName  = resultSet.getString("FKTABLE_NAME");
                String fkColumnName = resultSet.getString("FKCOLUMN_NAME");
                String PkColumnName = resultSet.getString("PKCOLUMN_NAME");
                String pkTable = resultSet.getString("PKTABLE_NAME");
                preKey.add(fkTableName);preKey.add(pkTable);preKey.add(fkColumnName);preKey.add(PkColumnName);
                keyFait.add(preKey);
                preKey=new ArrayList<String>();
                for (int j = 0; j < fColmn.size(); j++) {
                    if(fColmn.get(j).get(0).equals(pkTable)) {
                        newFait.add(fColmn.get(j));
                    }
                }
            }
            //----------------------delete foreignkey-------------------------
            for(int k=0;k<keyFait.size();k++) {
                if(newFait.get(0).contains(keyFait.get(k).get(2))) {
                    int ix = newFait.get(0).indexOf(keyFait.get(k).get(2));
                    newFait.get(0).remove(ix);
                    //System.out.println("-------- "+ keyFait.get(k).get(2) + " : " + ix);
                }
            }

            //------------------------WhereText-----------------------------
            for(int k=0;k<keyFait.size();k++) {
                whereText+=keyFait.get(k).get(0) + "." + keyFait.get(k).get(2)+" = "+ keyFait.get(k).get(1) + "." + keyFait.get(k).get(3) + ((k==(keyFait.size()-1))?"":" and ");
            }
            for(int k=0;k<newFait.size();k++) {
                tables+=newFait.get(k).get(0)+((k==newFait.size()-1)?"":",");
                for (int j = 1; j < newFait.get(k).size(); j++) {
                    attr+=newFait.get(k).get(0)+"."+newFait.get(k).get(j)+ " as "+newFait.get(k).get(j)+",";
                    f+=((f.equals(""))?"":",")+newFait.get(k).get(j);
                }
            }
            attr = attr.substring(0,attr.lastIndexOf(","));
            query="select "+ attr + " from "+ tables + " where "+ whereText;
            //------------------------------------------------------------------
            Table tableau;
            Configuration config = HBaseConfiguration.create();
            Connection connection1 = ConnectionFactory.createConnection(config);
            Admin admin = connection1.getAdmin();
            System.out.println("connecting");
            HTableDescriptor ht = new HTableDescriptor(TableName.valueOf(nameDBase+""+i));
            for (int j = 0; j < newFait.size(); j++) {
                ht.addFamily(new HColumnDescriptor(newFait.get(j).get(0)));
            }
            System.out.println("Creating Table");
            createOrOverwrite(admin, ht);
            System.out.println("Done......");
            tableau = connection1.getTable(TableName.valueOf(nameDBase+""+i));
            try {
                java.sql.ResultSet result = connect.createStatement(java.sql.ResultSet.
                        TYPE_SCROLL_INSENSITIVE,java.sql.ResultSet.CONCUR_READ_ONLY)
                        .executeQuery(query);
                int cont =(int) (Math.random()*27652687);
                while(result.next()){
                    System.out.println("-------------------Adding user: user1"+cont+"--------------");
                    for (int j = 0; j < newFait.get(j).size(); j++) {
                        byte[] row1 = Bytes.toBytes(cont);
                        Put p = new Put(row1);
                        for (int j2 = 1; j2 < newFait.get(j).size(); j2++) {
                                System.out.println("p.addColumn("+newFait.get(j).get(0)+", " +
                                        ""+newFait.get(j).get(j2)+", Bytes.toBytes("+result
                                        .getString(newFait.get(j).get(j2))+"));");
                                p.addColumn(newFait.get(j).get(0).getBytes(), newFait.get(j)
                                        .get(j2).getBytes(), Bytes.toBytes(result.getString
                                        (newFait.get(j).get(j2))));
                        }
                        tableau.put(p);
                    }
                    cont++;
                }
                System.out.println("reading data...");
            } catch (java.sql.SQLException e) {
            e.printStackTrace();
            }catch (Exception e) {
                e.printStackTrace();
            } finally {
                tableau.close();
                connection1.close();
            }

        }
    }
}
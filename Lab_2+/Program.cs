using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


// ВЫ ПРОСИЛИ НАПИСАТЬ ЗАПРОС НА НАХОЖДЕНИЕ 3 САМЫЕ ПОПУЛЯРНЫЕ ПЕСНИ ЗА ПОСЛЕДНИЕ 3 ГОДА НЕ УЧИТЫВАЯ ТЕКУЩИЙ ГОД НА КЛИЕНТЕ А УЧИТЫВАТЬ ГОД В ЗАПИСЯХ 
namespace Lab2
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = @"Data Source=DESKTOP-AOL90O5\SSQLSERVER;Initial Catalog=PotatoRhymes;Integrated Security=True";
            string sqlExpression = "SELECT top(3) * FROM tracks  where year > DATEADD(yy,-3,(select max(year) from tracks)) order by rating desc";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    Console.WriteLine("{0}\t{1}\t{2}\t\t{3}", reader.GetName(0), reader.GetName(1), reader.GetName(11), reader.GetName(13));

                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                        object year = reader.GetValue(11);
                        object rating = reader.GetValue(13);
                        Console.WriteLine("{0} \t{1} \t{2}\t{3}", id, name, year,rating);
                    }
                }
                reader.Close();
            }
        }
    }
}

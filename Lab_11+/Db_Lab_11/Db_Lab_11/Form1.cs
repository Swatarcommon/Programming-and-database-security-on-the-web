using System;
using System.Windows.Forms;
using System.Configuration;
using System.Data;
using System.Data.SQLite;

namespace Db_Lab_11
{
    public partial class Form1 : Form
    {
        SQLiteConnection conn;
        public Form1()
        {
            InitializeComponent();
        }

        private void SelectFromWorkers_Click(object sender, EventArgs e)
        {
            conn = new SQLiteConnection("Data Source=ForLabs.db;Version=3");
            conn.Open();
            SQLiteCommand command = conn.CreateCommand();
            command.CommandText = "select * from Worker";
            SQLiteDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ResultTextBox.AppendText("Id: " + reader[0] + " Name: " + reader[1] + " Age: " + reader[2] + " salary: " + reader[0]);
                }
            }
            else
            {
                MessageBox.Show("Some Error");
            }

            conn.Close();
        }

        private static string LoadConnectionString(string id = "Default")
        {
            return ConfigurationManager.ConnectionStrings[id].ConnectionString;
        }

        private void ResultTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

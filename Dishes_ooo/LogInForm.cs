using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Dishes_ooo
{
    public partial class LogInForm : Form
    {
        public LogInForm()
        {
            InitializeComponent();
        }
        private void clickLoginbtn(object sender, EventArgs e)
        {
            string login = logintb.Text.Trim();
            string password = passwordtb.Text.Trim();

            if (logintb.Text.Trim().Length == 0 || passwordtb.Text.Trim().Length == 0)
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }
            try
            {
                using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.ConnectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "CheckLogin";
                    cmd.Parameters.AddWithValue("@Login", login);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Connection = connection;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        reader.Read();
                        if (reader.HasRows)
                        {
                            UserData.UserID = reader.GetInt32(0);
                            UserData.UserName = reader.GetString(2);
                            UserData.UserRole = reader.GetInt32(6);

                            switch (UserData.UserRole)
                            {
                                case 1:
                                    this.Hide();
                                    MainAdminForm adminForm = new MainAdminForm();
                                    adminForm.Show();
                                    break;
                                case 2:
                                    this.Hide();
                                    MainManagerForm managerForm = new MainManagerForm();
                                    managerForm.Show();
                                    break;
                                case 3:
                                    this.Hide();
                                    MainClientForm clientForm = new MainClientForm();
                                    clientForm.Show();
                                    break;
                            }
                        }
                        else
                        {
                            MessageBox.Show("Неверно введены данные!");

                        }
                    }
                }
            }
            catch
            {
                MessageBox.Show("Ошибка подключения к Базе Данных.");
            }
        }
        private void clickGuestbtn(object sender, EventArgs e)
        {
            this.Hide();
            MainClientForm clientForm = new MainClientForm();
            clientForm.Show();
        }
    }
}

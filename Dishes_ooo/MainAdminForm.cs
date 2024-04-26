using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dishes_ooo
{
    public partial class MainAdminForm : Form
    {
        DataTable productTable;
        public MainAdminForm()
        {
            InitializeComponent();
            greetinglb.Text = "Здравствуйте, " + UserData.UserName;
            LoadDataGridView();
        }

        private void backbtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            LogInForm logInForm = new LogInForm();
            logInForm.Show();
        }
        private void LoadDataGridView()
        {
            string query = $"SELECT ProductPhoto as 'Фото', ProductName + '\r\n'+' Описание: ' + ProductDescription + '\r\n'+' Стоимость: ' + CONVERT(nvarchar(100), ProductCost) as 'Продукт', ProductQuantityInStock as 'Количество на складе' FROM Products";
            try
            {
                using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.ConnectionString))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        productTable = new DataTable();
                        adapter.Fill(productTable);
                        productdgv.DataSource = productTable;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка " + ex.Message);
            }
        }

        private void editbtn_Click(object sender, EventArgs e)
        {
            MessageBox.Show("В разработке");
        }
    }
}

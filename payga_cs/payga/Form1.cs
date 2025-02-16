using System;
using System.Linq;
using System.Windows.Forms;
using BCrypt.Net;


namespace payga
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

  
        db_1Entities db = new db_1Entities();

        private void button1_Click(object sender, EventArgs e)
        {
           
            string username = txtuser.Text.Trim();
            string password = txtpass.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("لطفاً نام کاربری و رمز عبور را وارد کنید.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

       
            var user = db.clients.FirstOrDefault(u => u.user_name == username);

            if (user != null && BCrypt.Net.BCrypt.Verify(password, user.password))
            {
                MessageBox.Show("ورود موفقیت‌آمیز!", "موفقیت", MessageBoxButtons.OK, MessageBoxIcon.Information);

          
                // Dashboard dashboard = new Dashboard();
                // dashboard.Show();

          
                this.Hide();
            }
            else
            {
                MessageBox.Show("نام کاربری یا رمز عبور اشتباه است.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

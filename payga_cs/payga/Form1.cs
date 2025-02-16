using System;
using System.Linq;
using System.Windows.Forms;
using BCrypt.Net;

namespace payga
{
    public partial class FormMain : Form
    {
        db_1Entities db = new db_1Entities();

        public FormMain()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtuser.Text.Trim();
            string password = txtpass.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                MessageBox.Show("لطفاً نام کاربری و رمز عبور را وارد کنید.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // جستجوی کاربر در دیتابیس
            var user = db.clients.FirstOrDefault(u => u.user_name == username);

            if (user != null)
            {
                // بررسی صحت رمز عبور هش‌شده
                if (BCrypt.Net.BCrypt.Verify(password, user.password))
                {
                    MessageBox.Show("ورود موفقیت‌آمیز!", "موفقیت", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // فرم اصلی برنامه را باز کن
                    // Dashboard dashboard = new Dashboard();
                    // dashboard.Show();

                    this.Hide();
                }
                else
                {
                    MessageBox.Show("رمز عبور اشتباه است.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("نام کاربری یافت نشد.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}

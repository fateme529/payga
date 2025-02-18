using System;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class UserControl1 : UserControl
    {
        private string _phoneNumber;
        public UserControl1(string phoneNumber)
        {
            
             InitializeComponent();
            _phoneNumber = phoneNumber;
            LoadUserData();
        }

        private void LoadUserData()
        {
            try
            {
                using (db_1Entities db = new db_1Entities())
                {
                    var user = db.clients.FirstOrDefault(u => u.phone_number == _phoneNumber);

                    if (user != null)
                    {
                        label9.Text = $"{user.first_name} {user.last_name}";
                    }
                    else
                    {
                        label9.Text = "User not found";
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading user data: {ex.Message}", "Database Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    

       private void UserControl1_Load(object sender, EventArgs e)
        {

        }

        private void flowLayoutPanel8_Paint(object sender, PaintEventArgs e)
        {

        }

        private void flowLayoutPanel6_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}

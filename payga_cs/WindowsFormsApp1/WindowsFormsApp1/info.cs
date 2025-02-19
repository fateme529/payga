using System;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class info : UserControl
    {
        public info(int id)
        {
            InitializeComponent();
            LoadUserData(id);
        }

        public void LoadUserData(int userid)
        {
            /*if (userid <= 0)
            {
                MessageBox.Show("User ID is invalid!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }*/

            using (var db = new db_1Entities())
            {
                var user = db.clients.FirstOrDefault(u => u.id == userid);
                if (user != null)
                {
                   
                   label11.Text = $"{user.first_name} {user.last_name}";
                    label13.Text = $"{user.wallet_balance}";
                    label14.Text = $"{user.timestamp}";
                    label15.Text = $"{user.id}";
                    string dis = $"id_discount_{userid}_";
                    var referalcount = db.discount_code.Count(dc => dc.amount == 25 && dc.dis_code.StartsWith(dis));

                    label17.Text = $" {referalcount}";  


                   
                    var discountCount = db.private_code.Count(pc => pc.id == userid);
                    label16.Text = $" {discountCount}"; 
                }
                else
                {
                    return; 
                }

                //label9.Text = $" {user.first_name}";
                    // labelPhone.Text = $"Phone: {user.phone}";
                    // labelEmail.Text = $"Email: {user.email}";
                
         
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }
    }
}

using System;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class time : UserControl
    {
        public time(int id)
        {
            InitializeComponent();
            LoadUserData5(id);
        }

        public void LoadUserData5(int userid)
        {
            using (var db = new db_Entities3())
            {
                
                var vipClient = db.vip_client
                    .FirstOrDefault(vc => vc.id == userid);

                if (vipClient != null)
                {
                    
                    DateTime subscriptionExpirationTime = vipClient.Subscription_expiration_time;
                    TimeSpan remainingTime = subscriptionExpirationTime - DateTime.Now;

                    if (remainingTime.TotalSeconds > 0)
                    {
                        
                        label2.Text = $"Remaining Time: {remainingTime.Days} days, {remainingTime.Hours} hours, {remainingTime.Minutes} minutes";
                    }
                    else
                    {
                       
                        label2.Text = "Your subscription has expired.";
                    }
                }
                else
                {
                    
                    label2.Text = "User is not a VIP client.";
                }
            }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}

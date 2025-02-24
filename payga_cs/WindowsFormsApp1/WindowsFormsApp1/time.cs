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
            using (var db = new db_Entities5())
            {
                
                var vipClient = db.vip_client
                    .FirstOrDefault(vc => vc.id == userid);

                if (vipClient != null)
                {
                    
                    DateTime subscriptionExpirationTime = vipClient.Subscription_expiration_time;
                    TimeSpan remainingTime = subscriptionExpirationTime - DateTime.Now;

                    if (remainingTime.TotalSeconds > 0)
                    {
                        
                        label4.Text = $"Remaining Time: {remainingTime.Days} days, {remainingTime.Hours} hours, {remainingTime.Minutes} minutes";
                    }
                    else
                    {
                       
                        label4.Text = "Your subscription has expired.";
                    }
                }
                else
                {
                    
                    label4.Text = "User is not a VIP client.";
                }
                var vip_profit = db.vw_ClientTransactionPercentage
                    .FirstOrDefault(vw => vw.client_id == userid);

                if(vip_profit != null)
                {
                    label5.Text = $"{vip_profit.transaction_15_percent}";
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

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}

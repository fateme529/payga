using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class cart : UserControl
    {
        public cart(int id)
        {
            InitializeComponent();
            LoadUserData3(id);
        }
        public void LoadUserData3(int userid)
        {
            using (var db = new db_1Entities())
            {
                var isVip = db.vip_client.Any(vc => vc.id == userid);

               
                var cart1 = db.shopping_cart.FirstOrDefault(sc => sc.number == (userid * 100 + 1));
                if (cart1 != null)
                {
                    label2.Text = $" {cart1.status}";
                }
                else
                {
                    label2.Text = "سبد خرید اول موجود نیست";
                }


                for (int i = 2; i <= 5; i++)
                {
                    int cartId = userid * 100 + i;
                    var cart = db.shopping_cart.FirstOrDefault(sc => sc.number == cartId);

                    if (cart != null)
                    {
                       
                        if (isVip)
                        {
                            switch (i)
                            {
                                case 2:
                                    label3.Text = $" {cart.status}";
                                    break;
                                case 3:
                                    label4.Text = $" {cart.status}";
                                    break;
                                case 4:
                                    label5.Text = $" {cart.status}";
                                    break;
                                case 5:
                                    label6.Text = $" {cart.status}";
                                    break;
                            }
                        }
                        
                    }
                    else
                    {
                   
                        switch (i)
                        {
                            case 2:
                                label3.Text = "This cart is only for VIP users";
                                break;
                            case 3:
                                label4.Text = "This cart is only for VIP users";
                                break;
                            case 4:
                                label5.Text = "This cart is only for VIP users";
                                break;
                            case 5:
                                label6.Text = "This cart is only for VIP users";
                                break;
                        }
                    }
                }
            }
        }



        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void cart_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}

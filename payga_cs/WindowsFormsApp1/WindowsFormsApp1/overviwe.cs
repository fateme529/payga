using System;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class overviwe : UserControl
    {
        public overviwe(int id)
        {
            InitializeComponent();
            LoadUserData4(id);
        }

        public void LoadUserData4(int userid)
        {
            using (var db = new db_1Entities())
            {
           
                var lastTransaction = db.vw_TransactionDetails
                    .Where(t => t.id == userid)
                    .OrderByDescending(t => t.timestamp) 
                    .FirstOrDefault();

                if (lastTransaction != null)
                {
                    
                    var cartNumber = lastTransaction.cart_number;
                    var lockedNumber = lastTransaction.locked_number;

                  
                    var products = db.added_to
                        .Where(a => a.cart_number == cartNumber && a.locked_number == lockedNumber)
                        .Select(a => a.product_id)  
                        .ToList();

                    if (products.Any())
                    {
                        
                        var productDetails = db.viewCart_Total_Discount
                            .Where(v => products.Contains(v.product_id)) 
                            .ToList();

                      
                        StringBuilder sb = new StringBuilder();
                        foreach (var product in productDetails)
                        {
                            sb.AppendLine($"Product: {product.product_name}, Price: {product.product_price}, Discount: {product.discount_value}");
                        }

                        
                        label2.Text = sb.ToString();
                    }
                    else
                    {
                        label2.Text = "محصولی در سبد خرید یافت نشد";
                    }
                }
                else
                {
                    label2.Text = "هیچ تراکنشی برای این کاربر یافت نشد";
                }
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
           
        }

        private void label1_Click(object sender, EventArgs e)
        {
           
        }
    }
}

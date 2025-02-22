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
            using (var db = new db_Entities2())
            {
              
                var lastTransaction = db.vw_TransactionDetails
                    .Where(t => t.issued_for_id == userid)
                    .OrderByDescending(t => t.transaction_time)  
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
                       
                        var productDetails = db.products 
                            .Where(p => products.Contains(p.id))  
                            .Select(p => new
                            {
                              //  p.product_name,
                                p.category, 
                               // p.product_id
                            })
                            .ToList();

                     
                        StringBuilder sb = new StringBuilder();
                        foreach (var product in productDetails)
                        {
                            sb.AppendLine($"Product:  {product.category}");
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
                    label2.Text = "No transactions found for this user.";
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

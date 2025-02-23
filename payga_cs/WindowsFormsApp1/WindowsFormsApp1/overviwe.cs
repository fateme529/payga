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
            using (var db = new db_Entities3())
            {
               
                var lastTransaction = db.vw_TransactionDetails
                    .Where(t => t.issued_for_id == userid)
                    .OrderByDescending(t => t.transaction_time)
                    .FirstOrDefault();

                if (lastTransaction != null)
                {
                    var cartNumber = lastTransaction.cart_number;
                    var lockedNumber = lastTransaction.locked_number;

                  
                    var cartTotalAfterIssuedFor = db.vw_CartTotalAfterIssuedFor
                        .Where(c => c.cart_number == cartNumber && c.locked_number == lockedNumber)
                        .Select(c => c.final_total)
                        .FirstOrDefault();

                  
                    var productsInCart = db.added_to
                        .Where(a => a.cart_number == cartNumber && a.locked_number == lockedNumber)
                        .Select(a => new { a.product_id, a.quantity })
                        .ToList();

                    if (productsInCart.Any())
                    {
                     
                        var productIds = productsInCart.Select(a => a.product_id).ToList();

                  
                        var productDetails = db.products
                            .Where(p => productIds.Contains(p.id))
                            .Select(p => new
                            {
                                p.id,
                                p.category
                            })
                            .ToList();

                     
                        StringBuilder sb = new StringBuilder();
                        foreach (var product in productDetails)
                        {
                            var quantity = productsInCart
                                .First(a => a.product_id == product.id).quantity;

                            sb.AppendLine($"Product: {product.category}, Quantity: {quantity}");
                        }

                 
                        if (cartTotalAfterIssuedFor != null)
                        {
                            sb.AppendLine($" final total: {cartTotalAfterIssuedFor:C}");
                        }
                        else
                        {
                            sb.AppendLine("Final Total is not available.");
                        }

                       
                        label2.Text = sb.ToString();
                    }
                    else
                    {
                        label2.Text = "No products found in the shopping cart.";
                    }
                }
                else
                {
                    label2.Text = "This user has no successful transactions.";
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

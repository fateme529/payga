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
                var transactions = db.vw_TransactionDetails
                    .Where(t => t.issued_for_id == userid)
                    .OrderByDescending(t => t.transaction_time)
                    .Take(5)
                    .ToList();

                if (transactions.Any())
                {
                    int i = 2;

                    foreach (var lastTransaction in transactions)
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

                        StringBuilder sb = new StringBuilder();
                        string productDetailsString = ""; 

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

                            foreach (var product in productDetails)
                            {
                                var quantity = productsInCart
                                    .First(a => a.product_id == product.id).quantity;

                           
                                productDetailsString += $"Product: {product.category}, Quantity: {quantity}  |  ";
                            }

                      
                            if (productDetailsString.Length > 0)
                            {
                                productDetailsString = productDetailsString.Substring(0, productDetailsString.Length - 4);
                            }

                            sb.Append(productDetailsString); 

                           
                            if (cartTotalAfterIssuedFor != null)
                            {
                                sb.AppendLine($"\nFinal total: {cartTotalAfterIssuedFor:C}");
                            }
                            else
                            {
                                sb.AppendLine("\nFinal Total is not available.");
                            }
                        }
                        else
                        {
                            sb.AppendLine("No products found in the shopping cart.");
                        }

                      
                        if (i == 2)
                        {
                            label2.Text = sb.ToString();
                            label2.Font = new System.Drawing.Font(label2.Font.FontFamily, 8);
                            label2.AutoSize = true;
                        }
                        else if (i == 3)
                        {
                            label3.Text = sb.ToString();
                            label3.Font = new System.Drawing.Font(label3.Font.FontFamily, 8);
                            label3.AutoSize = true;
                        }
                        else if (i == 4)
                        {
                            label4.Text = sb.ToString();
                            label4.Font = new System.Drawing.Font(label4.Font.FontFamily, 8);
                            label4.AutoSize = true;
                        }
                        else if (i == 5)
                        {
                            label5.Text = sb.ToString();
                            label5.Font = new System.Drawing.Font(label5.Font.FontFamily, 8);
                            label5.AutoSize = true;
                        }
                        else if (i == 6)
                        {
                            label6.Text = sb.ToString();
                            label6.Font = new System.Drawing.Font(label6.Font.FontFamily, 8);
                            label6.AutoSize = true;
                        }

                        i++;
                    }
                }
                else
                {
                   
                    label2.Text = "This user has no successful transactions.";
                    label3.Text = "This user has no successful transactions.";
                    label4.Text = "This user has no successful transactions.";
                    label5.Text = "This user has no successful transactions.";
                    label6.Text = "This user has no successful transactions.";
                }
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}

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
                // دریافت آخرین تراکنش این کاربر از vw_TransactionDetails
                var lastTransaction = db.vw_TransactionDetails
                    .Where(t => t.issued_for_id == userid)
                    .OrderByDescending(t => t.transaction_time)
                    .FirstOrDefault();

                if (lastTransaction != null)
                {
                    var cartNumber = lastTransaction.cart_number;
                    var lockedNumber = lastTransaction.locked_number;

                    // دریافت اطلاعات محصولات از added_to
                    var productsInCart = db.added_to
                        .Where(a => a.cart_number == cartNumber && a.locked_number == lockedNumber)
                        .Select(a => new { a.product_id, a.quantity }) // دریافت product_id و quantity
                        .ToList();

                    if (productsInCart.Any())
                    {
                        // جدا کردن product_idها در یک لیست ساده
                        var productIds = productsInCart.Select(a => a.product_id).ToList();

                        // دریافت اطلاعات محصولات از جدول products
                        var productDetails = db.products
                            .Where(p => productIds.Contains(p.id)) // مقدار product_id را در یک لیست ذخیره کردیم
                            .Select(p => new
                            {
                                p.id,          // شناسه محصول
                                p.category     // دسته‌بندی محصول
                            })
                            .ToList();

                        StringBuilder sb = new StringBuilder();
                        foreach (var product in productDetails)
                        {
                            // پیدا کردن quantity از جدول added_to
                            var quantity = productsInCart
                                .First(a => a.product_id == product.id).quantity;

                            sb.AppendLine($"Product: {product.category}, Quantity: {quantity}");
                        }

                        // نمایش اطلاعات در label2
                        label2.Text = sb.ToString();
                    }
                    else
                    {
                        label2.Text = "محصولی در سبد خرید یافت نشد";
                    }
                }
                else
                {
                    label2.Text = "این کاربر هیچ تراکنش موفقی ندارد.";
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

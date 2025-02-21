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
    public partial class code : UserControl
    {
        public code(int id)
        {
            InitializeComponent();
            LoadUserData2(id);
        }
        public void LoadUserData2(int userid)
        {



            using (var db = new db_1Entities())
            {
             
                var discountCodes = db.private_code  .Where(pc => pc.id == userid).Select(pc => pc.pri_code).ToList();

              
                List<string> validDiscountCodes = new List<string>();

                foreach (var discountCode in discountCodes)
                {
                    
                    var discount = db.discount_code
                        .FirstOrDefault(dc => dc.dis_code == discountCode);

                    DateTime? expirationDateNullable = discount.expiration_date;  
                    if (expirationDateNullable.HasValue)
                    {
                        DateTime expirationDate = expirationDateNullable.Value;
                     
                        if (expirationDate > DateTime.Now && expirationDate <= DateTime.Now.AddDays(7))
                        {
                            validDiscountCodes.Add(discountCode); 
                        }
                  
                        if (validDiscountCodes.Any())
                        {
                            label3.Text = string.Join(Environment.NewLine, validDiscountCodes);
                           // label3.AutoSize = true;
                           // label3.MaximumSize = new Size(300, 0);
                           // label3.TextAlign = ContentAlignment.MiddleLeft;
                        }
                        else
                        {
                            label3.Text = "No valid discount codes found!";
                        }

                    }
                    else
                    {
                
                        MessageBox.Show("تاریخ انقضا موجود نیست");
                    }

                 
                }

       
            }
        }


        

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}

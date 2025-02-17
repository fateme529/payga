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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        db_1Entities db = new db_1Entities();
        private void sign_Click(object sender, EventArgs e)
        {
            Form1 loginform = new Form1();
            loginform.Show();
            this.Hide();
        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
        private void signup_Click(object sender, EventArgs e)
        {

            client tbl = new client();
            tbl.phone_number = phone.Text;
            tbl.first_name = firstname.Text;
            tbl.last_name = lastname.Text;
            try
            {
                tbl.referal_code = Convert.ToInt32(referal.Text);
            }
            catch (FormatException)
            {
                MessageBox.Show("Referral code must be a number.");
            }
            catch (OverflowException)
            {
                MessageBox.Show("Referral code is too large.");
            }

            tbl.user_name = username.Text;
            tbl.password = password.Text;
            db.clients.Add(tbl);
            db.SaveChanges();
            MessageBox.Show("Information has been successfully registered"); 


        }
    }
}

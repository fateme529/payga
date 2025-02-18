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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.button2.Click += new System.EventHandler(this.button2_Click);

        }
        db_1Entities db = new db_1Entities();
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close(); 
                        
        }
        private void register_Click(object sender, EventArgs e)
        {
            Form2 regform = new Form2();
            regform.Show();
            this.Hide();
        }





        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void loginusername_TextChanged(object sender, EventArgs e)
        {

        }


        private void logineuser_TextChanged(object sender, EventArgs e)
        {

        }

        private void loginebtn_CheckedChanged(object sender, EventArgs e)
        {
          /* if(logineuser.Text == "" )
            {
                MessageBox.Show("pleas enter your phone number");
            }
            string username = logineuser.Text.Trim();


      
            var user = db.clients.FirstOrDefault(u => u.user_name == username);

            if (user == null)
            {
                MessageBox.Show("phone number not found.", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

                         
                MessageBox.Show("Welcome!", "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Form3 userForm = new Form3();
                this.Hide();
                userForm.ShowDialog();
                this.Show();
            */

        }

        private void loginebtn_Click(object sender, EventArgs e)
        {
            if (logineuser.Text == "")
            {
                MessageBox.Show("pleas enter your phone number");
            }
             string username = logineuser.Text.Trim();



             var user = db.clients.FirstOrDefault(u => u.phone_number == username);

             if (user == null)
             {
                 MessageBox.Show("phone number not found.", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                 return;
             }


                 MessageBox.Show("Welcome!", "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);
            Form3 userForm = new Form3(user.id,user.first_name);
            this.Hide();
            userForm.ShowDialog();
            this.Show();


        }





    }
}

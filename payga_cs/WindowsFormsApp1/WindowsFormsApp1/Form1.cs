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

        private void loginpassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void logineuser_TextChanged(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
        private void loginebtn_CheckedChanged(object sender, EventArgs e)
        {
            if(logineuser.Text == "" || loginpassword.Text == "")
            {
                MessageBox.Show("pleas fill");
            }
            string username = logineuser.Text.Trim();
            string password = loginpassword.Text;

      
            var user = db.clients.FirstOrDefault(u => u.user_name == username);

            if (user == null)
            {
                MessageBox.Show("Username not found.", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

           
            if (user.password != password)
            {
                MessageBox.Show("Incorrect password.", "Login Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

      
            if (username.ToLower() == "admin")
            {
                MessageBox.Show("Welcome Admin!", "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Form3 adminForm = new Form3();
                this.Hide();
                adminForm.ShowDialog();
                this.Show();
            }
            else
            {
                /*MessageBox.Show("Welcome User!", "Login Successful", MessageBoxButtons.OK, MessageBoxIcon.Information);
                UserForm userForm = new UserForm();
                this.Hide();
                userForm.ShowDialog();
                this.Show();*/
            }
        }


        private void register_password_CheckedChanged(object sender, EventArgs e)
        {
            loginpassword.PasswordChar = register_password.Checked ? '\0' : '*';

        }



    }
}

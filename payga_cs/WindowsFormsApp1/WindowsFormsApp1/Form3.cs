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
    public partial class Form3 : Form
    {
        //private readonly db_1Entities _dbContext;
        //private readonly string _phoneNumber;
        public Form3(string frist_name)
        {
            InitializeComponent();
        }
       // db_1Entities db = new db_1Entities();
      

        private void DisplayWelcomeMessage(string firstName)
        {
        
           labelWelcomeMessage.Font = new Font("Arial", 11);

            labelWelcomeMessage.Text = $"Welcome, {firstName}! Manage your details and enjoy personalized offers just for you.";
        }
        private void LoadUserControl()
        {
        
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
        private void button2_Click(object sender, EventArgs e)
        {  if(MessageBox.Show("Are you sure you want to close?","Confirmation Message"
            ,MessageBoxButtons.YesNo,MessageBoxIcon.Question)==DialogResult.Yes)
            {
                Application.Exit();
            }
           
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {

        }
        private void button5_Click(object sender, EventArgs e)
        {
   
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to close?", "Confirmation Message"
               , MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
            
                this.Hide();
            }

        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void userControl11_Load(object sender, EventArgs e)
        {

        }
    }
}

using System;
using System.Drawing;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form3 : Form
    {
        private int _id;
        private info infoControl;

        public Form3(int id, string firstName)
        {
            InitializeComponent();
            _id = id;

            DisplayWelcomeMessage(firstName);
        }

        private void DisplayWelcomeMessage(string firstName)
        {
            labelWelcomeMessage.Font = new Font("Arial", 11);
            labelWelcomeMessage.Text = $"Welcome, {firstName}! Manage your details and enjoy personalized offers just for you.";
        }

        private void LoadUserControl()
        {
            if (infoControl == null)
            {
                infoControl = new info(_id);
                infoControl.LoadUserData(_id);  
                infoControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(infoControl);
            }
        }

        private void Form3_Load(object sender, EventArgs e)
        {
          
        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {
           
         
        }

        private void buttonClose_Click(object sender, EventArgs e)
        {
           
        }
        private void label2_Click(object sender, EventArgs e)
        {
         
            
        }
        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void button6_Click(object sender, EventArgs e)
        {

            
        }

        private void button5_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to close?", "Confirmation",
               MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Hide();
            }

        }
        private void button1_Click(object sender, EventArgs e)
        {
            LoadUserControl();

        }
        private void button3_Click(object sender, EventArgs e)
        {


        }

        private void code1_Load(object sender, EventArgs e)
        {

        }
    }
}

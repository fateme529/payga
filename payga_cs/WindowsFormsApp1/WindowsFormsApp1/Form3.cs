using System;
using System.Drawing;
using System.Windows.Forms;
using System.Linq;  


namespace WindowsFormsApp1
{
    public partial class Form3 : Form
    {
        private int _id;
        private info infoControl;
        private code codeControl;
        private cart cartControl;
        private overviwe overviweControl;
        private time timeControl;
        private bool isInfoLoaded = false;
        private bool isCodeLoaded = false;
        private bool isCartLoaded = false;
        private bool isOverviwe = false;
        private bool isTime = false;

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
            panelUserInfo.Controls.Clear();
            if (!isInfoLoaded)
            {
                infoControl = new info(_id);
                infoControl.LoadUserData(_id);  
                infoControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(infoControl);
            }
        }
        private void code()
        {
            panelUserInfo.Controls.Clear();
            if (!isCodeLoaded)
            {
                codeControl = new code(_id);
                codeControl.LoadUserData2(_id);
                codeControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(codeControl);
            }
        }
        private void cart()
        {
            panelUserInfo.Controls.Clear();
            if (!isCartLoaded)
            {
                cartControl = new cart(_id);
                cartControl.LoadUserData3(_id);
                cartControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(cartControl);
            }
        }
        private void ower()
        {
            panelUserInfo.Controls.Clear();
            if (!isOverviwe)
            {
                overviweControl = new overviwe(_id);
                overviweControl.LoadUserData4(_id);
                overviweControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(overviweControl);
            }
        }
        private void time()
        {
            panelUserInfo.Controls.Clear();
            if (!isTime)
            {
                timeControl = new time(_id);
                timeControl.LoadUserData5(_id);
                timeControl.Dock = DockStyle.Fill;
                panelUserInfo.Controls.Add(timeControl);
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

            ower();
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
            
            code();
        }

        private void button4_Click(object sender, EventArgs e)
        {

            cart();
        }
        private void button7_Click(object sender, EventArgs e)
        {
            using (var db = new db_Entities5())

            {   var vipClient = db.vip_client.FirstOrDefault(v => v.id == _id);

            if (vipClient != null)
            {
                time();
            }
            else
            {
             
                MessageBox.Show("You are not a VIP user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            }
        }


            private void code1_Load(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}

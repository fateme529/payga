﻿using System;
using System.Linq;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class info : UserControl
    {
        public info(int id)
        {
            InitializeComponent();
            LoadUserData(id);
        }

        public void LoadUserData(int userid)
        {
            /*if (userid <= 0)
            {
                MessageBox.Show("User ID is invalid!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }*/

            using (var db = new db_1Entities())
            {
                var user = db.clients.FirstOrDefault(u => u.id == userid);
                if (user != null)
                {
                   
                   label10.Text = $"name {user.first_name}";
                }
                else
                {
                    return; 
                }

                //label9.Text = $" {user.first_name}";
                    // labelPhone.Text = $"Phone: {user.phone}";
                    // labelEmail.Text = $"Email: {user.email}";
                
         
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }
    }
}

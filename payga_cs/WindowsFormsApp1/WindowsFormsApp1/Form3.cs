﻿using System;
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
        private readonly db_1Entities _dbContext;
        public Form3(string first_name)
        {
            InitializeComponent();
            _dbContext = new db_1Entities();
            DisplayWelcomeMessage(first_name);
        }
        db_1Entities db = new db_1Entities();
      

        private void DisplayWelcomeMessage(string firstName)
        {
            labelWelcomeMessage.Text = $"Welcome, {firstName}! This is your account page.";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}

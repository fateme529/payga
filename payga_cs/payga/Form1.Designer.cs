
namespace payga
{
    partial class FormMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.textUsername = new System.Windows.Forms.TextBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.txtuser = new System.Windows.Forms.Label();
            this.btnincome = new System.Windows.Forms.Button();
            this.txtpass = new System.Windows.Forms.Label();
            this.textpassword = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // textUsername
            // 
            this.textUsername.Location = new System.Drawing.Point(97, 91);
            this.textUsername.Name = "textUsername";
            this.textUsername.Size = new System.Drawing.Size(169, 23);
            this.textUsername.TabIndex = 0;
            this.textUsername.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // txtuser
            // 
            this.txtuser.AutoSize = true;
            this.txtuser.Location = new System.Drawing.Point(296, 97);
            this.txtuser.Name = "txtuser";
            this.txtuser.Size = new System.Drawing.Size(66, 17);
            this.txtuser.TabIndex = 2;
            this.txtuser.Text = "نام کاربری\r\n";
            this.txtuser.Click += new System.EventHandler(this.label1_Click);
            // 
            // btnincome
            // 
            this.btnincome.Location = new System.Drawing.Point(139, 241);
            this.btnincome.Name = "btnincome";
            this.btnincome.Size = new System.Drawing.Size(77, 35);
            this.btnincome.TabIndex = 3;
            this.btnincome.Text = "ورود";
            this.btnincome.UseCompatibleTextRendering = true;
            this.btnincome.UseVisualStyleBackColor = true;
            this.btnincome.Click += new System.EventHandler(this.button1_Click);
            // 
            // txtpass
            // 
            this.txtpass.AutoSize = true;
            this.txtpass.Location = new System.Drawing.Point(296, 167);
            this.txtpass.Name = "txtpass";
            this.txtpass.Size = new System.Drawing.Size(54, 17);
            this.txtpass.TabIndex = 5;
            this.txtpass.Text = "رمز عبور\r\n";
            this.txtpass.Click += new System.EventHandler(this.label2_Click);
            // 
            // textpassword
            // 
            this.textpassword.Location = new System.Drawing.Point(97, 161);
            this.textpassword.Name = "textpassword";
            this.textpassword.Size = new System.Drawing.Size(169, 23);
            this.textpassword.TabIndex = 4;
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.ClientSize = new System.Drawing.Size(416, 599);
            this.Controls.Add(this.txtpass);
            this.Controls.Add(this.textpassword);
            this.Controls.Add(this.btnincome);
            this.Controls.Add(this.txtuser);
            this.Controls.Add(this.textUsername);
            this.Font = new System.Drawing.Font("Tahoma", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FormMain";
            this.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textUsername;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.Label txtuser;
        private System.Windows.Forms.Label txtpass;
        private System.Windows.Forms.TextBox textpassword;
        private System.Windows.Forms.Button btnincome;
    }
}


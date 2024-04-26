namespace Dishes_ooo
{
    partial class MainClientForm
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
            this.productdgv = new System.Windows.Forms.DataGridView();
            this.greetinglb = new System.Windows.Forms.Label();
            this.backbtn = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.addcartbtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.productdgv)).BeginInit();
            this.SuspendLayout();
            // 
            // productdgv
            // 
            this.productdgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.productdgv.Location = new System.Drawing.Point(12, 62);
            this.productdgv.Name = "productdgv";
            this.productdgv.ReadOnly = true;
            this.productdgv.Size = new System.Drawing.Size(630, 286);
            this.productdgv.TabIndex = 0;
            // 
            // greetinglb
            // 
            this.greetinglb.AutoSize = true;
            this.greetinglb.Font = new System.Drawing.Font("Comic Sans MS", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.greetinglb.Location = new System.Drawing.Point(166, 16);
            this.greetinglb.Name = "greetinglb";
            this.greetinglb.Size = new System.Drawing.Size(86, 15);
            this.greetinglb.TabIndex = 1;
            this.greetinglb.Text = "Здравствуйте, ";
            // 
            // backbtn
            // 
            this.backbtn.Font = new System.Drawing.Font("Comic Sans MS", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.backbtn.Location = new System.Drawing.Point(12, 13);
            this.backbtn.Name = "backbtn";
            this.backbtn.Size = new System.Drawing.Size(75, 23);
            this.backbtn.TabIndex = 2;
            this.backbtn.Text = "Назад";
            this.backbtn.UseVisualStyleBackColor = true;
            this.backbtn.Click += new System.EventHandler(this.clickBackbtn);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(118)))), ((int)(((byte)(227)))), ((int)(((byte)(131)))));
            this.panel1.Location = new System.Drawing.Point(-2, 48);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(661, 315);
            this.panel1.TabIndex = 3;
            // 
            // addcartbtn
            // 
            this.addcartbtn.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.addcartbtn.Font = new System.Drawing.Font("Comic Sans MS", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.addcartbtn.Location = new System.Drawing.Point(180, 369);
            this.addcartbtn.Name = "addcartbtn";
            this.addcartbtn.Size = new System.Drawing.Size(275, 30);
            this.addcartbtn.TabIndex = 4;
            this.addcartbtn.Text = "Добавить в корзину";
            this.addcartbtn.UseVisualStyleBackColor = false;
            this.addcartbtn.Click += new System.EventHandler(this.addcartbtn_Click);
            // 
            // MainClientForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(654, 405);
            this.Controls.Add(this.addcartbtn);
            this.Controls.Add(this.backbtn);
            this.Controls.Add(this.greetinglb);
            this.Controls.Add(this.productdgv);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "MainClientForm";
            this.Text = "Товары";
            ((System.ComponentModel.ISupportInitialize)(this.productdgv)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView productdgv;
        private System.Windows.Forms.Label greetinglb;
        private System.Windows.Forms.Button backbtn;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button addcartbtn;
    }
}
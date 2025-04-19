namespace NixHashing
{
    partial class Form1
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
            this.label1 = new System.Windows.Forms.Label();
            this.btFile = new System.Windows.Forms.Button();
            this.backgroundWorker2 = new System.ComponentModel.BackgroundWorker();
            this.rbFile = new System.Windows.Forms.RadioButton();
            this.rbText = new System.Windows.Forms.RadioButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbMD5 = new System.Windows.Forms.RadioButton();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.rbSHA512 = new System.Windows.Forms.RadioButton();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.gb = new System.Windows.Forms.GroupBox();
            this.rbSHA256 = new System.Windows.Forms.RadioButton();
            this.tbOutput = new System.Windows.Forms.TextBox();
            this.tbInput = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.butRun = new System.Windows.Forms.Button();
            this.CopyBut = new System.Windows.Forms.Button();
            this.AboutBut = new System.Windows.Forms.Button();
            this.ClearBut = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.gb.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(15, 78);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Input Text :";
            // 
            // btFile
            // 
            this.btFile.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btFile.Location = new System.Drawing.Point(391, 19);
            this.btFile.Name = "btFile";
            this.btFile.Size = new System.Drawing.Size(102, 30);
            this.btFile.TabIndex = 5;
            this.btFile.Text = "Load file - Run";
            this.btFile.UseVisualStyleBackColor = true;
            this.btFile.Click += new System.EventHandler(this.btFile_Click_1);
            // 
            // rbFile
            // 
            this.rbFile.AutoSize = true;
            this.rbFile.Location = new System.Drawing.Point(58, 20);
            this.rbFile.Name = "rbFile";
            this.rbFile.Size = new System.Drawing.Size(45, 17);
            this.rbFile.TabIndex = 4;
            this.rbFile.Text = "File";
            this.rbFile.UseVisualStyleBackColor = true;
            // 
            // rbText
            // 
            this.rbText.AutoSize = true;
            this.rbText.Checked = true;
            this.rbText.Location = new System.Drawing.Point(6, 19);
            this.rbText.Name = "rbText";
            this.rbText.Size = new System.Drawing.Size(50, 17);
            this.rbText.TabIndex = 3;
            this.rbText.TabStop = true;
            this.rbText.Text = "Text";
            this.rbText.UseVisualStyleBackColor = true;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbFile);
            this.groupBox1.Controls.Add(this.rbText);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(250, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(119, 46);
            this.groupBox1.TabIndex = 18;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Select";
            // 
            // rbMD5
            // 
            this.rbMD5.AutoSize = true;
            this.rbMD5.Location = new System.Drawing.Point(161, 20);
            this.rbMD5.Name = "rbMD5";
            this.rbMD5.Size = new System.Drawing.Size(51, 17);
            this.rbMD5.TabIndex = 2;
            this.rbMD5.Text = "MD5";
            this.rbMD5.UseVisualStyleBackColor = true;
            // 
            // rbSHA512
            // 
            this.rbSHA512.AutoSize = true;
            this.rbSHA512.Location = new System.Drawing.Point(84, 20);
            this.rbSHA512.Name = "rbSHA512";
            this.rbSHA512.Size = new System.Drawing.Size(71, 17);
            this.rbSHA512.TabIndex = 1;
            this.rbSHA512.Text = "SHA512";
            this.rbSHA512.UseVisualStyleBackColor = true;
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // gb
            // 
            this.gb.Controls.Add(this.rbMD5);
            this.gb.Controls.Add(this.rbSHA512);
            this.gb.Controls.Add(this.rbSHA256);
            this.gb.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gb.Location = new System.Drawing.Point(11, 12);
            this.gb.Name = "gb";
            this.gb.Size = new System.Drawing.Size(215, 46);
            this.gb.TabIndex = 17;
            this.gb.TabStop = false;
            this.gb.Text = "Select";
            // 
            // rbSHA256
            // 
            this.rbSHA256.AutoSize = true;
            this.rbSHA256.Checked = true;
            this.rbSHA256.Location = new System.Drawing.Point(7, 20);
            this.rbSHA256.Name = "rbSHA256";
            this.rbSHA256.Size = new System.Drawing.Size(71, 17);
            this.rbSHA256.TabIndex = 0;
            this.rbSHA256.TabStop = true;
            this.rbSHA256.Text = "SHA256";
            this.rbSHA256.UseVisualStyleBackColor = true;
            // 
            // tbOutput
            // 
            this.tbOutput.Location = new System.Drawing.Point(18, 367);
            this.tbOutput.Multiline = true;
            this.tbOutput.Name = "tbOutput";
            this.tbOutput.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbOutput.Size = new System.Drawing.Size(491, 64);
            this.tbOutput.TabIndex = 15;
            // 
            // tbInput
            // 
            this.tbInput.Location = new System.Drawing.Point(18, 103);
            this.tbInput.Multiline = true;
            this.tbInput.Name = "tbInput";
            this.tbInput.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.tbInput.Size = new System.Drawing.Size(491, 156);
            this.tbInput.TabIndex = 6;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(15, 343);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(105, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "Output(hashing) :";
            // 
            // butRun
            // 
            this.butRun.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butRun.Location = new System.Drawing.Point(19, 276);
            this.butRun.Name = "butRun";
            this.butRun.Size = new System.Drawing.Size(75, 30);
            this.butRun.TabIndex = 7;
            this.butRun.Text = "Run";
            this.butRun.UseVisualStyleBackColor = true;
            this.butRun.Click += new System.EventHandler(this.butRun_Click);
            // 
            // CopyBut
            // 
            this.CopyBut.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CopyBut.Location = new System.Drawing.Point(18, 451);
            this.CopyBut.Name = "CopyBut";
            this.CopyBut.Size = new System.Drawing.Size(85, 30);
            this.CopyBut.TabIndex = 8;
            this.CopyBut.Text = "Copy output";
            this.CopyBut.UseVisualStyleBackColor = true;
            this.CopyBut.Click += new System.EventHandler(this.CopyBut_Click);
            // 
            // AboutBut
            // 
            this.AboutBut.Location = new System.Drawing.Point(463, 451);
            this.AboutBut.Name = "AboutBut";
            this.AboutBut.Size = new System.Drawing.Size(46, 23);
            this.AboutBut.TabIndex = 21;
            this.AboutBut.Text = "about";
            this.AboutBut.UseVisualStyleBackColor = true;
            this.AboutBut.Click += new System.EventHandler(this.AboutBut_Click);
            // 
            // ClearBut
            // 
            this.ClearBut.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ClearBut.Location = new System.Drawing.Point(127, 276);
            this.ClearBut.Name = "ClearBut";
            this.ClearBut.Size = new System.Drawing.Size(75, 30);
            this.ClearBut.TabIndex = 22;
            this.ClearBut.Text = "Clear";
            this.ClearBut.UseVisualStyleBackColor = true;
            this.ClearBut.Click += new System.EventHandler(this.ClearBut_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.ClientSize = new System.Drawing.Size(529, 494);
            this.Controls.Add(this.ClearBut);
            this.Controls.Add(this.AboutBut);
            this.Controls.Add(this.CopyBut);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btFile);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.gb);
            this.Controls.Add(this.tbOutput);
            this.Controls.Add(this.tbInput);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.butRun);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Nix Hashing by Lukas Setiawan";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.gb.ResumeLayout(false);
            this.gb.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btFile;
        private System.ComponentModel.BackgroundWorker backgroundWorker2;
        private System.Windows.Forms.RadioButton rbFile;
        private System.Windows.Forms.RadioButton rbText;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rbMD5;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.RadioButton rbSHA512;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.GroupBox gb;
        private System.Windows.Forms.RadioButton rbSHA256;
        private System.Windows.Forms.TextBox tbOutput;
        private System.Windows.Forms.TextBox tbInput;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button butRun;
        private System.Windows.Forms.Button CopyBut;
        private System.Windows.Forms.Button AboutBut;
        private System.Windows.Forms.Button ClearBut;
    }
}


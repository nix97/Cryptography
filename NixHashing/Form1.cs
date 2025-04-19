using System;
using System.Text;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.IO;


namespace NixHashing
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

   
        private void butRun_Click(object sender, EventArgs e)
        {
            //Example from here: https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.hashalgorithm.computehash?view=net-8.0#system-security-cryptography-hashalgorithm-computehash(system-byte())
            //Technical assistance by ChatGpt(very helpfull): https://chatgpt.com/

            rbText.Checked = true;
            
                if (rbSHA256.Checked)
                {
                    string source = tbInput.Text;

                    using (SHA256 sha256Hash = SHA256.Create())
                    {
                        string hash = GetHash(sha256Hash, source);
                        tbOutput.Text = hash.ToString();

                        if (VerifyHash(sha256Hash, source, hash) == false)
                           MessageBox.Show("The hashes are not the same !!!");

                    }
                }
                else if (rbSHA512.Checked)   //SHA 512 got twice output hexadecimal char(128 digit hexa)
                {

                    string source = tbInput.Text;
                    using (SHA512 sha512Hash = SHA512.Create())
                    {
                        string hash = GetHash(sha512Hash, source);
                         tbOutput.Text = hash.ToString();

                        if (VerifyHash(sha512Hash, source, hash) == false)
                            MessageBox.Show("The hashes are not the same !!!");
                    }
                }
                else if (rbMD5.Checked)
                {
                    string source = tbInput.Text;

                    using (MD5 md5Hash = MD5.Create())
                    {
                        string hash = GetHash(md5Hash, source);
                        tbOutput.Text = hash.ToString();

                        if (VerifyHash(md5Hash, source, hash) == false)
                            MessageBox.Show("The hashes are not the same !!!");
                    }
                }
                
            
            
        }

     
        private static string GetHash(HashAlgorithm hashAlgorithm, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = hashAlgorithm.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            var sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        // Verify a hash against a string.
        private static bool VerifyHash(HashAlgorithm hashAlgorithm, string input, string hash)
        {
            // Hash the input.
            var hashOfInput = GetHash(hashAlgorithm, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            return comparer.Compare(hashOfInput, hash) == 0;
        }


        private void btFile_Click(object sender, EventArgs e)
        {

          
            OpenFileDialog openFileDialog1 = new OpenFileDialog();
            if (rbFile.Checked)
            {
                if (openFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog1.FileName; ;
                    string fileContent = File.ReadAllText(filePath);
                    tbInput.Text = fileContent;
        
                }

            }
        }


        private void btFile_Click_1(object sender, EventArgs e)
        {
           
            OpenFileDialog openFileDialog1 = new OpenFileDialog();

            
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                rbFile.Checked = true;
                tbOutput.Clear();
                
                string filePath = openFileDialog1.FileName;

                if (rbSHA256.Checked)
                { 
                    using (SHA256 sha256 = SHA256.Create())
                    
                    using (FileStream stream = File.OpenRead(filePath))
                    {
                         byte[] hashBytes = sha256.ComputeHash(stream);
                         tbOutput.Text=BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                    }
                }
                else if (rbSHA512.Checked)
                {
                    using (SHA512 sha512 = SHA512.Create())

                    using (FileStream stream = File.OpenRead(filePath))
                    {
                        byte[] hashBytes = sha512.ComputeHash(stream);
                        tbOutput.Text = BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                    }
                }
                else //md5
                {
                    using (MD5 md5 = MD5.Create())

                    using (FileStream stream = File.OpenRead(filePath))
                    {
                        byte[] hashBytes = md5.ComputeHash(stream);
                        tbOutput.Text = BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                    }
                }
            }
            

        }

        private void CopyBut_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(tbOutput.Text);
        }

        private void AboutBut_Click(object sender, EventArgs e)
        {
            MessageBox.Show("|======== Nix Hashing ========|" + Environment.NewLine + Environment.NewLine +

                "Version 1.0 - build Apr 19, 2025." + Environment.NewLine +
                       "Created by Lukas Setiawan." + Environment.NewLine +
                       "Copyright (c) 2025. All Rights Reserved." + Environment.NewLine +
                       "Visit web: https://nix97.github.io/numericalmethods/" + Environment.NewLine +
                       "FB search: Metode Numerik-Plus Programnya." + Environment.NewLine +
                       "e-mail: lukassetiawan@yahoo.com." + Environment.NewLine + Environment.NewLine +
                       "My Work :" + Environment.NewLine +
                       "https://bitbucket.org/nixz97/nix/downloads/" + Environment.NewLine +
                       "Other repo on GitHub: https://github.com/nix97" + Environment.NewLine + Environment.NewLine +
                       "Accept donations for software development."
           );
        }

        private void ClearBut_Click(object sender, EventArgs e)
        {
            tbInput.Clear();
            tbOutput.Clear();

        }
    }

}





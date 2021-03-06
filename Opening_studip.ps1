 #Powershell script for studip
 $internet_test = ping google.com

#If your internet is fast, skip the next immediate code
Start-Sleep -Seconds 5

#If-condition to check whether you are connected to the internet
if ($internet_test.EndsWith("again.") -eq 'True') {

 [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
 [System.Windows.Forms.MessageBox]::Show("No Internet Connection")

} else {
 Add-Type -Assembly 'System.Windows.Forms'

$form = New-Object Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(330,270)
$form.MaximumSize = $form.Size 
$form.Text = "StudIP"

#Username label
$first_text = New-Object System.Windows.Forms.Label
$first_text.Size = New-Object System.Drawing.Size(90,20)
$first_text.Text = "Username: "
$first_text.Top = 20
$first_text.Left = 20
#$first_text.Anchor = 'left,top'

#Username Entry Field
$user = New-Object System.Windows.Forms.TextBox
$user.Size = New-Object System.Drawing.Size(250,50) 
$user.Top  = 50
$user.Left = 20
#$user.Height = 50
$user.Width = 250
#$user.Anchor = 'right,top'

#Password label
$sec_text = New-Object System.Windows.Forms.Label
$sec_text.Size = New-Object System.Drawing.Size(200,20) 
$sec_text.Text = "Password: "
$sec_text.Top = 80
$sec_text.Left = 20

#Password Field
$password = New-Object System.Windows.Forms.TextBox
#$password.Size = New-Object System.Drawing.Size(250,50)
$password.UseSystemPasswordChar = "*" 
$password.Top  = 110
$password.Left = 20
$password.Height = 50
$password.Width = 250

#Ok button click function
$ok_click = {
 $user_val = $user.Text 
 $pass_val = $password.Text 
 set-location "C:\Users\7flig\Desktop\pythonWorks"
 python .\studips.py $user_val $pass_val
 #$form.Close()
 }
 
#Ok Button
$ok_button = New-Object System.Windows.Forms.Button
$ok_button.Size = New-Object System.Drawing.Size(100,50)
#$ok_button.Location = New-Object System.Drawing.Size(140,44)
$ok_button.Top = 160
$ok_button.Left = 100
$ok_button.Add_Click($ok_click)

$ok_button.Text = "OK"
#$ok_button.Top = 80
#$ok_button.Left = 100

$form.Controls.Add($first_text)
$form.Controls.Add($sec_text)
$form.Controls.Add($user)
$form.Controls.Add($password)
$form.Controls.Add($ok_button)
$form.ShowDialog()
}


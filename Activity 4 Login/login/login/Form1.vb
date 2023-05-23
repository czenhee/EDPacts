Imports System.Data.OleDb

Public Class Form1
    Dim con As New OleDbConnection
    Dim dbProvider As String = "Provider=Microsoft.ACE.OLEDB.12.0;"
    Dim dbSource As String = "Data Source=C:\Users\ADMIN\Documents\EDP\login\Login.accdb;"
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        con.ConnectionString = dbProvider & dbSource
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If TextBox3.Text = Nothing Or TextBox4.Text = Nothing Then
            MessageBox.Show("Please enter empty details", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If

        If con.State = ConnectionState.Closed Then
            con.Open()
        End If

        Using cmd As New OleDbCommand("SELECT COUNT(*) FROM member WHERE [USERNAME] = @USERNAME OR [PASSWORD] = @PASSWORD", con)
            cmd.Parameters.AddWithValue("@USERNAME", OleDbType.VarChar).Value = TextBox3.Text.Trim
            cmd.Parameters.AddWithValue("@PASSWORD", OleDbType.VarChar).Value = TextBox4.Text.Trim

            Dim count = Convert.ToInt32(cmd.ExecuteScalar())
            If count > 0 Then
                MessageBox.Show("Oops, Username and Password has already take", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Sub
            End If
        End Using

        Using create As New OleDbCommand("INSERT INTO member([USERNAME],[PASSWORD])VALUES(@USERNAME,@PASSWORD)", con)
            create.Parameters.AddWithValue("@USERNAME", OleDbType.VarChar).Value = TextBox3.Text.Trim
            create.Parameters.AddWithValue("@PASSWORD", OleDbType.VarChar).Value = TextBox3.Text.Trim

            If create.ExecuteNonQuery Then
                MessageBox.Show("Account Successfully Created", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information)
                TextBox3.Clear()
                TextBox4.Clear()
            End If
        End Using
        con.Close()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = Nothing Or TextBox2.Text = Nothing Then
            MessageBox.Show("Please enter your details", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If

        If con.State = ConnectionState.Closed Then
            con.Open()
        End If

        Using login As New OleDbCommand("SELECT COUNT(*) FROM member WHERE [USERNAME] = @USERNAME AND [PASSWORD] = @PASSWORD", con)
            login.Parameters.AddWithValue("@USERNAME", OleDbType.VarChar).Value = TextBox1.Text.Trim
            login.Parameters.AddWithValue("@PASSWORD", OleDbType.VarChar).Value = TextBox2.Text.Trim

            Dim logincount = Convert.ToInt32(login.ExecuteScalar())
            If logincount > 0 Then
                Me.Hide()
                Form2.Show()
            Else
                MessageBox.Show("Oops, Invalid Input", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                TextBox1.Clear()
                TextBox2.Clear()
            End If
        End Using
        con.Close()
    End Sub
End Class

<#
    Creator: Dfaults
    Desciption: This script will locate the specified cookie in chrome browser in windows in order to delete it.
                This can also be used (with a little moding) to copy or change the cookie in said browser.
                This script needs to download the SQLite dll in order to work however the dll must be chosen
                according to you systems architecture (x32 or x64) and the .NET framework you currently have.
                You can figure those things out with two commands: [IntPtr]::Size and $PSVersionTable. 
                If the first command gives you a 4 then you're 32bits, if it's an 8 then pick 64bits. 
                As for the second one, the .NET Framework you use is specified on the CLRVersion line. 
                The link to the dll is https://system.data.sqlite.org/index.html/doc/trunk/www/downloads.wiki
#>


#Getting the current users name.
$computername = $env:username

#Getting the database ready for use.
$con = New-Object -TypeName System.Data.SQLite.SQLiteConnection

#Connecting to the database.
$con.ConnectionString = "Data Source=C:\database\test.db"

#Opening the database.
$con.Open()

#Creating commands to start editing the file.
$sql = $con.CreateCommand()

#This is the actual sql query you can change it to fit your needs.
$sql.CommandText = "SELECT * FROM test"

#This binds the sql query to the file.
$adapter = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $sql
$data = New-Object System.Data.DataSet
[void]$adapter.Fill($data)


#This closes the the query session and the file.
$sql.Dispose()
$con.Close()
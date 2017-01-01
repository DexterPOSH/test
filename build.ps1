Write-Host "$(whoami.exe)"
Write-Host "Local administrators"
net localgroup administrators


Write-host 'Trying to create PSSession'
$Session = New-PSSession -ComputerName localhost
$Session

if ($Session) {
  Write-Host -Fore Green 'Success'
}
else {
  throw 'PSSession creation failed'
}

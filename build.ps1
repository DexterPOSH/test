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

Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Install-Module -Name Pester -Scope CurrentUser -Force -Verbose

Describe 'testing PSSession at the one time initialization block' {
    Write-host 'Trying to create PSSession'
    $Session = New-PSSession -ComputerName localhost

    It 'Should open a PSSession' {
        $Session | Should NOT BeNullOrEmpty
    }
}

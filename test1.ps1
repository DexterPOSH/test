function Test-IsAdmin {

([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

}

Write-host 'Trying to create PSSession'
$Session = New-PSSession -ComputerName localhost

if (Test-IsAdmin) {

  Describe 'testing PSSession at the one time initialization block' {

      It 'Should open a PSSession' {
          $Session | Should NOT BeNullOrEmpty
      }
  }
}

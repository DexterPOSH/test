#requires -runasadministrator
if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] “Administrator”)) {

  Describe 'testing PSSession at the one time initialization block' {

      Write-host 'Trying to create PSSession'
      $Session = New-PSSession -ComputerName localhost

      It 'Should open a PSSession' {
          $Session | Should NOT BeNullOrEmpty
      }
  }
}

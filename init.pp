class ocs {
file {'c:/temp/test.ps1':
ensure => 'present',
content => "C:\Felipe\Linux\OCS\OCSNG-Windows-Agent-2.3.1.1\OCS-NG-Windows-Agent-Setup.exe /S /NOW /SERVER=http://192.168.3.75/ocsinventory /INSTALL /DEBUG /FORCE /NP"
}
exec { 'test.ps1':
  command   => '& C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned -file c:/temp/test.ps1; Exit 0',
  onlyif    => 'c:/temp/test.ps1',
  provider  => powershell,
  logoutput => true,
}
 }

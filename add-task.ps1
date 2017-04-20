function Add-Task{
  param
  (
  
     [Parameter(Mandatory=$True)]
     [string]$program,
     [string]$taskName,
     [string]$argument,
     [string]$userName,
     [string]$password,
     [Parameter(Mandatory=$False)]
     [string]$workingDirectory
  
  )
  
     process {
            
          if ($workingDirectory) { 
          
               $action = New-ScheduledTaskAction -Execute $program -Argument $argument -WorkingDirectory $workingDirectory
          }
            
          else { 
          
               $action = New-ScheduledTaskAction -Execute $program -Argument $argument 
               
          }

          $settings = New-ScheduledTaskSettingsSet
     
          $inputObject = New-ScheduledTask -Action $action -Settings $settings 
            
          Register-ScheduledTask -TaskName $taskName -InputObject $inputObject -User $user -Password $password
  
     }

}


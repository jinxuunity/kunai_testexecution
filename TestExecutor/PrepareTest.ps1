﻿<#
    Delete the old docker containters and images. 
    Save the mapped volume data to temp folder
    pull lastet master
    run the kunai docker test envrionment.
    After the dockers are up and running, move the volume back to docker
#>

param (
    [bool] $reloadkatana = $false,
    [bool] $reloadkatanabase = $false
)

. .\settings.ps1

.\deleteDockerSetup.ps1 -reloadkatana $reloadkatana -reloadkatanabase $reloadkatanabase
#.\moveVolumeOutDocker.ps1
.\pullMaster.ps1

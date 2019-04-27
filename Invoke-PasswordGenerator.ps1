function Invoke-PasswordGenerator {
    [cmdletbinding()]
    param(
        [Parameter(Position=0)]
        [String]$MinLength = "32",
        [Parameter(Position=1)]
        [String]$MinWords = "5",
        [Parameter(Position=2)]
        [String]$Separator = ".",
        [Parameter(Position=3)]
        [String]$AddNumber = "True",
        [Parameter(Position=4)]
        [String]$AddUppercase = "True"
    )
    $passGenReqBody = @{
        MinLength = "$MinLength";
        MinWords = "$MinWords";
        Separator = "$Separator";
        AddNumber = "$AddNumber";
        AddUppercase = "$AddUppercase"
    }
    $passGenReqBodyJson = $passGenReqBody | ConvertTo-Json
    $passGenUri = "http://getanewpassword.com/api/generatepassword"
    $passGenParams = @{
        Body = $passGenReqBodyJson;
        Method = "Get";
        Uri = $passGenUri;
        ContentType = "application/json"
    }
    $passGenReqData = Invoke-RestMethod @passGenParams -Verbose
    Write-Output "`r`nYour password is: $($passGenReqData.Password)`r`n"
}

Clear-Host
Write-Host "`r`nInvoke-PasswordGenerator -MinLength 35 -MinWords 6 -Separator '.' -AddNumber True -AddUppercase True`r`n"
Invoke-PasswordGenerator -MinLength 35 -MinWords 6 -Separator '.' -AddNumber True -AddUppercase True
Write-Host "Invoke-PasswordGenerator -MinLength 150 -MinWords 15 -Separator '-' -AddNumber True -AddUppercase False`r`n"
Invoke-PasswordGenerator -MinLength 150 -MinWords 15 -Separator '-' -AddNumber True -AddUppercase False

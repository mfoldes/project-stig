configuration Windows10v1r23
{
    param()
    Import-DscResource -ModuleName PowerSTIG -ModuleVersion 4.5.0
    Node localhost
    {
        WindowsClient BaseLine
        {
            OsVersion   = '10'
            StigVersion = '1.23'
            SkipRule    = 'V-63879','V-63845','V-63403','V-63339','V-63369'#,'testedV-63341' ,'V-63347','V-63335','V-63375'
            Exception   = @{
                'V-63597' = @{
                    ValueData = '1' # Required for using Azure Image Builder access to creation
                }
                'V-' = @{
                    Identity = 'Guests' 
                }
                'V-63871' = @{
                    Identity = 'Guests' 
                }
            }
        }
    }
}
Windows10v1r23  -Output c:\imagebuilder
function Measure-ScriptBlock {
        <#
        .Description
        Time-Command accepts a `scriptblock` argument and executes it in a child context.
        Time-Command returns an array of values in the format:
                @($stopwatch, $success, $result, $Error)
        $stopwatch - The stopwatch object
        $success - A boolean for whether the command failed
        $result - The result of the command, $null if failed
        $Error - The error raised if the command failed
        #>
        param(
                [Parameter(Mandatory=$true)][scriptblock]$Scriptblock
        )
        $stopwatch = [System.Diagnostics.StopWatch]::StartNew()
        $success = $true
        try {
                $result = & $Scriptblock
        } catch {
                $stopwatch.stop()
                return @($stopwatch, $false, $null, $Error)
        }
        $stopwatch.stop()
        return @($stopwatch, $true, $result, $null)
}
New-Alias "ms" -Value "Measure-ScriptBlock"
Export-ModuleMember -Function Measure-ScriptBlock -Alias ms


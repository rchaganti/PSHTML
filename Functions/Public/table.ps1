Function Table {
<#
    .LINK
    https://github.com/Stephanevg/PSHTML
#>
    Param(

        [Parameter(
            ValueFromPipeline = $true,
            Mandatory = $false,
            Position = 0
        )]
        [scriptblock]
        $ChildItem,

        [Parameter(Position = 1)]
        [String]$Class
    )
    Process{
        if ($Class)
        {
            "<table class='$class'>"            
        }
        else
        {
            '<table>'    
        }

        if($ChildItem){
            $ChildItem.Invoke()
        }

        '</Table>'
    }


}
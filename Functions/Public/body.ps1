Function Body {
    <#
        .SYNOPSIS
        Generates a Body HTML tag.

        .PARAMETER Class
        Allows to specify one (or more) class(es) to assign the html element.
        More then one class can be assigned by seperating them with a white space.

        .PARAMETER Id
        Allows to specify an id to assign the html element.

        .PARAMETER Style
        Allows to specify in line CSS style to assign the html element.

        .PARAMETER Content
        Allows to add child element(s) inside the current opening and closing HTML tag(s).


        .EXAMPLE
        The following exapmles show cases how to create an empty Body, with a class, an ID, and, custom attributes.
        Body -Class "myclass1 MyClass2" -Id myid -Attributes @{"custom1"='val1';custom2='val2'}

        Generates the following code:

        <Body Class="myclass1 MyClass2" Id="myid" custom1="val1" custom2="val2"  >
        </Body>


        .NOTES
        Current version 1.0
        History:
            2018.04.10;Stephanevg; Added parameters
            2018.04.01;Stephanevg;Creation.
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
        $Content,

        [Parameter(Position = 1)]
        [String]$Class,

        [Parameter(Position = 2)]
        [String]$Id,

        [Parameter(Position = 3)]
        [String]$Style,

        [Parameter(Position = 4)]
        [Hashtable]$Attributes
    )
    Process{


        $attr = ""
        $CommonParameters = ("Attributes", "Content") + [System.Management.Automation.PSCmdlet]::CommonParameters + [System.Management.Automation.PSCmdlet]::OptionalCommonParameters
        $CustomParameters = $PSBoundParameters.Keys | Where-Object -FilterScript { $_ -notin $CommonParameters }

        if($CustomParameters){

            foreach ($entry in $CustomParameters){


                $Attr += "{0}=`"{1}`" " -f $entry,$PSBoundParameters[$entry]

            }

        }

        if($Attributes){
            foreach($entry in $Attributes.Keys){

                $attr += "{0}=`"{1}`" " -f $entry,$Attributes[$Entry]
            }
        }

        if($attr){
            "<Body {0} >"  -f $attr
        }else{
            "<Body>"
        }



        if($Content){
            $Content.Invoke()
        }


        '</Body>'
    }


}
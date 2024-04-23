tableextension 52783 "Dimension Ext." extends Dimension
{
    /*
    #001 - SQD - JTP - 20210823 - JDE Interface
        New Field
            Dimension Type
    */
    fields
    {
        field(52750; "Dimension Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Segment,"Cost Center",Park;
            OptionCaption = ' ,Segment,Cost Center,Park';
            Caption = 'Dimension Type';
            Description = '#001 - SQD - JTP - 20210823 - JDE Interface';
        }
    }
}
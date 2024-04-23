tableextension 52784 "Dimension Value Ext." extends "Dimension Value"
{
    /*
    JDE_INT SQD RTV 20210805
        New field: 50000 - "JDE Code"
    */
    fields
    {
        field(52750; "JDE Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'JDE Code';
            Description = 'JDE_INT SQD RTV 20210805';
        }
    }
}
tableextension 52752 "G/L Entry Ext." extends "G/L Entry"
{
    /*    
    JDE_INT SQD RTV 20210805
        New field: 50001 - "JDE Integrated"
    */
    fields
    {
        field(52750; "Centro Responsabilidade"; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Student Ledger Entry"."Responsibility Center" WHERE("Entity Customer No." = FIELD("Source No.")));
        }
        field(52751; "JDE Integrated"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'JDE Integrated';
            Description = 'JDE_INT SQD RTV 20210805';
            OptionMembers = Old,"Not Integrated",Integrated;
            OptionCaption = 'Old,Not Integrated,Integrated';
            InitValue = "Not Integrated";
        }
    }
}
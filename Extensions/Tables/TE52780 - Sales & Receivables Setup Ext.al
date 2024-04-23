tableextension 52780 "Sales & Receivables Setup Ext." extends "Sales & Receivables Setup"
{
    fields
    {
        field(52750; "Fin. Charges Memo PT Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Fin. Charge PT Code';
            Description = 'IT001';
            TableRelation = "Finance Charge Terms";
        }
        field(52751; "Fin. Charges Memo ENG Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Fin. Charge ENG Code';
            Description = 'IT001';
            TableRelation = "Finance Charge Terms";
        }
        field(52752; "Reminder Terms Code PT"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reminder Terms Code PT';
            Description = 'IT001';
            TableRelation = "Reminder Terms";
        }
        field(52753; "Reminder Terms Code ENG"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reminder Terms Code';
            Description = 'IT001';
            TableRelation = "Reminder Terms";
        }
    }
}
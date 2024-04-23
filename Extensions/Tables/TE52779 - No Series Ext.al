tableextension 52779 "No. Series Ext." extends "No. Series"
{
    /*
    //IT001 - Parque - Portal Fardas - 2017.04.26 - novo campo Fatura Stocks
    */
    fields
    {
        field(52750; "Registed Nos."; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Registed Nos.';
            TableRelation = "No. Series";
        }
        field(52751; "Document Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document Name';
        }
        field(52752; "Fatura Stocks"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Fatura Stocks';
        }
    }
}
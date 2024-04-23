tableextension 52790 "Item Category Ext." extends "Item Category"
{
    /*
    //IT001 - Park - 2017.12.13 - Portal Fardas - Novo campo Description ENG
    */
    fields
    {
        field(52750; "Description ENG"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description ENG';
            Description = 'Portal Fardas';
        }
    }
}
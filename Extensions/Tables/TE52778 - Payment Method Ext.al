tableextension 52778 "Payment Method Ext." extends "Payment Method"
{
    /*
    IT001 - 2017.11.13 - Park - Novo campo Description ENG para tradução nas faturas
    IT002 - 2018.06.14 - Park - Novos campos Abbreviation e Abbreviation ENG
    */
    fields
    {
        field(52750; "Description ENG"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description ENG';
            Description = 'Park';
        }
        field(52751; Abbreviation; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Abbreviation';
            Description = 'Park';
        }
        field(52752; "Abbreviation ENG"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Abbreviation ENG';
            Description = 'Park';
        }
        field(52753; "Payment Edu"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payment Edu.';
        }
    }
}
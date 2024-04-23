tableextension 52772 "Gen. Journal Batch Ext." extends "Gen. Journal Batch"
{
    fields
    {
        field(52750; "Payment Suggest."; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Sugestão Pagam.';
        }
        field(52751; "Bal. cash-flow code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bal: cash-flow code';
        }
    }
}
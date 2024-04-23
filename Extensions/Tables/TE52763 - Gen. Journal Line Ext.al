tableextension 52763 "Gen. Journal Line Ext." extends "Gen. Journal Line"
{
    fields
    {
        field(52750; "Bank Entity"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(52751; "Account Description"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Account Description';
        }
        field(52752; "Entry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry Date';
        }
        field(52753; "Automatic Hold"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Automatic Hold';
        }
        field(52754; "Process by Education"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Process by Education';
        }
    }

    trigger OnAfterDelete()
    begin
        DeletePaymentFileErrors; //TFS354624,n
    end;
}
tableextension 52775 "Bank Account Ledger Entry Ext." extends "Bank Account Ledger Entry"
{
    fields
    {
        field(52750; "Bank Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Computer Check","Manual Check",,,,,"Electronic Payment";
            OptionCaption = ' ,Computer Check,Manual Check,,,,,Electronic Payment';
            Caption = 'Bank Payment Type';
        }
    }
}
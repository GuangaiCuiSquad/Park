pageextension 52777 "Payment Journal Ext." extends "Payment Journal"
{
    layout
    {
        addafter("Document Date")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
        }
    }
}
pageextension 52766 "Sales Cr. Memo Subform Ext." extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
            }
        }
        addafter("IC Partner Ref. Type")
        {
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}
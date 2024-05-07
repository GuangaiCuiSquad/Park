page 53024 "Services List"
{
    Caption = '';
    PageType = ListPart;
    SourceTable = Registration;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Control1000000026)
            {
                ShowCaption = false;
                field(Selection; Rec.Selection)
                {
                    ApplicationArea = All;
                }
                field("Student Code No."; Rec."Student Code No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Class No."; Rec."Class No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}

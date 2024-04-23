tableextension 52764 "User Setup Extension" extends "User Setup"
{
    fields
    {
        field(52750; "MCT Resp. Filter"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'MCT Resp. Ctr. Filter';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin
                "Sales Resp. Ctr. Filter" := "MCT Resp. Filter";
                "Purchase Resp. Ctr. Filter" := "MCT Resp. Filter";
                "Service Resp. Ctr. Filter" := "MCT Resp. Filter";
            end;
        }
        field(52751; "MCT Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52752; "Budget Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52753; "Vendor NIB Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Admin NIB Fornecedor';
        }
        field(52754; "G/L Account Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52755; "Mgt. Report Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52756; "Reconciliation Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52757; "MCT Contract Reactivation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52758; "Delete Consumption Lines"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Delete Consumption Lines';
        }
        field(52759; "View All RCs"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52760; "Customer NIB Admin"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Admin NIB Cliente';
        }
        field(52761; "User Portal"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Utilizador Portal';
        }
        field(52762; "Education Resp. Ctr. Filter"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Education Resp. Ctr. Filter';
            TableRelation = "Responsibility Center";
        }
        field(52763; "Debit Card Payment"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Debit Card Payment';
            //TableRelation = "Payment Method" WHERE ("Payment Edu"=FILTER(Yes));
        }
        field(52764; "Check Payment"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Check Payment';
            //TableRelation = "Payment Method" WHERE ("Payment Edu"=FILTER(Yes));
        }
        field(52765; "Credit Card Payment"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Credit Card Payment';
            //TableRelation = "Payment Method" WHERE ("Payment Edu"=FILTER(Yes));
        }
        field(52766; "Cash Payment"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cash Payment';
            //TableRelation = "Payment Method" WHERE ("Payment Edu"=FILTER(Yes));
        }
        field(52767; "Transfer Payment"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Transfer Payment';
            //TableRelation = "Payment Method" WHERE ("Payment Edu"=FILTER(Yes));
        }
        field(52768; "Save Global Filters"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Save Global Filters';
        }
        field(52769; "Allow Credit Memo"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Allow Credit Memo';
        }
    }
}
tableextension 52781 "Inventory Setup Ext." extends "Inventory Setup"
{
    /*
    //IT001 - Park - 2017.12.13 - Portal Fardas - Novos campos 50000 para quando se criam novos produtos
    */
    fields
    {
        field(52750; "Item Category Code by Default"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Category Code by Default';
            Description = 'Fardas';
            TableRelation = "Item Category".Code;
        }
        field(52751; "Product Group Code by Default"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Product Group Code by Default';
            Description = 'Fardas';
            //TableRelation = "Product Group".Code WHERE ("Item Category Code"=FIELD("Item Category Code by Default"));
        }
    }
}
tableextension 52767 "Sales Shipment Header Ext." extends "Sales Shipment Header"
{
    /*
    IT010 - Park - Novo campo 	Portal Created by	 - 2018.01.30 - pedido 1093
    */
    fields
    {
        field(52750; "Portal Created by"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Criação Portal';
        }
    }
}
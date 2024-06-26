tableextension 52751 "Location Ext." extends Location
{
    /*
    //IT001 - Parque 2016.09.30 - novo campo Resp Center para ligar as location com os Centros Resp
    //IT002 - Parque 2016.10.07 - novo campo Armazém geral usado nas ordens de transferencia
    */
    fields
    {
        field(52750; "Resp. Center"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Parque';
            TableRelation = "Responsibility Center";
        }
        field(52751; "Armazem Geral"; Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'Parque';
        }
    }
}
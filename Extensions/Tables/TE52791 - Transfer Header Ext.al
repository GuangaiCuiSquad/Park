tableextension 52791 "Transfer Header Ext." extends "Transfer Header"
{
    /*
    //IT001 - Parque - 2016.10.10 - para ligar a ordem de transf. à encomenda foi criado o campo No. Encomenda Venda
    */
    fields
    {
        field(52750; "No. Encomenda Venda"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Parque';
        }
    }
}
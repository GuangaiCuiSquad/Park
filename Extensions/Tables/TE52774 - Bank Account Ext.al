tableextension 52774 "Bank Account Ext." extends "Bank Account"
{
    fields
    {
        field(52750; Payments; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Payments';
        }
        field(52751; "Nome Diário Recebimentos"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Transferencias';
            TableRelation = "Gen. Journal Template";
        }
        field(52752; "Nome Secção Diário Rec."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Transferencias';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nome Diário Recebimentos"));
        }
        field(52753; "Conta Clientes Diário Rec."; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Transferencias';
            TableRelation = "G/L Account"."No.";
        }
        field(52754; "Cod. Fluxo-Caixa"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Transferencias';
            TableRelation = "Cash Flow Account";
        }
        field(52755; "Nome Ficheiro Rec"; Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Transferencias';
        }
        field(52756; "Caminho Ficheiro PS2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
        }
        field(52757; "Código Tipo Operação"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
            //TableRelation = "Tipos Operação"."Tipo Operação";
        }
        field(52758; "Referencia Ficheiro PS2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
        }
        field(52759; "Nome Diário PS2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
            TableRelation = "Gen. Journal Template";
        }
        field(52760; "Nome Secção PS2"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nome Diário PS2"));
        }
        field(52761; "Cod. Fluxo-Caixa DB"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Conf. Deb Directos';
            TableRelation = "Cash Flow Account";
        }
        field(52762; "Caminho Ficheiro EAN"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(52763; "ID CRED"; Code[6])
        {
            DataClassification = ToBeClassified;
        }
        field(52764; "Bank Entity"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(52765; "Débitos Directos"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",BPI,"Caixa Agrícola",Deutsch,BCP,Totta;
            OptionCaption = ' ,BPI,Caixa Agrícola,Deutsch,BCP,Totta';
        }
        field(52766; Sign1Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Assinatura 1';
        }
        field(52767; Sign2Name; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Assinatura 2';
        }
        field(52768; "Internal"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Grupo';

            trigger OnValidate()
            begin
                IF NOT Internal THEN
                    TESTFIELD("Business Unit Code 2", '');
            end;
        }
        field(52769; "Business Unit Code 2"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Business Unit Code 2';
            TableRelation = "Business Unit";

            trigger OnValidate()
            begin
                IF "Business Unit Code 2" <> '' THEN
                    TESTFIELD("Internal");
            end;
        }
    }
}
tableextension 52786 "Analysis View Entry Ext." extends "Analysis View Entry"
{
    fields
    {
        field(52750; Seccao; Code[10])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Entry"."Journal Batch Name" WHERE("Entry No." = FIELD("Entry No.")));
            Description = 'OParque';
        }
        field(52751; NDocumento; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("G/L Entry"."Document No." WHERE("Entry No." = FIELD("Entry No.")));
            Description = 'OParque';
        }
    }
}
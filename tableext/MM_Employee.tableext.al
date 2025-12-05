tableextension 50100 "MM Employee" extends Employee
{
    fields
    {
        field(50100; "MM Total Maintenance Bonus"; Decimal)
        {
            Caption = 'Total Maintenance Bonus';
            FieldClass = FlowField;
            Editable = false;

            CalcFormula = Sum("MM Employee Bonus Log"."Bonus Amount" where("Employee No." = field("No.")));
        }
    }
}

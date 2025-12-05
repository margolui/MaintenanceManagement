pageextension 50102 "MM Employee Card" extends "Employee Card"
{
    layout
    {
        addafter(General)
        {
            field("MM Total Maintenance Bonus"; Rec."MM Total Maintenance Bonus")
            {
                ApplicationArea = All;
            }
        }
    }
}

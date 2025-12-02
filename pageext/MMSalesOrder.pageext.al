pageextension 50110 "MM Sales Order" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action(MyCustomAction)
            {
                ApplicationArea = All;
                Caption = 'My Button';
                Image = Action;

                trigger OnAction()
                var
                    MmManagement: Codeunit "MM Management";
                    TotalIncVAT: Decimal;
                begin
                    TotalIncVAT := MmManagement.GetTotalInclVAT(Rec);
                    Message('Total Incl. VAT: %1', TotalIncVAT);

                    /* TotalIncVAT := MMTest.CalculateTotalInclVAT(Rec);
                    Message('Total Incl. VAT: %1', TotalIncVAT);

                    //MMTest.CalcAmount(Rec);
                    MMTest.TotalIcncVat(Rec); */
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        MmManagement: Codeunit "MM Management";
    begin
        MmManagement.TestSalesLineFilter();
    end;

}
codeunit 50110 "MM Management"
{

    procedure TestSalesLineFilter()
    var
        SalesLine: Record "Sales Line";
        Total: Decimal;
    begin
        /* SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", '101001');

        if SalesLine.FindSet() then
            repeat
                Total := SalesLine.Quantity * SalesLine."Unit Price";

                Message(
                    'Item: %1, Qty: %2, Price: %3, Total: %4',
                    SalesLine."No.",
                    SalesLine.Quantity,
                    SalesLine."Unit Price",
                    Total
                );

            until SalesLine.Next() = 0; */
    end;

    procedure CalcAmount(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        MaxAmount: Decimal;

        LineNos: Text;
        Qty: Decimal;
        MaxLineNo: Text;
        TextResult: Text;
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        // Пошук найдорожчого рядка
        if SalesLine.FindSet() then
            repeat
                if SalesLine.Quantity * SalesLine."Unit Price" > MaxAmount then
                    MaxAmount := SalesLine.Quantity * SalesLine."Unit Price";

            until SalesLine.Next() = 0;
        Message('Line is %2 The highest total: %1', MaxAmount, SalesLine."No.");
    end;

    /* procedure TotalIcncVat(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        Total_Incl_Vat: Decimal;
        DocumentTotals: Codeunit "Document Totals";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then
            repeat
                DocumentTotals.CalculateSalesSubPageTotals(SalesHeader, SalesLine)
            until SalesLine.Next() = 0;
        Message(Format(Total_Incl_Vat));
    end; */

    procedure GetTotalInclVAT(SalesHeader: Record "Sales Header"): Decimal
    var
        SalesLine: Record "Sales Line";
        TotalLine: Record "Sales Line";
        DocumentTotals: Codeunit "Document Totals";
        TotalAmountInclVAT: Decimal;
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindFirst() then
            DocumentTotals.CalculateSalesTotals(SalesLine, SalesLine."Amount Including VAT", SalesLine);

        exit(SalesLine."Amount Including VAT");
    end;

    procedure BonusCalc(MaintenanceLog: Record "MM Maintenance Log")
    var
        EmployeeBonusLog: Record "MM Employee Bonus Log";
        BonusAmount: Decimal;
        Employee: Record Employee;
    begin

        case MaintenanceLog.Type of
            MaintenanceLog.Type::Repair:
                BonusAmount := 10;
            MaintenanceLog.Type::Cleaning:
                BonusAmount := 5;
            MaintenanceLog.Type::Replacement:
                BonusAmount := 15;
            MaintenanceLog.Type::Inspection:
                BonusAmount := 8;
        end;

        EmployeeBonusLog.Init();
        EmployeeBonusLog."Employee No." := MaintenanceLog."Employee No.";
        EmployeeBonusLog."Bonus Amount" := BonusAmount;
        EmployeeBonusLog."Posting Date" := Today;
        EmployeeBonusLog."Maintenance ID" := MaintenanceLog."Entry No.";
        EmployeeBonusLog.Insert();
    end;

    /*
The client has the following requirement:
When a manager changes the Unit Price in a Sales Order document, the system must:
Check whether the discount exceeds 20% compared to the standard price.
If it does, the system should display a WARNING and write a log entry into a new table called "Price Change Log".
    */

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateUnitPrice, '', false, false)]
    local procedure OnBeforeValidateUnitPrice_SalesLine(var SalesLine: Record "Sales Line"; CurrentFieldNo: Integer; var IsHandled: Boolean)
    var
        Item: Record Item;
        DiscountPercentage: Decimal;
        StandardPrice: Decimal;
        PriceChangeLog: Record "MM Price Change Log";
    begin
        Item.Get(SalesLine."No.");
        StandardPrice := Item."Unit Price";
        DiscountPercentage := ((StandardPrice - SalesLine."Unit Price") / StandardPrice) * 100;
        if
        DiscountPercentage > 20 then begin
            Message('WARNING: The discount of %1%% exceeds the allowed limit of 20%%.', DiscountPercentage);

            // Insert a log entry into the "Price Change Log" table

            PriceChangeLog.Init();
            PriceChangeLog."Line No." := SalesLine."Line No.";
            PriceChangeLog."Old Unit Price" := StandardPrice;
            PriceChangeLog."New Unit Price" := SalesLine."Unit Price";
            PriceChangeLog.Insert();
        end;
    end;
}

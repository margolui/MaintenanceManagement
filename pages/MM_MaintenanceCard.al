page 50107 "MM Maintenance Order"
{
    ApplicationArea = All;
    Caption = 'Maintenance Order';
    PageType = Card;
    SourceTable = "MM Maintenance Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer No.';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Name';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the customer that you send or sent the invoice or credit memo to.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contact';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                    Visible = false;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ToolTip = 'Specifies the value of the Posting Description field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field("Assigned Technician"; Rec."Assigned Technician")
                {
                    ToolTip = 'Specifies the value of the Assigned Technician field.', Comment = '%';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ToolTip = 'Specifies the value of the Employee No. field.', Comment = '%';
                }
            }
            part(MaintenanceOrderSubform; "MM Maintenance Order Subform")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group("MM_O&rder")
            {
                Caption = 'MM_O&rder';
                Image = "Order";
                action(MM_Statistics)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                    trigger OnAction()
                    var
                    begin
                        OpenDocumentStatisticsInternal();
                        CurrPage.MaintenanceOrderSubform.Page.ForceTotalsCalculation();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';
            }
            actionref(MM_Statistics_; MM_Statistics)
            {
            }
        }
    }
    procedure OpenDocumentStatisticsInternal()
    var
        IsHandled: Boolean;
    begin

        PrepareOpeningDocumentStatistics();
        ShowDocumentStatisticsPage();
    end;

    procedure PrepareOpeningDocumentStatistics()
    var
        [SecurityFiltering(SecurityFilter::Ignored)]
        SalesHeader2: Record "Sales Header";
        [SecurityFiltering(SecurityFilter::Ignored)]
        SalesLine2: Record "Sales Line";
    begin
        if not SalesHeader2.WritePermission() or not SalesLine2.WritePermission() then
            Error(StatisticsInsuffucientPermissionsErr);

        //CalcInvDiscForHeader();

        // if IsOrderDocument() then
        //     CreateDimSetForPrepmtAccDefaultDim();


        Commit();
    end;

    /* procedure CalcInvDiscForHeader()
    var
        SalesInvDisc: Codeunit "Sales-Calc. Discount";
        IsHandled: Boolean;
    begin

        SalesSetup.Get();
        if SalesSetup."Calc. Inv. Discount" then
            SalesInvDisc.CalculateIncDiscForHeader(Rec);
    end; */

    procedure CalculateIncDiscForHeader(var TempSalesHeader: Record "MM Maintenance Header")
    var
        SalesSetup: Record "Sales & Receivables Setup";
        IsHandled: Boolean;
    begin
        SalesSetup.Get();
        if not SalesSetup."Calc. Inv. Discount" then
            exit;

        MaintenanceLine."Document Type" := TempSalesHeader."Document Type";
        MaintenanceLine."Document No." := TempSalesHeader."No.";
        UpdateHeader := true;
        //CalculateInvoiceDiscount(TempSalesHeader, TempSalesLine);
    end;

    procedure ShowDocumentStatisticsPage() StatisticsPageId: Integer
    begin
        //StatisticsPageId := GetStatisticsPageID();

        //OnGetStatisticsPageID(StatisticsPageId, Rec);

        //SkipStatsPrep := true;
        PAGE.RunModal(StatisticsPageId, Rec);
        //ResetSkipStatisticsPreparationFlag();

        //SalesCalcDiscountByType.ResetRecalculateInvoiceDisc(Rec);
    end;

    local procedure GetStatisticsPageID(): Integer
    begin
        if IsOrderDocument() then
            exit(PAGE::"Sales Order Statistics");

        exit(PAGE::"Sales Statistics");
    end;

    local procedure IsOrderDocument(): Boolean
    begin
        exit(Rec."Document Type" in [Rec."Document Type"::Order, Rec."Document Type"::"Blanket Order", Rec."Document Type"::"Return Order"])
    end;

    var
        MaintenanceLine: Record "MM Maintenance Line";
        SalesSetup: Record "Sales & Receivables Setup";
        UpdateHeader: Boolean;
        StatisticsInsuffucientPermissionsErr: Label 'You don''t have permission to view statistics.';
}

pageextension 50101 "MM Vendor Card" extends "Vendor Card"
{
    actions
    {
        addlast("&Purchases")
        {
            action(MyCustomAction)
            {
                ApplicationArea = All;
                Caption = 'MM Items';
                Image = Item;

                trigger OnAction()
                var
                    Item: Record Item;
                    ItemList: Text;
                begin
                    Item.SetRange("Vendor No.", Rec."No.");
                    PAGE.Run(PAGE::"Item List", Item);

                    /* if Item.FindSet() then
                        repeat
                            ItemList += Item."No." + ' ' + Item.Description + ', ';
                        until Item.Next() = 0;
                    Message(ItemList); */
                end;
            }
        }
    }
}

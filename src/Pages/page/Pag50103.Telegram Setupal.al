page 50103 "Telegram Setup"
{
    PageType = Card;
    SourceTable = "Telegram Setup";
    Caption = 'Telegram Setup';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Token; Rec.Token)
                {
                    ApplicationArea = All;
                }
                field("Bot ID"; Rec."Bot ID")
                {
                    ApplicationArea = All;
                }
                field(Message; Rec.Message)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("send message")
            {
                Caption = 'Send Message';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                Image = SendTo;

                trigger OnAction()
                var
                    Send: Codeunit TelegramSetup;

                begin
                    Send.SendTelegramMessage(Rec);
                end;
            }
        }
    }
}

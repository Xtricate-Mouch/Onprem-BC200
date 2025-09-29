table 50101 "Telegram Setup"
{
    Caption = 'Telegram Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; Token; Code[100])
        {
            Caption = 'Token';
            DataClassification = CustomerContent;
        }
        field(3; "Bot ID"; Code[50])
        {
            Caption = 'Bot ID';
            DataClassification = CustomerContent;
        }
        field(4; "Message"; Text[100])
        {
            Caption = 'Message';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}

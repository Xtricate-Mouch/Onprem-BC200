table 50102 "Telegram Users"
{
    Caption = 'Telegram Users';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Telegram Chat ID"; Integer)
        {
            Caption = 'Telegram Chat ID';
        }
        field(2; "Telegram User ID"; Code[100])
        {
            Caption = 'Telegram User ID';
        }
        field(3; "Approval User ID"; Code[50])
        {
            Caption = 'Approval User ID';
        }
    }
    keys
    {
        key(PK; "Telegram Chat ID")
        {
            Clustered = true;
        }
    }
}

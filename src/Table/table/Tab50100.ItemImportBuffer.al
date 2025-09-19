table 50100 "So Import Buffer"
{
    Caption = 'Item Import Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Batch Name"; Code[20])
        {
            Caption = 'Batch Name';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(3; "File Name"; Text[50])
        {
            Caption = 'File Name';
        }
        field(4; "Sheet Name"; Text[30])
        {
            Caption = 'Sheet Name';
        }
        field(5; "Import Date"; Date)
        {
            Caption = 'Import Date';
        }
        field(6; "Import Time"; Time)
        {
            Caption = 'Import Time';
        }
        field(7; "No."; Code[30])
        {
            Caption = 'No.';
        }
        field(8; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(9; "Item Category Code"; Code[30])
        {
            Caption = 'Item Category Code';
        }
    }
    keys
    {

        key(Key1; "Batch Name", "Line No")
        {
        }
    }

}

report 50000 "CPA EnviaEmail"

{
    Caption = 'Enviar Fatura Email Test';
    //ProcessingOnly = true;
    ApplicationArea = All;
    UsageCategory = Tasks;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Posting Date", "Sell-to Customer No.";
            RequestFilterHeading = 'Faturas Registadas';

            trigger OnAfterGetRecord()
            var
                ReportExample: Report "CPA EnviaEmail";
                ReportParameters: Text;
            begin
                if rEduConfiguration.Get then
                    if rEduConfiguration."Send E-Mail Invoice" then
                        if recCustomer.Get("Sales Invoice Header"."Sell-to Customer No.") then begin
                            ReportParameters := ReportExample.RunRequestPage();
                            TempBlob.CreateOutStream(OutStr);
                            Report.SaveAs(Report::"CPA EnviaEmail", ReportParameters, ReportFormat::Pdf, OutStr);
                            TempBlob.CreateInStream(InStr);
                            EmailMessage.AddAttachment("Sales Invoice Header"."No." + '.pdf', '', InStr);
                            Message('OnAfterGetRecord')
                        end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        rSalesInvoiceHeaderTEMP.Reset;
        if rSalesInvoiceHeaderTEMP.FindSet then
            repeat
                if recCustomerMail.Get(rSalesInvoiceHeaderTEMP."Sell-to Customer No.") then
                    CheckValidEmailAddresses(recCustomerMail."E-Mail");
                fEnviaEmail(rSalesInvoiceHeaderTEMP."No.", rSalesInvoiceHeaderTEMP."Sell-to Customer No.",
                            rSalesInvoiceHeaderTEMP."Invoice Path", Text0010 + ' ' +
                            rSalesInvoiceHeaderTEMP."No." + ExtensionFile);
            until rSalesInvoiceHeaderTEMP.Next = 0;

        Message(Text0009);
    end;

    trigger OnPreReport()
    begin
        rSalesInvoiceHeaderTEMP.DeleteAll;
    end;

    var
        rEduConfiguration: Record "Edu. Configuration";
        rSalesInvoiceHeader: Record "Sales Invoice Header";
        rSalesInvoiceHeaderTEMP: Record "Sales Invoice Header" temporary;
        recCustomer: Record Customer;
        recCustomerMail: Record Customer;
        recUsersFamilyStudents: Record "Users Family / Students";
        rCompInfo: Record "Company Information";
        rSMTPFields: Record "SMTP Fields";
        ReportInvoice: Report "PTSS Sales - Invoice (PT)";
        cuPostServET: Codeunit "Post Services ET";
        Mail: Codeunit Mail;
        ErrorNo: Integer;
        Text001: Label 'The email address "%1" is invalid.';
        Text002: Label 'Attachment %1 does not exist or can not be accessed from the program.';
        Text003: Label 'The SMTP mail system returned the following error: %1';
        Text0005: Label 'E-mail Subject';
        Text0006: Label 'E-mail Body';
        rCommentLine: Record "Comment Line";
        int: Integer;
        ArrayBod: array[40] of Text[260];
        txtCRLF: Char;
        Text0007: Label 'MailBody.txt';
        Text0008: Label 'c:\Navision\';
        Text0009: Label 'Process Completed.';
        Text0010: Label 'Invoice';
        ExtensionFile: Label '.pdf';
        ServerSaveAsPdfFailedErr: Label 'Cannot open the document because it is empty or cannot be created.';
        ContMail: Integer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        InStr: InStream;
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";

    procedure fEnviaEmail(FactNo: Code[50]; FactCliente: Code[50]; FactPath: Text[260]; FileD: Text[260])
    var
        l_recSalesInvHead: Record "Sales Invoice Header";
    begin
        if recCustomerMail.Get(FactCliente) then
            CreateMessage(rCompInfo.Name, '', recCustomerMail."E-Mail", '', '', false, FactPath, FileD);
    end;

    procedure CreateMessage(SenderName: Text[100]; SenderAddress: Text[50]; Recipients: Text[1024]; Subject: Text[200]; Body: Text[1024]; HtmlFormatted: Boolean; FileN: Text[260]; FileDir: Text[260])
    var
        char10: Char;
        char13: Char;
    begin
        rSMTPFields.Get;
        rSMTPFields.TestField("SMTP Server Name");

        CheckValidEmailAddresses(rSMTPFields."E-Mail From");

        // if not IsNull(varMail) then begin
        //     varMail.Dispose;
        //     Clear(varMail);
        // end;

        // varMail.FromAddress := rSMTPFields."E-Mail From";
        // varMail.CC := rSMTPFields."E-Mail From Bcc";

        Subject := '';
        rCommentLine.Reset;
        rCommentLine.SetRange("Table Name", rCommentLine."Table Name"::"E-mail");
        rCommentLine.SetRange("No.", Text0005);
        rCommentLine.SetRange("Document Type", rCommentLine."Document Type"::Invoice);
        if rCommentLine.FindSet then begin
            int := rCommentLine.Count;
            repeat
                if int = 1 then begin
                    Subject := rCommentLine.Comment;
                    EmailMessage.SetSubject(Subject)
                end
                else begin
                    Subject := InsStr(Subject, ' ', StrLen(Subject) + 1);
                    Subject := InsStr(Subject, rCommentLine.Comment, StrLen(Subject) + 1);
                    EmailMessage.SetSubject(Subject)
                end;
            until rCommentLine.Next = 0;
        end;

        rCommentLine.Reset;
        rCommentLine.SetRange("Table Name", rCommentLine."Table Name"::"E-mail");
        rCommentLine.SetRange("No.", Text0006);
        rCommentLine.SetRange("Document Type", rCommentLine."Document Type"::Invoice);
        if rCommentLine.FindSet then begin
            int := rCommentLine.Count;
            char10 := 10;
            char13 := 13;
            repeat
                if int = 1 then
                    EmailMessage.SetBody(rCommentLine.Comment)
                else begin
                    EmailMessage.AppendToBody(Format(char13) + Format(char10) + rCommentLine.Comment)
                end;
            until rCommentLine.Next = 0;
        end;
        EmailMessage.Create(Recipients, Subject, Body, HtmlFormatted);
        Email.Send(EmailMessage);
    end;

    local procedure CheckValidEmailAddresses(Recipients: Text[1024])
    var
        s: Text[1024];
    begin
        if Recipients = '' then
            Error(Text001, Recipients);

        s := Recipients;
        while StrPos(s, ';') > 1 do begin
            CheckValidEmailAddress(CopyStr(s, 1, StrPos(s, ';') - 1));
            s := CopyStr(s, StrPos(s, ';') + 1);
        end;
        CheckValidEmailAddress(s);
    end;

    local procedure CheckValidEmailAddress(EmailAddress: Text[250])
    var
        i: Integer;
        NoOfAtSigns: Integer;
    begin
        if EmailAddress = '' then
            Error(Text001, EmailAddress);

        if (EmailAddress[1] = '@') or (EmailAddress[StrLen(EmailAddress)] = '@') then
            Error(Text001, EmailAddress);

        for i := 1 to StrLen(EmailAddress) do begin
            if EmailAddress[i] = '@' then
                NoOfAtSigns := NoOfAtSigns + 1;
            if not (
              ((EmailAddress[i] >= 'a') and (EmailAddress[i] <= 'z')) or
              ((EmailAddress[i] >= 'A') and (EmailAddress[i] <= 'Z')) or
              ((EmailAddress[i] >= '0') and (EmailAddress[i] <= '9')) or
              (EmailAddress[i] in ['@', '.', '-', '_']))
            then
                Error(Text001, EmailAddress);
        end;

        if NoOfAtSigns <> 1 then
            Error(Text001, EmailAddress);
    end;

    procedure SendEmailWithAttachment()
    var
        ReportExample: Report "Standard Sales - Invoice";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
    begin
        ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Standard Sales - Invoice", ReportParameters, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create('your email goes here', 'This is the subject', 'This is the body');
        EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

}

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DfltAdmin.aspx.cs" Inherits="Admin_DfltAdmin" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxRichEdit.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRichEdit" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
            text-align: center;
        }
        .auto-style3 {
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxLabel ID="lblError" runat="server" ForeColor="Red">
        </dx:ASPxLabel>
    
        <table class="auto-style1">
            <tr>
                <td style="width: 10%; vertical-align: top;">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RLBlogConfig %>" SelectCommand="SELECT [tema], [id] FROM [blog] WHERE [DELETE]!=1"></asp:SqlDataSource>
                    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="Nuevo">
                    </dx:ASPxButton>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="tema" DataValueField="id" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    </asp:RadioButtonList>
                </td>
                <td style="width: 5%">&nbsp;</td>
                <td style="width: 80%">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4" style="width: 20%">Tema:</td>
                            <td>
                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="width: 20%">&nbsp;</td>
                            <td>
                                <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server">
                                    <SettingsImageUpload UploadFolder="~/img/" UploadImageFolder="~/img/">
                                    </SettingsImageUpload>
                                    <SettingsFlashUpload UploadFolder="~/img/">
                                    </SettingsFlashUpload>
                                    <SettingsVideoUpload UploadFolder="~/img/">
                                    </SettingsVideoUpload>
                                    <SettingsAudioUpload UploadFolder="~/img/">
                                    </SettingsAudioUpload>
                                </dx:ASPxHtmlEditor>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="width: 20%">Imagen:</td>
                            <td>
                                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" AutoStartUpload="True" UploadMode="Auto" Width="100%" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True">
<AdvancedModeSettings EnableDragAndDrop="True" EnableMultiSelect="False" TemporaryFolder="~/img/">
<FileListItemStyle CssClass="pending dxucFileListItem"></FileListItemStyle>
</AdvancedModeSettings>
                                </dx:ASPxUploadControl>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4" style="width: 20%">Adjunto:</td>
                            <td>
                                <dx:ASPxUploadControl ID="ASPxUploadControl2" runat="server" AutoStartUpload="True" UploadMode="Auto" Width="100%" OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete" ShowProgressPanel="True">
                                    <AdvancedModeSettings EnableDragAndDrop="True" EnableMultiSelect="False" TemporaryFolder="~/img/">
<FileListItemStyle CssClass="pending dxucFileListItem"></FileListItemStyle>
</AdvancedModeSettings>
                                </dx:ASPxUploadControl>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3" style="width: 20%">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Eliminar" />
                            </td>
                            <td class="auto-style2">
                                <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click" Text="Guardar">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
